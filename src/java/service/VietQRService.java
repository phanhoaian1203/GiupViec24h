package service;

import utils.DBContext;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * ✅ UPDATED: Service for VietQR integration with database configuration
 * - Load bank settings from vietqr_settings table
 * - Enhanced QR generation with proper encoding
 * - Support for multiple bank accounts
 * - Better error handling and logging
 */
public class VietQRService {
    
    // Default fallback values if database settings not available
    private static final String DEFAULT_BANK_ID = "970422"; // MBBank
    private static final String DEFAULT_ACCOUNT_NO = "0847160246";
    private static final String DEFAULT_ACCOUNT_NAME = "PHAN HOAI AN";
    private static final String DEFAULT_TEMPLATE = "compact";
    
    /**
     * ✅ ENHANCED: Generate unique transaction ID with timestamp
     */
    public String generateTransactionId(int customerId) {
        // Format: NAP + customerId + timestamp (yyMMddHHmm) + random
        LocalDateTime now = LocalDateTime.now();
        String timestamp = now.format(DateTimeFormatter.ofPattern("yyMMddHHmm"));
        String random = String.valueOf((int)(Math.random() * 1000));
        
        String transactionId = String.format("NAP%d%s%s", customerId, timestamp, random);
        
        System.out.println("🔢 Generated transaction ID: " + transactionId + " for customer: " + customerId);
        return transactionId;
    }
    
    /**
     * ✅ ENHANCED: Generate VietQR URL with database settings
     */
    public String generateVietQRUrl(BigDecimal amount, String transactionId, String description) {
        try {
            // Get bank settings from database
            BankSettings settings = getBankSettings();
            
            // Create description with transaction ID
            String memo = String.format("%s %s", transactionId, description != null ? description : "Nap tien Giup Viec 24h");
            
            // Encode parameters for URL safety
            String encodedMemo = URLEncoder.encode(memo, StandardCharsets.UTF_8.toString());
            String encodedAccountName = URLEncoder.encode(settings.accountName, StandardCharsets.UTF_8.toString());
            
            // Build VietQR URL using img.vietqr.io API
            StringBuilder urlBuilder = new StringBuilder();
            urlBuilder.append("https://img.vietqr.io/image/")
                     .append(settings.bankId).append("-")
                     .append(settings.accountNumber).append("-")
                     .append(settings.template).append(".png")
                     .append("?amount=").append(amount.toPlainString())
                     .append("&addInfo=").append(encodedMemo)
                     .append("&accountName=").append(encodedAccountName);
            
            String qrUrl = urlBuilder.toString();
            
            System.out.println("🔗 Generated VietQR URL:");
            System.out.println("   - Bank: " + settings.bankName + " (" + settings.bankId + ")");
            System.out.println("   - Account: " + settings.accountNumber);
            System.out.println("   - Amount: " + amount.toPlainString());
            System.out.println("   - Memo: " + memo);
            System.out.println("   - URL: " + qrUrl);
            
            return qrUrl;
            
        } catch (Exception e) {
            System.err.println("❌ Error generating VietQR URL: " + e.getMessage());
            e.printStackTrace();
            
            // Return fallback URL with default settings
            return generateFallbackQRUrl(amount, transactionId, description);
        }
    }
    
    /**
     * ✅ NEW: Generate mobile banking URL for deep linking
     */
    public String generateVietQRMobileUrl(BigDecimal amount, String transactionId, String description) {
        try {
            BankSettings settings = getBankSettings();
            String memo = String.format("%s %s", transactionId, description != null ? description : "Nap tien Giup Viec 24h");
            
            // Mobile deep linking URL (varies by bank)
            String mobileUrl = String.format("vietqr://pay?bankId=%s&accountNo=%s&amount=%s&memo=%s",
                    settings.bankId,
                    settings.accountNumber,
                    amount.toPlainString(),
                    URLEncoder.encode(memo, StandardCharsets.UTF_8.toString()));
            
            System.out.println("📱 Generated mobile VietQR URL: " + mobileUrl);
            return mobileUrl;
            
        } catch (Exception e) {
            System.err.println("❌ Error generating mobile VietQR URL: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * ✅ ENHANCED: Generate bank transfer info from database settings
     */
    public BankTransferInfo generateBankTransferInfo(BigDecimal amount, String transactionId, String description) {
        try {
            BankSettings settings = getBankSettings();
            String memo = String.format("%s %s", transactionId, description != null ? description : "Nap tien Giup Viec 24h");
            
            BankTransferInfo info = new BankTransferInfo(
                settings.bankName,
                settings.accountNumber,
                settings.accountName,
                amount,
                memo
            );
            
            System.out.println("🏦 Generated bank transfer info:");
            System.out.println("   " + info.toString());
            
            return info;
            
        } catch (Exception e) {
            System.err.println("❌ Error generating bank transfer info: " + e.getMessage());
            e.printStackTrace();
            
            // Return fallback info
            return new BankTransferInfo(
                getBankNameFromId(DEFAULT_BANK_ID),
                DEFAULT_ACCOUNT_NO,
                DEFAULT_ACCOUNT_NAME,
                amount,
                String.format("%s %s", transactionId, description != null ? description : "Nap tien Giup Viec 24h")
            );
        }
    }
    
    /**
     * ✅ NEW: Get bank settings from database
     */
    private BankSettings getBankSettings() {
        String sql = "SELECT bank_id, bank_name, account_number, account_holder_name, template " +
                    "FROM vietqr_settings WHERE is_active = 1 ORDER BY setting_id LIMIT 1";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                BankSettings settings = new BankSettings();
                settings.bankId = rs.getString("bank_id");
                settings.bankName = rs.getString("bank_name");
                settings.accountNumber = rs.getString("account_number");
                settings.accountName = rs.getString("account_holder_name");
                settings.template = rs.getString("template");
                
                System.out.println("✅ Loaded bank settings from database:");
                System.out.println("   - Bank: " + settings.bankName + " (" + settings.bankId + ")");
                System.out.println("   - Account: " + settings.accountNumber);
                System.out.println("   - Holder: " + settings.accountName);
                
                return settings;
            }
            
        } catch (SQLException e) {
            System.err.println("⚠️ Error loading bank settings from database: " + e.getMessage());
        }
        
        // Return default settings if database not available
        System.out.println("⚠️ Using default bank settings");
        BankSettings defaultSettings = new BankSettings();
        defaultSettings.bankId = DEFAULT_BANK_ID;
        defaultSettings.bankName = getBankNameFromId(DEFAULT_BANK_ID);
        defaultSettings.accountNumber = DEFAULT_ACCOUNT_NO;
        defaultSettings.accountName = DEFAULT_ACCOUNT_NAME;
        defaultSettings.template = DEFAULT_TEMPLATE;
        
        return defaultSettings;
    }
    
    /**
     * Generate fallback QR URL when database settings fail
     */
    private String generateFallbackQRUrl(BigDecimal amount, String transactionId, String description) {
        try {
            String memo = String.format("%s %s", transactionId, description != null ? description : "Nap tien Giup Viec 24h");
            String encodedMemo = URLEncoder.encode(memo, StandardCharsets.UTF_8.toString());
            String encodedAccountName = URLEncoder.encode(DEFAULT_ACCOUNT_NAME, StandardCharsets.UTF_8.toString());
            
            String fallbackUrl = String.format("https://img.vietqr.io/image/%s-%s-%s.png?amount=%s&addInfo=%s&accountName=%s",
                    DEFAULT_BANK_ID, DEFAULT_ACCOUNT_NO, DEFAULT_TEMPLATE,
                    amount.toPlainString(), encodedMemo, encodedAccountName);
            
            System.out.println("🔄 Using fallback QR URL: " + fallbackUrl);
            return fallbackUrl;
            
        } catch (Exception e) {
            System.err.println("❌ Error generating fallback QR URL: " + e.getMessage());
            return null;
        }
    }
    
    /**
     * ✅ ENHANCED: Get bank name from bank ID
     */
    private String getBankNameFromId(String bankId) {
        switch (bankId) {
            case "970415": return "VietinBank";
            case "970436": return "Vietcombank";
            case "970403": return "Sacombank";
            case "970422": return "MBBank";
            case "970418": return "BIDV";
            case "970405": return "Agribank";
            case "970407": return "Techcombank";
            case "970448": return "OCB";
            case "970432": return "VPBank";
            case "970423": return "TPBank";
            case "970416": return "ACB";
            case "970414": return "Oceanbank";
            case "970409": return "BacABank";
            case "970438": return "BaoVietBank";
            case "970454": return "VietCapitalBank";
            default: return "Ngân hàng";
        }
    }
    
    /**
     * Validate transaction ID format
     */
    public boolean isValidTransactionId(String transactionId) {
        if (transactionId == null || transactionId.trim().isEmpty()) {
            return false;
        }
        
        // Transaction ID format: NAP + customerID + timestamp + random
        // Example: NAP1250625101234567
        boolean valid = transactionId.matches("^NAP\\d{10,}$");
        
        if (!valid) {
            System.out.println("⚠️ Invalid transaction ID format: " + transactionId);
        }
        
        return valid;
    }
    
    /**
     * Extract customer ID from transaction ID
     */
    public int extractCustomerIdFromTransactionId(String transactionId) {
        try {
            if (!isValidTransactionId(transactionId)) {
                return -1;
            }
            
            // Remove "NAP" prefix
            String numberPart = transactionId.substring(3);
            
            // Customer ID is usually the first few digits before timestamp
            // Since timestamp is 10 digits (yyMMddHHmm), customer ID is before that
            if (numberPart.length() > 10) {
                // Extract customer ID part (everything before the 10-digit timestamp)
                String customerIdPart = numberPart.substring(0, numberPart.length() - 13); // 10 timestamp + 3 random
                return Integer.parseInt(customerIdPart);
            }
            
            return -1;
            
        } catch (NumberFormatException e) {
            System.err.println("❌ Error extracting customer ID from transaction ID: " + e.getMessage());
            return -1;
        }
    }
    
    /**
     * ✅ NEW: Validate QR payment info
     */
    public boolean validateQRPayment(String transactionId, BigDecimal amount, String bankReference) {
        // This would typically integrate with bank webhook/API to verify payment
        // For now, we'll do basic validation
        
        if (!isValidTransactionId(transactionId)) {
            return false;
        }
        
        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            return false;
        }
        
        // Additional validation logic would go here
        System.out.println("✅ QR payment validation passed for: " + transactionId);
        return true;
    }
    
    /**
     * Inner class for bank settings
     */
    private static class BankSettings {
        String bankId;
        String bankName;
        String accountNumber;
        String accountName;
        String template;
    }
    
    /**
     * ✅ ENHANCED: Bank transfer info class
     */
    public static class BankTransferInfo {
        private final String bankName;
        private final String accountNumber;
        private final String accountName;
        private final BigDecimal amount;
        private final String memo;
        
        public BankTransferInfo(String bankName, String accountNumber, String accountName, 
                              BigDecimal amount, String memo) {
            this.bankName = bankName;
            this.accountNumber = accountNumber;
            this.accountName = accountName;
            this.amount = amount;
            this.memo = memo;
        }
        
        // Getters
        public String getBankName() { return bankName; }
        public String getAccountNumber() { return accountNumber; }
        public String getAccountName() { return accountName; }
        public BigDecimal getAmount() { return amount; }
        public String getMemo() { return memo; }
        
        /**
         * Get masked account number for security
         */
        public String getMaskedAccountNumber() {
            if (accountNumber == null || accountNumber.length() <= 4) {
                return accountNumber;
            }
            
            String mask = "*".repeat(accountNumber.length() - 4);
            return mask + accountNumber.substring(accountNumber.length() - 4);
        }
        
        /**
         * Get formatted transfer instructions
         */
        public String getTransferInstructions() {
            return String.format(
                "🏦 Ngân hàng: %s\n" +
                "👤 Số tài khoản: %s\n" +
                "💰 Số tiền: %s VNĐ\n" +
                "📝 Nội dung: %s\n" +
                "⚠️ Lưu ý: Chuyển khoản ĐÚNG nội dung để được xử lý tự động",
                bankName, accountNumber, amount.toPlainString(), memo
            );
        }
        
        @Override
        public String toString() {
            return "BankTransferInfo{" +
                    "bankName='" + bankName + '\'' +
                    ", accountNumber='" + getMaskedAccountNumber() + '\'' +
                    ", accountName='" + accountName + '\'' +
                    ", amount=" + amount +
                    ", memo='" + memo + '\'' +
                    '}';
        }
    }
}