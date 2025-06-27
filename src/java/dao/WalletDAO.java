package dao;

import model.Wallet;
import utils.DBContext;

import java.math.BigDecimal;
import java.sql.*;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * ✅ WalletDAO Enhanced - Bổ sung wallet hold functionality
 */
public class WalletDAO {
    
    /**
     * ✅ Get wallet by customer ID
     */
    public Wallet getWalletByUserId(int customerId) {
        String sql = "SELECT * FROM customer_wallets WHERE customer_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToWallet(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting wallet by customer ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * Get wallet by wallet ID
     */
    public Wallet getWalletById(int walletId) {
        String sql = "SELECT * FROM customer_wallets WHERE wallet_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, walletId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToWallet(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting wallet by ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * ✅ Create wallet for customer
     */
    public boolean createWallet(Wallet wallet) {
        String sql = "INSERT INTO customer_wallets (customer_id, balance, total_deposited, total_withdrawn, is_active) " +
                    "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, wallet.getCustomerId());
            ps.setBigDecimal(2, wallet.getBalance());
            ps.setBigDecimal(3, wallet.getTotalDeposited());
            ps.setBigDecimal(4, wallet.getTotalWithdrawn());
            ps.setBoolean(5, wallet.isActive());
            
            int affectedRows = ps.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    wallet.setWalletId(generatedKeys.getInt(1));
                    System.out.println("✅ Wallet created successfully with ID: " + wallet.getWalletId());
                    return true;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error creating wallet: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * ✅ NEW: Hold amount for booking (tạm giữ tiền)
     */
    public boolean holdAmount(int walletId, BigDecimal amount, String holdReference, String description) {
        Connection conn = null;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            System.out.println("💳 === HOLDING AMOUNT ===");
            System.out.println("   - Wallet ID: " + walletId);
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Hold Reference: " + holdReference);
            
            // 1. Check wallet balance
            Wallet wallet = getWalletById(walletId);
            if (wallet == null) {
                System.err.println("❌ Wallet not found: " + walletId);
                return false;
            }
            
            if (wallet.getBalance().compareTo(amount) < 0) {
                System.err.println("❌ Insufficient balance. Required: " + amount + ", Available: " + wallet.getBalance());
                return false;
            }
            
            // 2. Update wallet balance (subtract held amount)
            BigDecimal newBalance = wallet.getBalance().subtract(amount);
            String updateWalletSql = "UPDATE customer_wallets SET balance = ?, updated_at = SYSDATETIMEOFFSET() WHERE wallet_id = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(updateWalletSql)) {
                ps.setBigDecimal(1, newBalance);
                ps.setInt(2, walletId);
                
                int walletUpdated = ps.executeUpdate();
                if (walletUpdated == 0) {
                    System.err.println("❌ Failed to update wallet balance");
                    conn.rollback();
                    return false;
                }
            }
            
            // 3. Create wallet hold record (if wallet_holds table exists)
            try {
                String holdSql = """
                    INSERT INTO wallet_holds (wallet_id, amount, status, hold_reference, description, expires_at)
                    VALUES (?, ?, 'active', ?, ?, ?)
                    """;
                
                try (PreparedStatement ps = conn.prepareStatement(holdSql)) {
                    ps.setInt(1, walletId);
                    ps.setBigDecimal(2, amount);
                    ps.setString(3, holdReference);
                    ps.setString(4, description);
                    ps.setObject(5, OffsetDateTime.now().plusHours(48)); // Hold expires in 48 hours
                    
                    ps.executeUpdate();
                    System.out.println("✅ Wallet hold record created");
                }
            } catch (SQLException e) {
                System.err.println("⚠️ Warning: Could not create hold record (table may not exist): " + e.getMessage());
                // Continue without hold record
            }
            
            // 4. Create transaction record
            try {
                String transactionSql = """
                    INSERT INTO wallet_transactions 
                    (wallet_id, transaction_type, amount, balance_before, balance_after, description, reference_id, reference_type)
                    VALUES (?, 'hold', ?, ?, ?, ?, ?, 'booking')
                    """;
                
                try (PreparedStatement ps = conn.prepareStatement(transactionSql)) {
                    ps.setInt(1, walletId);
                    ps.setBigDecimal(2, amount);
                    ps.setBigDecimal(3, wallet.getBalance());
                    ps.setBigDecimal(4, newBalance);
                    ps.setString(5, "Hold for " + description + " - Ref: " + holdReference);
                    ps.setString(6, holdReference);
                    
                    ps.executeUpdate();
                    System.out.println("✅ Transaction record created");
                }
            } catch (SQLException e) {
                System.err.println("⚠️ Warning: Could not create transaction record: " + e.getMessage());
                // Continue without transaction record
            }
            
            conn.commit();
            
            System.out.println("✅ === HOLD COMPLETED ===");
            System.out.println("   - Previous balance: " + wallet.getBalance());
            System.out.println("   - Amount held: " + amount);
            System.out.println("   - New balance: " + newBalance);
            
            return true;
            
        } catch (SQLException e) {
            System.err.println("❌ Error holding amount: " + e.getMessage());
            e.printStackTrace();
            
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
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
     * ✅ NEW: Capture hold (chuyển từ hold thành thanh toán thực)
     */
    public boolean captureHold(String holdReference) {
        System.out.println("💰 === CAPTURING HOLD ===");
        System.out.println("   - Hold Reference: " + holdReference);
        
        try (Connection conn = DBContext.getConnection()) {
            // Update hold status if table exists
            try {
                String updateHoldSql = "UPDATE wallet_holds SET status = 'captured', captured_at = SYSDATETIMEOFFSET() WHERE hold_reference = ? AND status = 'active'";
                
                try (PreparedStatement ps = conn.prepareStatement(updateHoldSql)) {
                    ps.setString(1, holdReference);
                    int updated = ps.executeUpdate();
                    
                    if (updated > 0) {
                        System.out.println("✅ Hold captured successfully");
                        return true;
                    } else {
                        System.err.println("❌ Hold not found or already processed: " + holdReference);
                        return false;
                    }
                }
            } catch (SQLException e) {
                System.err.println("⚠️ Warning: wallet_holds table may not exist: " + e.getMessage());
                // If table doesn't exist, assume capture is successful
                return true;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error capturing hold: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * ✅ NEW: Release hold (hoàn tiền từ hold)
     */
    public boolean releaseHold(String holdReference) {
        Connection conn = null;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            System.out.println("💸 === RELEASING HOLD ===");
            System.out.println("   - Hold Reference: " + holdReference);
            
            // 1. Get hold information
            BigDecimal holdAmount = null;
            int walletId = 0;
            
            try {
                String getHoldSql = "SELECT wallet_id, amount FROM wallet_holds WHERE hold_reference = ? AND status = 'active'";
                
                try (PreparedStatement ps = conn.prepareStatement(getHoldSql)) {
                    ps.setString(1, holdReference);
                    ResultSet rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        walletId = rs.getInt("wallet_id");
                        holdAmount = rs.getBigDecimal("amount");
                    } else {
                        System.err.println("❌ Hold not found or already processed: " + holdReference);
                        return false;
                    }
                }
            } catch (SQLException e) {
                System.err.println("⚠️ Warning: wallet_holds table may not exist, trying alternative method");
                
                // Alternative: Try to extract amount from transaction records
                try {
                    String getTransactionSql = "SELECT wallet_id, amount FROM wallet_transactions WHERE reference_id = ? AND transaction_type = 'hold' ORDER BY created_at DESC";
                    
                    try (PreparedStatement ps = conn.prepareStatement(getTransactionSql)) {
                        ps.setString(1, holdReference);
                        ResultSet rs = ps.executeQuery();
                        
                        if (rs.next()) {
                            walletId = rs.getInt("wallet_id");
                            holdAmount = rs.getBigDecimal("amount");
                        }
                    }
                } catch (SQLException ex) {
                    System.err.println("❌ Could not find hold information: " + ex.getMessage());
                    return false;
                }
            }
            
            if (holdAmount == null || walletId == 0) {
                System.err.println("❌ Invalid hold information");
                return false;
            }
            
            // 2. Get current wallet balance
            Wallet wallet = getWalletById(walletId);
            if (wallet == null) {
                System.err.println("❌ Wallet not found: " + walletId);
                return false;
            }
            
            // 3. Restore wallet balance
            BigDecimal newBalance = wallet.getBalance().add(holdAmount);
            String updateWalletSql = "UPDATE customer_wallets SET balance = ?, updated_at = SYSDATETIMEOFFSET() WHERE wallet_id = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(updateWalletSql)) {
                ps.setBigDecimal(1, newBalance);
                ps.setInt(2, walletId);
                
                int walletUpdated = ps.executeUpdate();
                if (walletUpdated == 0) {
                    System.err.println("❌ Failed to update wallet balance");
                    conn.rollback();
                    return false;
                }
            }
            
            // 4. Update hold status
            try {
                String updateHoldSql = "UPDATE wallet_holds SET status = 'released', released_at = SYSDATETIMEOFFSET() WHERE hold_reference = ?";
                
                try (PreparedStatement ps = conn.prepareStatement(updateHoldSql)) {
                    ps.setString(1, holdReference);
                    ps.executeUpdate();
                }
            } catch (SQLException e) {
                // Table may not exist, continue
            }
            
            // 5. Create refund transaction record
            try {
                String transactionSql = """
                    INSERT INTO wallet_transactions 
                    (wallet_id, transaction_type, amount, balance_before, balance_after, description, reference_id, reference_type)
                    VALUES (?, 'refund', ?, ?, ?, ?, ?, 'booking')
                    """;
                
                try (PreparedStatement ps = conn.prepareStatement(transactionSql)) {
                    ps.setInt(1, walletId);
                    ps.setBigDecimal(2, holdAmount);
                    ps.setBigDecimal(3, wallet.getBalance());
                    ps.setBigDecimal(4, newBalance);
                    ps.setString(5, "Refund from hold - Ref: " + holdReference);
                    ps.setString(6, holdReference);
                    
                    ps.executeUpdate();
                }
            } catch (SQLException e) {
                System.err.println("⚠️ Warning: Could not create refund transaction record: " + e.getMessage());
            }
            
            conn.commit();
            
            System.out.println("✅ === HOLD RELEASED ===");
            System.out.println("   - Previous balance: " + wallet.getBalance());
            System.out.println("   - Amount released: " + holdAmount);
            System.out.println("   - New balance: " + newBalance);
            
            return true;
            
        } catch (SQLException e) {
            System.err.println("❌ Error releasing hold: " + e.getMessage());
            e.printStackTrace();
            
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
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
     * ✅ NEW: Update hold description
     */
    public boolean updateHoldDescription(String holdReference, String newDescription) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "UPDATE wallet_holds SET description = ? WHERE hold_reference = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, newDescription);
                ps.setString(2, holdReference);
                
                int updated = ps.executeUpdate();
                if (updated > 0) {
                    System.out.println("✅ Hold description updated: " + holdReference);
                    return true;
                }
            }
        } catch (SQLException e) {
            System.err.println("⚠️ Could not update hold description (table may not exist): " + e.getMessage());
            // Return true as this is not critical
            return true;
        }
        
        return false;
    }
    
    /**
     * Deposit money to wallet with proper transaction handling
     */
    public boolean depositToWallet(int customerId, BigDecimal amount, String gatewayTransactionId, 
                                 String gatewayName, String description) {
        
        Connection conn = null;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            System.out.println("💰 === PROCESSING DEPOSIT TO WALLET ===");
            System.out.println("   - Customer ID: " + customerId);
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Gateway: " + gatewayName);
            System.out.println("   - Transaction ID: " + gatewayTransactionId);
            System.out.println("   - Description: " + description);
            
            // 1. Get current wallet info
            Wallet wallet = getWalletByUserId(customerId);
            if (wallet == null) {
                System.err.println("❌ Wallet not found for customer: " + customerId);
                System.out.println("🔄 Attempting to create wallet for customer: " + customerId);
                
                // Try to create wallet if not exists
                Wallet newWallet = new Wallet(customerId);
                boolean walletCreated = createWallet(newWallet);
                
                if (!walletCreated) {
                    System.err.println("❌ Failed to create wallet for customer: " + customerId);
                    return false;
                }
                
                // Get the newly created wallet
                wallet = getWalletByUserId(customerId);
                if (wallet == null) {
                    System.err.println("❌ Still cannot find wallet after creation for customer: " + customerId);
                    return false;
                }
            }
            
            System.out.println("✅ Current wallet found:");
            System.out.println("   - Wallet ID: " + wallet.getWalletId());
            System.out.println("   - Current balance: " + wallet.getBalance());
            System.out.println("   - Current total deposited: " + wallet.getTotalDeposited());
            
            // 2. Calculate new balances
            BigDecimal currentBalance = wallet.getBalance() != null ? wallet.getBalance() : BigDecimal.ZERO;
            BigDecimal currentTotalDeposited = wallet.getTotalDeposited() != null ? wallet.getTotalDeposited() : BigDecimal.ZERO;
            
            BigDecimal newBalance = currentBalance.add(amount);
            BigDecimal newTotalDeposited = currentTotalDeposited.add(amount);
            
            System.out.println("💡 Calculated new balances:");
            System.out.println("   - New balance: " + newBalance);
            System.out.println("   - New total deposited: " + newTotalDeposited);
            
            // 3. Update wallet with explicit field mapping
            String updateSql = "UPDATE customer_wallets SET " +
                              "balance = ?, " +
                              "total_deposited = ?, " +
                              "updated_at = SYSDATETIMEOFFSET() " +
                              "WHERE customer_id = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(updateSql)) {
                ps.setBigDecimal(1, newBalance);
                ps.setBigDecimal(2, newTotalDeposited);
                ps.setInt(3, customerId);
                
                System.out.println("🔄 Executing wallet update SQL: " + updateSql);
                System.out.println("   - Parameters: balance=" + newBalance + ", total_deposited=" + newTotalDeposited + ", customer_id=" + customerId);
                
                int rowsUpdated = ps.executeUpdate();
                System.out.println("📊 Wallet update result: " + rowsUpdated + " rows updated");
                
                if (rowsUpdated > 0) {
                    // 4. Record transaction in wallet_transactions (if table exists)
                    try {
                        String transactionSql = "INSERT INTO wallet_transactions " +
                                              "(wallet_id, transaction_type, amount, balance_before, balance_after, " +
                                              "description, reference_id, reference_type, gateway_transaction_id, gateway_name, " +
                                              "transaction_status) " +
                                              "VALUES (?, 'deposit', ?, ?, ?, ?, ?, 'deposit_request', ?, ?, 'completed')";
                        
                        try (PreparedStatement transPs = conn.prepareStatement(transactionSql)) {
                            transPs.setInt(1, wallet.getWalletId());
                            transPs.setBigDecimal(2, amount);
                            transPs.setBigDecimal(3, currentBalance);
                            transPs.setBigDecimal(4, newBalance);
                            transPs.setString(5, description);
                            transPs.setString(6, gatewayTransactionId);
                            transPs.setString(7, gatewayTransactionId);
                            transPs.setString(8, gatewayName);
                            
                            System.out.println("🔄 Executing transaction record SQL");
                            int transactionRows = transPs.executeUpdate();
                            System.out.println("📊 Transaction record result: " + transactionRows + " rows inserted");
                        }
                    } catch (SQLException e) {
                        System.err.println("⚠️ Warning: Could not record transaction history (table may not exist): " + e.getMessage());
                        // This is not critical - continue with deposit
                    }
                    
                    // 5. Commit transaction
                    conn.commit();
                    
                    System.out.println("✅ === DEPOSIT COMPLETED SUCCESSFULLY ===");
                    System.out.println("   - Previous balance: " + currentBalance);
                    System.out.println("   - Amount deposited: " + amount);
                    System.out.println("   - New balance: " + newBalance);
                    System.out.println("   - Transaction ID: " + gatewayTransactionId);
                    
                    return true;
                } else {
                    System.err.println("❌ No rows updated in wallet table");
                    conn.rollback();
                    return false;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ === DATABASE ERROR IN DEPOSIT ===");
            System.err.println("   - Error message: " + e.getMessage());
            System.err.println("   - SQL State: " + e.getSQLState());
            System.err.println("   - Error code: " + e.getErrorCode());
            e.printStackTrace();
            
            if (conn != null) {
                try {
                    conn.rollback();
                    System.out.println("🔄 Transaction rolled back due to error");
                } catch (SQLException ex) {
                    System.err.println("❌ Error during rollback: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }
            return false;
            
        } catch (Exception e) {
            System.err.println("❌ === GENERAL ERROR IN DEPOSIT ===");
            System.err.println("   - Error message: " + e.getMessage());
            e.printStackTrace();
            
            if (conn != null) {
                try {
                    conn.rollback();
                    System.out.println("🔄 Transaction rolled back due to general error");
                } catch (SQLException ex) {
                    System.err.println("❌ Error during rollback: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }
            return false;
            
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                    System.out.println("🔄 Database connection closed");
                } catch (SQLException e) {
                    System.err.println("❌ Error closing connection: " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }
    }
    
    /**
     * Withdraw from wallet (for withdrawal requests)
     */
    public boolean withdrawFromWallet(int customerId, BigDecimal amount, int paymentMethodId, String description) {
        Connection conn = null;
        
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);
            
            System.out.println("💸 === PROCESSING WITHDRAWAL FROM WALLET ===");
            System.out.println("   - Customer ID: " + customerId);
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Payment Method ID: " + paymentMethodId);
            System.out.println("   - Description: " + description);
            
            // 1. Get current wallet info
            Wallet wallet = getWalletByUserId(customerId);
            if (wallet == null) {
                System.err.println("❌ Wallet not found for customer: " + customerId);
                return false;
            }
            
            // 2. Check sufficient balance
            BigDecimal currentBalance = wallet.getBalance() != null ? wallet.getBalance() : BigDecimal.ZERO;
            if (currentBalance.compareTo(amount) < 0) {
                System.err.println("❌ Insufficient balance. Current: " + currentBalance + ", Required: " + amount);
                return false;
            }
            
            // 3. Calculate new balances
            BigDecimal currentTotalWithdrawn = wallet.getTotalWithdrawn() != null ? wallet.getTotalWithdrawn() : BigDecimal.ZERO;
            BigDecimal newBalance = currentBalance.subtract(amount);
            BigDecimal newTotalWithdrawn = currentTotalWithdrawn.add(amount);
            
            System.out.println("💡 Calculated new balances:");
            System.out.println("   - New balance: " + newBalance);
            System.out.println("   - New total withdrawn: " + newTotalWithdrawn);
            
            // 4. Update wallet
            String updateSql = "UPDATE customer_wallets SET " +
                              "balance = ?, " +
                              "total_withdrawn = ?, " +
                              "updated_at = SYSDATETIMEOFFSET() " +
                              "WHERE customer_id = ?";
            
            try (PreparedStatement ps = conn.prepareStatement(updateSql)) {
                ps.setBigDecimal(1, newBalance);
                ps.setBigDecimal(2, newTotalWithdrawn);
                ps.setInt(3, customerId);
                
                int rowsUpdated = ps.executeUpdate();
                System.out.println("📊 Wallet update result: " + rowsUpdated + " rows updated");
                
                if (rowsUpdated > 0) {
                    // 5. Record transaction in wallet_transactions (if table exists)
                    try {
                        String transactionSql = "INSERT INTO wallet_transactions " +
                                              "(wallet_id, transaction_type, amount, balance_before, balance_after, " +
                                              "description, reference_id, reference_type, transaction_status) " +
                                              "VALUES (?, 'withdrawal', ?, ?, ?, ?, ?, 'withdrawal_request', 'completed')";
                        
                        try (PreparedStatement transPs = conn.prepareStatement(transactionSql)) {
                            transPs.setInt(1, wallet.getWalletId());
                            transPs.setBigDecimal(2, amount);
                            transPs.setBigDecimal(3, currentBalance);
                            transPs.setBigDecimal(4, newBalance);
                            transPs.setString(5, description);
                            transPs.setString(6, String.valueOf(paymentMethodId));
                            
                            int transactionRows = transPs.executeUpdate();
                            System.out.println("📊 Transaction record result: " + transactionRows + " rows inserted");
                        }
                    } catch (SQLException e) {
                        System.err.println("⚠️ Warning: Could not record transaction history: " + e.getMessage());
                        // This is not critical - continue with withdrawal
                    }
                    
                    // 6. Commit transaction
                    conn.commit();
                    
                    System.out.println("✅ === WITHDRAWAL COMPLETED SUCCESSFULLY ===");
                    System.out.println("   - Previous balance: " + currentBalance);
                    System.out.println("   - Amount withdrawn: " + amount);
                    System.out.println("   - New balance: " + newBalance);
                    
                    return true;
                } else {
                    System.err.println("❌ No rows updated in wallet table");
                    conn.rollback();
                    return false;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Database error in withdrawal: " + e.getMessage());
            e.printStackTrace();
            
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
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
     * Update wallet balance (direct update - use with caution)
     */
    public boolean updateWalletBalance(int walletId, BigDecimal newBalance, BigDecimal newTotalDeposited, BigDecimal newTotalWithdrawn) {
        String sql = "UPDATE customer_wallets SET balance = ?, total_deposited = ?, total_withdrawn = ?, updated_at = SYSDATETIMEOFFSET() WHERE wallet_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setBigDecimal(1, newBalance);
            ps.setBigDecimal(2, newTotalDeposited);
            ps.setBigDecimal(3, newTotalWithdrawn);
            ps.setInt(4, walletId);
            
            return ps.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("❌ Error updating wallet balance: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Check if customer has wallet
     */
    public boolean hasWallet(int customerId) {
        String sql = "SELECT COUNT(*) FROM customer_wallets WHERE customer_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error checking wallet existence: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Map ResultSet to Wallet object for customer_wallets schema
     */
    private Wallet mapResultSetToWallet(ResultSet rs) throws SQLException {
        Wallet wallet = new Wallet();
        
        wallet.setWalletId(rs.getInt("wallet_id"));
        wallet.setCustomerId(rs.getInt("customer_id"));
        wallet.setBalance(rs.getBigDecimal("balance"));
        wallet.setTotalDeposited(rs.getBigDecimal("total_deposited"));
        wallet.setTotalWithdrawn(rs.getBigDecimal("total_withdrawn"));
        wallet.setActive(rs.getBoolean("is_active"));
        
        // Handle OffsetDateTime
        Timestamp createdTimestamp = rs.getTimestamp("created_at");
        if (createdTimestamp != null) {
            wallet.setCreatedAt(createdTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        Timestamp updatedTimestamp = rs.getTimestamp("updated_at");
        if (updatedTimestamp != null) {
            wallet.setUpdatedAt(updatedTimestamp.toLocalDateTime().atOffset(java.time.ZoneOffset.of("+07:00")));
        }
        
        return wallet;
    }
}