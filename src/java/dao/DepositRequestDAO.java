package dao;

import model.DepositRequest;
import utils.DBContext;

import java.math.BigDecimal;
import java.sql.*;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * ✅ FIXED: Data Access Object for deposit_requests table
 * - Sửa theo đúng database schema trong giupviec24h_ver23
 * - Fixed field mapping: status (không phải deposit_status)
 * - Fixed status values: pending, approved, rejected (không có completed)
 */
public class DepositRequestDAO {
    
    /**
     * ✅ FIXED: Create deposit request với correct schema
     */
    public int createDepositRequest(DepositRequest request) {
        String sql = "INSERT INTO deposit_requests (customer_id, wallet_id, amount, " +
                    "qr_reference_code, bank_account_number, bank_name, account_holder_name, " +
                    "customer_note, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'pending')";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, request.getUserId()); // customer_id
            ps.setInt(2, request.getWalletId());
            ps.setBigDecimal(3, request.getAmount());
            ps.setString(4, request.getGatewayTransactionId()); // qr_reference_code
            ps.setString(5, "1234567890"); // Default bank account
            ps.setString(6, "Vietcombank"); // Default bank name
            ps.setString(7, "NGUYEN VAN ADMIN"); // Default account holder
            ps.setString(8, "Yêu cầu nạp tiền qua VietQR"); // customer_note
            
            int affectedRows = ps.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int depositId = generatedKeys.getInt(1);
                    
                    System.out.println("✅ Deposit request created successfully:");
                    System.out.println("   - ID: " + depositId);
                    System.out.println("   - Customer: " + request.getUserId());
                    System.out.println("   - Amount: " + request.getAmount());
                    System.out.println("   - Reference: " + request.getGatewayTransactionId());
                    
                    return depositId;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error creating deposit request: " + e.getMessage());
            e.printStackTrace();
        }
        
        return -1;
    }
    
    /**
     * ✅ FIXED: Get deposit request by ID with correct field mapping
     */
    public DepositRequest getDepositRequestById(int depositId) {
        String sql = "SELECT dr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM deposit_requests dr " +
                    "JOIN users u ON dr.customer_id = u.user_id " +
                    "WHERE dr.deposit_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, depositId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToDepositRequest(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting deposit request by ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * ✅ FIXED: Get deposit requests by customer ID
     */
    public List<DepositRequest> getDepositRequestsByUserId(int customerId) {
        List<DepositRequest> requests = new ArrayList<>();
        String sql = "SELECT dr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM deposit_requests dr " +
                    "JOIN users u ON dr.customer_id = u.user_id " +
                    "WHERE dr.customer_id = ? " +
                    "ORDER BY dr.created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                requests.add(mapResultSetToDepositRequest(rs));
            }
            
            System.out.println("✅ Found " + requests.size() + " deposit requests for customer: " + customerId);
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting deposit requests by customer ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * ✅ FIXED: Get deposit requests by status (for staff)
     */
    public List<DepositRequest> getDepositRequestsByStatus(String status) {
        List<DepositRequest> requests = new ArrayList<>();
        String sql = "SELECT dr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM deposit_requests dr " +
                    "JOIN users u ON dr.customer_id = u.user_id " +
                    "WHERE dr.status = ? " +
                    "ORDER BY dr.created_at ASC"; // Oldest first for staff processing
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                requests.add(mapResultSetToDepositRequest(rs));
            }
            
            System.out.println("✅ Found " + requests.size() + " deposit requests with status: " + status);
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting deposit requests by status: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * ✅ FIXED: Count pending deposit requests
     */
    public int countPendingDepositRequests() {
        String sql = "SELECT COUNT(*) FROM deposit_requests WHERE status = 'pending'";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                int count = rs.getInt(1);
                System.out.println("📊 Pending deposit requests: " + count);
                return count;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error counting pending deposit requests: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    /**
     * ✅ COMPLETELY FIXED: Update deposit request status
     * - Sử dụng 'approved' thay vì 'completed' 
     * - Mapping đúng fields theo database schema
     */
    public boolean updateDepositRequestStatus(int depositId, String status, Integer processedBy, 
                                            String staffNote, String rejectionReason) {
        
        System.out.println("🔧 === UPDATING DEPOSIT REQUEST STATUS ===");
        System.out.println("   - Deposit ID: " + depositId);
        System.out.println("   - New status: " + status);
        System.out.println("   - Processed by: " + processedBy);
        System.out.println("   - Staff note: " + staffNote);
        
        // ✅ CRITICAL FIX: Use 'approved' instead of 'completed'
        String finalStatus = status;
        if ("completed".equals(status)) {
            finalStatus = "approved";
            System.out.println("🔄 Converting 'completed' to 'approved' for database compatibility");
        }
        
        String sql = "UPDATE deposit_requests SET status = ?, processed_by = ?, " +
                    "staff_note = ?, processed_at = SYSDATETIMEOFFSET() " +
                    "WHERE deposit_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, finalStatus);
            ps.setObject(2, processedBy);
            ps.setString(3, staffNote);
            ps.setInt(4, depositId);
            
            System.out.println("🔄 Executing SQL: " + sql);
            System.out.println("🔄 Parameters: status=" + finalStatus + ", processedBy=" + processedBy + ", depositId=" + depositId);
            
            int rowsUpdated = ps.executeUpdate();
            
            if (rowsUpdated > 0) {
                System.out.println("✅ Deposit request status updated successfully:");
                System.out.println("   - Rows updated: " + rowsUpdated);
                System.out.println("   - ID: " + depositId);
                System.out.println("   - Final status: " + finalStatus);
                System.out.println("   - Processed by: " + processedBy);
                System.out.println("   - Note: " + staffNote);
                return true;
            } else {
                System.err.println("❌ No rows updated - deposit request may not exist or already processed");
                return false;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ SQL Error updating deposit request status:");
            System.err.println("   - Error message: " + e.getMessage());
            System.err.println("   - SQL State: " + e.getSQLState());
            System.err.println("   - Error code: " + e.getErrorCode());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * ✅ FIXED: Find deposit request by QR reference code
     */
    public DepositRequest getDepositRequestByGatewayTransactionId(String qrReferenceCode) {
        String sql = "SELECT dr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM deposit_requests dr " +
                    "JOIN users u ON dr.customer_id = u.user_id " +
                    "WHERE dr.qr_reference_code = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, qrReferenceCode);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToDepositRequest(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting deposit request by QR reference: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * ✅ FIXED: Check if deposit request expired (2 hours limit)
     */
    public boolean isDepositRequestExpired(int depositId) {
        String sql = "SELECT created_at FROM deposit_requests WHERE deposit_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, depositId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Timestamp createdTimestamp = rs.getTimestamp("created_at");
                if (createdTimestamp != null) {
                    OffsetDateTime createdAt = createdTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00"));
                    OffsetDateTime expiredAt = createdAt.plusHours(2); // 2 hours expiration
                    boolean expired = OffsetDateTime.now().isAfter(expiredAt);
                    
                    if (expired) {
                        System.out.println("⏰ Deposit request " + depositId + " has expired");
                    }
                    
                    return expired;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error checking deposit request expiration: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Get all deposit requests (for admin)
     */
    public List<DepositRequest> getAllDepositRequests() {
        List<DepositRequest> requests = new ArrayList<>();
        String sql = "SELECT dr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM deposit_requests dr " +
                    "JOIN users u ON dr.customer_id = u.user_id " +
                    "ORDER BY dr.created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                requests.add(mapResultSetToDepositRequest(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting all deposit requests: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * Get pending deposits with pagination (for staff)
     */
    public List<DepositRequest> getPendingDepositRequests(int offset, int limit) {
        List<DepositRequest> requests = new ArrayList<>();
        String sql = "SELECT dr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM deposit_requests dr " +
                    "JOIN users u ON dr.customer_id = u.user_id " +
                    "WHERE dr.status = 'pending' " +
                    "ORDER BY dr.created_at ASC " +
                    "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                requests.add(mapResultSetToDepositRequest(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting pending deposit requests with pagination: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * Delete deposit request (use with caution)
     */
    public boolean deleteDepositRequest(int depositId) {
        String sql = "DELETE FROM deposit_requests WHERE deposit_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, depositId);
            boolean deleted = ps.executeUpdate() > 0;
            
            if (deleted) {
                System.out.println("🗑️ Deposit request " + depositId + " deleted");
            }
            
            return deleted;
            
        } catch (SQLException e) {
            System.err.println("❌ Error deleting deposit request: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * ✅ COMPLETELY FIXED: Map ResultSet to DepositRequest object for correct schema
     */
    private DepositRequest mapResultSetToDepositRequest(ResultSet rs) throws SQLException {
        DepositRequest request = new DepositRequest();
        
        request.setDepositId(rs.getInt("deposit_request_id"));
        request.setWalletId(rs.getInt("wallet_id"));
        request.setUserId(rs.getInt("customer_id"));
        request.setAmount(rs.getBigDecimal("amount"));
        
        // ✅ FIXED: Map correct fields from deposit_requests table
        request.setGatewayTransactionId(rs.getString("qr_reference_code"));
        request.setGatewayName("vietqr"); // Set default gateway name
        request.setDepositStatus(rs.getString("status")); // ✅ Use 'status' field
        request.setAdminNote(rs.getString("staff_note"));
        
        // Set processed by (nullable)
        int processedBy = rs.getInt("processed_by");
        if (!rs.wasNull()) {
            request.setProcessedBy(processedBy);
        }
        
        // Set user information
        request.setUserFullName(rs.getString("user_full_name"));
        request.setUserEmail(rs.getString("user_email"));
        
        // Handle OffsetDateTime - created_at
        Timestamp createdTimestamp = rs.getTimestamp("created_at");
        if (createdTimestamp != null) {
            request.setRequestedAt(createdTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        // Handle OffsetDateTime - processed_at
        Timestamp processedTimestamp = rs.getTimestamp("processed_at");
        if (processedTimestamp != null) {
            request.setCompletedAt(processedTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        // Calculate expiration (2 hours from creation)
        if (request.getRequestedAt() != null) {
            request.setExpiredAt(request.getRequestedAt().plusHours(2));
        }
        
        return request;
    }
}