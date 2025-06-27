package dao;

import model.WithdrawalRequest;
import utils.DBContext;

import java.math.BigDecimal;
import java.sql.*;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * ✅ COMPLETE: Data Access Object for withdrawal_requests table
 * - Full CRUD operations for withdrawal requests
 * - Support for staff approval/rejection workflow
 * - Enhanced error handling and logging
 * - Fixed field mapping to match database schema
 */
public class WithdrawalRequestDAO {
    
    /**
     * Create withdrawal request
     */
    public int createWithdrawalRequest(WithdrawalRequest request) {
        String sql = "INSERT INTO withdrawal_requests (customer_id, wallet_id, amount, " +
                    "recipient_bank_account, recipient_bank_name, recipient_account_holder, " +
                    "customer_note, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, 'pending')";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, request.getUserId()); // customer_id
            ps.setInt(2, request.getWalletId());
            ps.setBigDecimal(3, request.getAmount());
            ps.setString(4, request.getAccountNumber() != null ? request.getAccountNumber() : "");
            ps.setString(5, request.getBankName() != null ? request.getBankName() : "");
            ps.setString(6, request.getAccountHolderName() != null ? request.getAccountHolderName() : "");
            ps.setString(7, "Yêu cầu rút tiền"); // customer_note
            
            int affectedRows = ps.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int withdrawalId = generatedKeys.getInt(1);
                    
                    System.out.println("✅ Withdrawal request created successfully:");
                    System.out.println("   - ID: " + withdrawalId);
                    System.out.println("   - Customer: " + request.getUserId());
                    System.out.println("   - Amount: " + request.getAmount());
                    System.out.println("   - Bank: " + request.getBankName());
                    
                    return withdrawalId;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error creating withdrawal request: " + e.getMessage());
            e.printStackTrace();
        }
        
        return -1;
    }
    
    /**
     * Get withdrawal request by ID with user and payment method info
     */
    public WithdrawalRequest getWithdrawalRequestById(int withdrawalId) {
        String sql = "SELECT wr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM withdrawal_requests wr " +
                    "JOIN users u ON wr.customer_id = u.user_id " +
                    "WHERE wr.withdrawal_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, withdrawalId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToWithdrawalRequest(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting withdrawal request by ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * Get withdrawal requests by customer ID
     */
    public List<WithdrawalRequest> getWithdrawalRequestsByUserId(int customerId) {
        List<WithdrawalRequest> requests = new ArrayList<>();
        String sql = "SELECT wr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM withdrawal_requests wr " +
                    "JOIN users u ON wr.customer_id = u.user_id " +
                    "WHERE wr.customer_id = ? " +
                    "ORDER BY wr.created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                requests.add(mapResultSetToWithdrawalRequest(rs));
            }
            
            System.out.println("✅ Found " + requests.size() + " withdrawal requests for customer: " + customerId);
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting withdrawal requests by customer ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * Get withdrawal requests by status (for staff)
     */
    public List<WithdrawalRequest> getWithdrawalRequestsByStatus(String status) {
        List<WithdrawalRequest> requests = new ArrayList<>();
        String sql = "SELECT wr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM withdrawal_requests wr " +
                    "JOIN users u ON wr.customer_id = u.user_id " +
                    "WHERE wr.status = ? " +
                    "ORDER BY wr.created_at ASC"; // Oldest first for staff processing
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                requests.add(mapResultSetToWithdrawalRequest(rs));
            }
            
            System.out.println("✅ Found " + requests.size() + " withdrawal requests with status: " + status);
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting withdrawal requests by status: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * Count pending withdrawal requests
     */
    public int countPendingWithdrawalRequests() {
        String sql = "SELECT COUNT(*) FROM withdrawal_requests WHERE status = 'pending'";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                int count = rs.getInt(1);
                System.out.println("📊 Pending withdrawal requests: " + count);
                return count;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error counting pending withdrawal requests: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    /**
     * Update withdrawal request status
     */
    public boolean updateWithdrawalRequestStatus(int withdrawalId, String status, Integer processedBy, 
                                               String staffNote, String bankTransactionId) {
        String sql = "UPDATE withdrawal_requests SET status = ?, processed_by = ?, " +
                    "staff_note = ?, processed_at = SYSDATETIMEOFFSET(), updated_at = SYSDATETIMEOFFSET()";
        
        // Add completed_at for completed status
        if ("completed".equals(status)) {
            sql += ", completed_at = SYSDATETIMEOFFSET()";
        }
        
        sql += " WHERE withdrawal_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ps.setObject(2, processedBy);
            ps.setString(3, staffNote);
            ps.setInt(4, withdrawalId);
            
            boolean updated = ps.executeUpdate() > 0;
            
            if (updated) {
                System.out.println("✅ Withdrawal request status updated:");
                System.out.println("   - ID: " + withdrawalId);
                System.out.println("   - Status: " + status);
                System.out.println("   - Processed by: " + processedBy);
                System.out.println("   - Note: " + staffNote);
            }
            
            return updated;
            
        } catch (SQLException e) {
            System.err.println("❌ Error updating withdrawal request status: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Get all withdrawal requests (for admin)
     */
    public List<WithdrawalRequest> getAllWithdrawalRequests() {
        List<WithdrawalRequest> requests = new ArrayList<>();
        String sql = "SELECT wr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM withdrawal_requests wr " +
                    "JOIN users u ON wr.customer_id = u.user_id " +
                    "ORDER BY wr.created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                requests.add(mapResultSetToWithdrawalRequest(rs));
            }
            
            System.out.println("✅ Retrieved " + requests.size() + " total withdrawal requests");
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting all withdrawal requests: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * Get pending withdrawals with pagination (for staff)
     */
    public List<WithdrawalRequest> getPendingWithdrawalRequests(int offset, int limit) {
        List<WithdrawalRequest> requests = new ArrayList<>();
        String sql = "SELECT wr.*, u.full_name as user_full_name, u.email as user_email " +
                    "FROM withdrawal_requests wr " +
                    "JOIN users u ON wr.customer_id = u.user_id " +
                    "WHERE wr.status = 'pending' " +
                    "ORDER BY wr.created_at ASC " +
                    "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                requests.add(mapResultSetToWithdrawalRequest(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting pending withdrawal requests with pagination: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    /**
     * Delete withdrawal request (use with caution)
     */
    public boolean deleteWithdrawalRequest(int withdrawalId) {
        String sql = "DELETE FROM withdrawal_requests WHERE withdrawal_request_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, withdrawalId);
            boolean deleted = ps.executeUpdate() > 0;
            
            if (deleted) {
                System.out.println("🗑️ Withdrawal request " + withdrawalId + " deleted");
            }
            
            return deleted;
            
        } catch (SQLException e) {
            System.err.println("❌ Error deleting withdrawal request: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * ✅ FIXED: Map ResultSet to WithdrawalRequest object
     */
    private WithdrawalRequest mapResultSetToWithdrawalRequest(ResultSet rs) throws SQLException {
        WithdrawalRequest request = new WithdrawalRequest();
        
        request.setWithdrawalId(rs.getInt("withdrawal_request_id"));
        request.setWalletId(rs.getInt("wallet_id"));
        request.setUserId(rs.getInt("customer_id"));
        request.setAmount(rs.getBigDecimal("amount"));
        
        // Map fields from withdrawal_requests table
        request.setWithdrawalStatus(rs.getString("status"));
        request.setAdminNote(rs.getString("staff_note"));
        
        // Set bank information from withdrawal_requests table
        request.setBankName(rs.getString("recipient_bank_name"));
        request.setAccountNumber(rs.getString("recipient_bank_account"));
        request.setAccountHolderName(rs.getString("recipient_account_holder"));
        
        // Calculate fee and net amount
        BigDecimal amount = request.getAmount();
        if (amount != null) {
            // Calculate fee (0.5% with min 5,000 and max 50,000)
            BigDecimal feePercentage = new BigDecimal("0.005");
            BigDecimal minFee = new BigDecimal("5000");
            BigDecimal maxFee = new BigDecimal("50000");
            
            BigDecimal calculatedFee = amount.multiply(feePercentage);
            BigDecimal fee;
            
            if (calculatedFee.compareTo(minFee) < 0) {
                fee = minFee;
            } else if (calculatedFee.compareTo(maxFee) > 0) {
                fee = maxFee;
            } else {
                fee = calculatedFee.setScale(0, BigDecimal.ROUND_UP);
            }
            
            request.setFee(fee);
            request.setNetAmount(amount.subtract(fee));
        }
        
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
            request.setProcessedAt(processedTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        // Handle OffsetDateTime - completed_at
        Timestamp completedTimestamp = rs.getTimestamp("completed_at");
        if (completedTimestamp != null) {
            request.setCompletedAt(completedTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        return request;
    }
}