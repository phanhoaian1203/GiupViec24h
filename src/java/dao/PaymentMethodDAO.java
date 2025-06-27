package dao;

import model.PaymentMethod;
import utils.DBContext;

import java.sql.*;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * ✅ ENHANCED: PaymentMethodDAO với database thực và bootstrap functionality
 * - Kết nối và thao tác database thật
 * - Bootstrap demo payment methods for new users
 * - Full CRUD operations
 */
public class PaymentMethodDAO {
    
    /**
     * ✅ ENHANCED: Tạo payment method trong database
     */
    public int createPaymentMethod(PaymentMethod paymentMethod) {
        Connection conn = null;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            System.out.println("🏦 === CREATING PAYMENT METHOD ===");
            System.out.println("   - User: " + paymentMethod.getUserId());
            System.out.println("   - Bank: " + paymentMethod.getBankName());
            System.out.println("   - Account: " + paymentMethod.getAccountNumber());
            System.out.println("   - Holder: " + paymentMethod.getAccountHolderName());
            System.out.println("   - Is Default: " + paymentMethod.isDefault());
            
            // Nếu đây là default method, clear existing defaults trước
            if (paymentMethod.isDefault()) {
                String clearDefaultSql = "UPDATE payment_methods SET is_default = 0 WHERE user_id = ?";
                try (PreparedStatement clearPs = conn.prepareStatement(clearDefaultSql)) {
                    clearPs.setInt(1, paymentMethod.getUserId());
                    clearPs.executeUpdate();
                    System.out.println("🔄 Cleared existing default payment methods");
                }
            }
            
            // Tạo payment method mới
            String sql = "INSERT INTO payment_methods (user_id, method_type, method_name, " +
                        "account_number, bank_name, account_holder_name, is_default, " +
                        "verification_status, verified_at) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, 'verified', SYSDATETIMEOFFSET())";
            
            try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, paymentMethod.getUserId());
                ps.setString(2, paymentMethod.getMethodType() != null ? paymentMethod.getMethodType() : "bank_account");
                ps.setString(3, paymentMethod.getMethodName());
                ps.setString(4, paymentMethod.getAccountNumber());
                ps.setString(5, paymentMethod.getBankName());
                ps.setString(6, paymentMethod.getAccountHolderName());
                ps.setBoolean(7, paymentMethod.isDefault());
                
                int affectedRows = ps.executeUpdate();
                
                if (affectedRows > 0) {
                    ResultSet generatedKeys = ps.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int methodId = generatedKeys.getInt(1);
                        
                        conn.commit();
                        
                        System.out.println("✅ Payment method created successfully with ID: " + methodId);
                        System.out.println("   - Bank: " + paymentMethod.getBankName());
                        System.out.println("   - Account: ****" + paymentMethod.getAccountNumber().substring(Math.max(0, paymentMethod.getAccountNumber().length() - 4)));
                        System.out.println("   - Is default: " + paymentMethod.isDefault());
                        
                        return methodId;
                    }
                }
            }
            
            conn.rollback();
            return -1;
            
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            System.err.println("❌ Error creating payment method: " + e.getMessage());
            e.printStackTrace();
            return -1;
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    /**
     * ✅ NEW: Bootstrap demo payment methods for new user
     */
    public boolean bootstrapPaymentMethodsForUser(int userId, String userFullName) {
        try {
            System.out.println("🚀 === BOOTSTRAPPING PAYMENT METHODS ===");
            System.out.println("   - User ID: " + userId);
            System.out.println("   - Full Name: " + userFullName);
            
            // Check if user already has payment methods
            List<PaymentMethod> existing = getVerifiedPaymentMethods(userId);
            if (existing != null && !existing.isEmpty()) {
                System.out.println("⚠️ User already has payment methods, skipping bootstrap");
                return true;
            }
            
            boolean success = true;
            
            // Create demo payment method 1: Vietcombank (Default)
            PaymentMethod method1 = new PaymentMethod(
                userId, 
                "bank_account", 
                "Tài khoản chính", 
                generateDemoAccountNumber("VCB"), 
                "Vietcombank", 
                userFullName
            );
            method1.setDefault(true);
            method1.setVerificationStatus("verified");
            
            int method1Id = createPaymentMethod(method1);
            if (method1Id <= 0) {
                success = false;
                System.err.println("❌ Failed to create demo method 1");
            } else {
                System.out.println("✅ Created demo method 1: Vietcombank (ID: " + method1Id + ")");
            }
            
            // Create demo payment method 2: Techcombank
            PaymentMethod method2 = new PaymentMethod(
                userId, 
                "bank_account", 
                "Tài khoản phụ", 
                generateDemoAccountNumber("TCB"), 
                "Techcombank", 
                userFullName
            );
            method2.setDefault(false);
            method2.setVerificationStatus("verified");
            
            int method2Id = createPaymentMethod(method2);
            if (method2Id <= 0) {
                success = false;
                System.err.println("❌ Failed to create demo method 2");
            } else {
                System.out.println("✅ Created demo method 2: Techcombank (ID: " + method2Id + ")");
            }
            
            if (success) {
                System.out.println("✅ Successfully bootstrapped payment methods for user: " + userId);
            } else {
                System.err.println("❌ Some errors occurred during bootstrap for user: " + userId);
            }
            
            return success;
            
        } catch (Exception e) {
            System.err.println("❌ Error bootstrapping payment methods: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * ✅ NEW: Generate demo account number
     */
    private String generateDemoAccountNumber(String bankPrefix) {
        // Generate a realistic-looking account number
        String baseNumber = String.valueOf(System.currentTimeMillis());
        
        switch (bankPrefix) {
            case "VCB":
                return "1234" + baseNumber.substring(baseNumber.length() - 6);
            case "TCB":
                return "8765" + baseNumber.substring(baseNumber.length() - 6);
            case "BIDV":
                return "9876" + baseNumber.substring(baseNumber.length() - 6);
            case "MBB":
                return "5432" + baseNumber.substring(baseNumber.length() - 6);
            default:
                return "0000" + baseNumber.substring(baseNumber.length() - 6);
        }
    }
    
    /**
     * ✅ THỰC: Lấy payment method theo ID
     */
    public PaymentMethod getPaymentMethodById(int methodId) {
        String sql = "SELECT * FROM payment_methods WHERE method_id = ? AND is_active = 1";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, methodId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                PaymentMethod method = mapResultSetToPaymentMethod(rs);
                System.out.println("✅ Found payment method: " + method.getMethodName() + " - " + method.getBankName());
                return method;
            }
            
            System.out.println("⚠️ Payment method not found for ID: " + methodId);
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting payment method by ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * ✅ THỰC: Lấy tất cả payment methods của user
     */
    public List<PaymentMethod> getPaymentMethodsByUserId(int userId) {
        List<PaymentMethod> methods = new ArrayList<>();
        String sql = "SELECT * FROM payment_methods WHERE user_id = ? AND is_active = 1 " +
                    "ORDER BY is_default DESC, created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                methods.add(mapResultSetToPaymentMethod(rs));
            }
            
            System.out.println("✅ Found " + methods.size() + " payment methods for user: " + userId);
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting payment methods by user ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return methods;
    }
    
    /**
     * ✅ ENHANCED: Lấy payment methods đã verified của user với auto-bootstrap
     */
    public List<PaymentMethod> getVerifiedPaymentMethods(int userId) {
        List<PaymentMethod> methods = new ArrayList<>();
        String sql = "SELECT * FROM payment_methods WHERE user_id = ? AND is_active = 1 " +
                    "AND verification_status = 'verified' " +
                    "ORDER BY is_default DESC, created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                methods.add(mapResultSetToPaymentMethod(rs));
            }
            
            System.out.println("✅ Found " + methods.size() + " verified payment methods for user: " + userId);
            
            // ✅ AUTO-BOOTSTRAP: If no methods found, try to get user info and create demo methods
            if (methods.isEmpty()) {
                System.out.println("🔧 No verified payment methods found, attempting auto-bootstrap...");
                
                String userFullName = getUserFullName(userId);
                if (userFullName != null) {
                    boolean bootstrapped = bootstrapPaymentMethodsForUser(userId, userFullName);
                    if (bootstrapped) {
                        // Re-query after bootstrap
                        try (PreparedStatement ps2 = conn.prepareStatement(sql)) {
                            ps2.setInt(1, userId);
                            ResultSet rs2 = ps2.executeQuery();
                            
                            while (rs2.next()) {
                                methods.add(mapResultSetToPaymentMethod(rs2));
                            }
                            
                            System.out.println("✅ After bootstrap: " + methods.size() + " payment methods available");
                        }
                    }
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting verified payment methods: " + e.getMessage());
            e.printStackTrace();
        }
        
        return methods;
    }
    
    /**
     * ✅ NEW: Get user full name for bootstrap
     */
    private String getUserFullName(int userId) {
        String sql = "SELECT full_name FROM users WHERE user_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String fullName = rs.getString("full_name");
                System.out.println("✅ Found user full name: " + fullName);
                return fullName;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting user full name: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * ✅ THỰC: Lấy default payment method của user
     */
    public PaymentMethod getDefaultPaymentMethod(int userId) {
        String sql = "SELECT * FROM payment_methods WHERE user_id = ? AND is_default = 1 " +
                    "AND is_active = 1 AND verification_status = 'verified'";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                PaymentMethod method = mapResultSetToPaymentMethod(rs);
                System.out.println("✅ Found default payment method: " + method.getMethodName());
                return method;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting default payment method: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * ✅ THỰC: Cập nhật payment method
     */
    public boolean updatePaymentMethod(PaymentMethod paymentMethod) {
        Connection conn = null;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            // Nếu đây là default method, clear existing defaults trước
            if (paymentMethod.isDefault()) {
                String clearDefaultSql = "UPDATE payment_methods SET is_default = 0 WHERE user_id = ? AND method_id != ?";
                try (PreparedStatement clearPs = conn.prepareStatement(clearDefaultSql)) {
                    clearPs.setInt(1, paymentMethod.getUserId());
                    clearPs.setInt(2, paymentMethod.getMethodId());
                    clearPs.executeUpdate();
                }
            }
            
            String sql = "UPDATE payment_methods SET method_type = ?, method_name = ?, " +
                        "account_number = ?, bank_name = ?, account_holder_name = ?, " +
                        "is_default = ?, is_active = ? " +
                        "WHERE method_id = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, paymentMethod.getMethodType());
                ps.setString(2, paymentMethod.getMethodName());
                ps.setString(3, paymentMethod.getAccountNumber());
                ps.setString(4, paymentMethod.getBankName());
                ps.setString(5, paymentMethod.getAccountHolderName());
                ps.setBoolean(6, paymentMethod.isDefault());
                ps.setBoolean(7, paymentMethod.isActive());
                ps.setInt(8, paymentMethod.getMethodId());
                
                boolean updated = ps.executeUpdate() > 0;
                
                if (updated) {
                    conn.commit();
                    System.out.println("✅ Payment method updated successfully: " + paymentMethod.getMethodId());
                } else {
                    conn.rollback();
                }
                
                return updated;
            }
            
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            System.err.println("❌ Error updating payment method: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    /**
     * ✅ THỰC: Xóa payment method (deactivate)
     */
    public boolean deactivatePaymentMethod(int methodId) {
        String sql = "UPDATE payment_methods SET is_active = 0, is_default = 0 WHERE method_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, methodId);
            boolean updated = ps.executeUpdate() > 0;
            
            if (updated) {
                System.out.println("✅ Payment method deactivated: " + methodId);
            }
            
            return updated;
            
        } catch (SQLException e) {
            System.err.println("❌ Error deactivating payment method: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * ✅ THỰC: Kiểm tra user có payment methods verified không
     */
    public boolean hasVerifiedPaymentMethods(int userId) {
        String sql = "SELECT COUNT(*) FROM payment_methods WHERE user_id = ? " +
                    "AND is_active = 1 AND verification_status = 'verified'";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                boolean hasVerified = rs.getInt(1) > 0;
                System.out.println("💳 User " + userId + " has verified payment methods: " + hasVerified);
                return hasVerified;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error checking verified payment methods: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * ✅ HELPER: Map ResultSet to PaymentMethod object
     */
    private PaymentMethod mapResultSetToPaymentMethod(ResultSet rs) throws SQLException {
        PaymentMethod method = new PaymentMethod();
        
        method.setMethodId(rs.getInt("method_id"));
        method.setUserId(rs.getInt("user_id"));
        method.setMethodType(rs.getString("method_type"));
        method.setMethodName(rs.getString("method_name"));
        method.setAccountNumber(rs.getString("account_number"));
        method.setBankName(rs.getString("bank_name"));
        method.setAccountHolderName(rs.getString("account_holder_name"));
        method.setDefault(rs.getBoolean("is_default"));
        method.setActive(rs.getBoolean("is_active"));
        method.setVerificationStatus(rs.getString("verification_status"));
        
        // Handle timestamps
        Timestamp createdTimestamp = rs.getTimestamp("created_at");
        if (createdTimestamp != null) {
            method.setCreatedAt(createdTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        Timestamp verifiedTimestamp = rs.getTimestamp("verified_at");
        if (verifiedTimestamp != null) {
            method.setVerifiedAt(verifiedTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        return method;
    }
}