package model;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

/**
 * Model class cho bảng wallet_transactions
 */
public class WalletTransaction {
    private int transactionId;
    private int walletId;
    private String transactionType;
    private BigDecimal amount;
    private BigDecimal balanceBefore;
    private BigDecimal balanceAfter;
    private String description;
    private String referenceId;
    private String referenceType;
    private String transactionStatus;
    private String gatewayTransactionId;
    private String gatewayName;
    private OffsetDateTime createdAt;
    private OffsetDateTime processedAt;
    
    // User information (for joins)
    private String userFullName;
    private String userEmail;
    
    // Constructors
    public WalletTransaction() {
        this.transactionStatus = "completed";
    }
    
    public WalletTransaction(int walletId, String transactionType, BigDecimal amount,
                           BigDecimal balanceBefore, BigDecimal balanceAfter, String description) {
        this();
        this.walletId = walletId;
        this.transactionType = transactionType;
        this.amount = amount;
        this.balanceBefore = balanceBefore;
        this.balanceAfter = balanceAfter;
        this.description = description;
    }
    
    // Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }
    
    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }
    
    public int getWalletId() {
        return walletId;
    }
    
    public void setWalletId(int walletId) {
        this.walletId = walletId;
    }
    
    public String getTransactionType() {
        return transactionType;
    }
    
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }
    
    public BigDecimal getAmount() {
        return amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public BigDecimal getBalanceBefore() {
        return balanceBefore;
    }
    
    public void setBalanceBefore(BigDecimal balanceBefore) {
        this.balanceBefore = balanceBefore;
    }
    
    public BigDecimal getBalanceAfter() {
        return balanceAfter;
    }
    
    public void setBalanceAfter(BigDecimal balanceAfter) {
        this.balanceAfter = balanceAfter;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getReferenceId() {
        return referenceId;
    }
    
    public void setReferenceId(String referenceId) {
        this.referenceId = referenceId;
    }
    
    public String getReferenceType() {
        return referenceType;
    }
    
    public void setReferenceType(String referenceType) {
        this.referenceType = referenceType;
    }
    
    public String getTransactionStatus() {
        return transactionStatus;
    }
    
    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }
    
    public String getGatewayTransactionId() {
        return gatewayTransactionId;
    }
    
    public void setGatewayTransactionId(String gatewayTransactionId) {
        this.gatewayTransactionId = gatewayTransactionId;
    }
    
    public String getGatewayName() {
        return gatewayName;
    }
    
    public void setGatewayName(String gatewayName) {
        this.gatewayName = gatewayName;
    }
    
    public OffsetDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(OffsetDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public OffsetDateTime getProcessedAt() {
        return processedAt;
    }
    
    public void setProcessedAt(OffsetDateTime processedAt) {
        this.processedAt = processedAt;
    }
    
    public String getUserFullName() {
        return userFullName;
    }
    
    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }
    
    public String getUserEmail() {
        return userEmail;
    }
    
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    // Utility methods
    public boolean isDeposit() {
        return "deposit".equals(transactionType);
    }
    
    public boolean isWithdraw() {
        return "withdraw".equals(transactionType);
    }
    
    public boolean isPayment() {
        return "payment".equals(transactionType);
    }
    
    public boolean isRefund() {
        return "refund".equals(transactionType);
    }
    
    public boolean isReceive() {
        return "receive".equals(transactionType);
    }
    
    public boolean isLock() {
        return "lock".equals(transactionType);
    }
    
    public boolean isUnlock() {
        return "unlock".equals(transactionType);
    }
    
    public boolean isPending() {
        return "pending".equals(transactionStatus);
    }
    
    public boolean isCompleted() {
        return "completed".equals(transactionStatus);
    }
    
    public boolean isFailed() {
        return "failed".equals(transactionStatus);
    }
    
    public boolean isCancelled() {
        return "cancelled".equals(transactionStatus);
    }
    
    public String getTransactionTypeDisplay() {
        switch (transactionType) {
            case "deposit": return "Nạp tiền";
            case "withdraw": return "Rút tiền";
            case "payment": return "Thanh toán";
            case "refund": return "Hoàn tiền";
            case "receive": return "Nhận tiền";
            case "lock": return "Khóa tiền";
            case "unlock": return "Mở khóa";
            default: return transactionType;
        }
    }
    
    public String getTransactionStatusDisplay() {
        switch (transactionStatus) {
            case "pending": return "Đang xử lý";
            case "completed": return "Hoàn thành";
            case "failed": return "Thất bại";
            case "cancelled": return "Đã hủy";
            default: return transactionStatus;
        }
    }
    
    @Override
    public String toString() {
        return "WalletTransaction{" +
                "transactionId=" + transactionId +
                ", walletId=" + walletId +
                ", transactionType='" + transactionType + '\'' +
                ", amount=" + amount +
                ", balanceBefore=" + balanceBefore +
                ", balanceAfter=" + balanceAfter +
                ", description='" + description + '\'' +
                ", referenceId='" + referenceId + '\'' +
                ", referenceType='" + referenceType + '\'' +
                ", transactionStatus='" + transactionStatus + '\'' +
                ", gatewayTransactionId='" + gatewayTransactionId + '\'' +
                ", gatewayName='" + gatewayName + '\'' +
                ", createdAt=" + createdAt +
                ", processedAt=" + processedAt +
                '}';
    }
}