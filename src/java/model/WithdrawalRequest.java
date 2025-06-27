package model;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

/**
 * ✅ FIXED: Model class for withdrawal_requests table
 * - Fixed field mapping to match database schema
 * - Enhanced fee calculation with proper validation
 * - Added comprehensive utility methods
 */
public class WithdrawalRequest {
    private int withdrawalId;
    private int walletId;
    private int userId; // customer_id in database
    private BigDecimal amount;
    private BigDecimal fee;
    private BigDecimal netAmount;
    private int paymentMethodId;
    private String withdrawalStatus;
    private String adminNote;
    private String bankTransactionId;
    private OffsetDateTime requestedAt;
    private OffsetDateTime processedAt;
    private OffsetDateTime completedAt;
    private Integer processedBy;
    private String rejectionReason;
    
    // User information (from joins)
    private String userFullName;
    private String userEmail;
    
    // Payment method information (from joins)
    private String methodName;
    private String bankName;
    private String accountNumber;
    private String accountHolderName;
    
    // Constructors
    public WithdrawalRequest() {
        this.withdrawalStatus = "pending";
        this.fee = BigDecimal.ZERO;
        this.netAmount = BigDecimal.ZERO;
    }
    
    public WithdrawalRequest(int walletId, int userId, BigDecimal amount, int paymentMethodId) {
        this();
        this.walletId = walletId;
        this.userId = userId;
        this.amount = amount;
        this.paymentMethodId = paymentMethodId;
        this.calculateFeeAndNetAmount();
    }
    
    // Getters and Setters
    public int getWithdrawalId() {
        return withdrawalId;
    }
    
    public void setWithdrawalId(int withdrawalId) {
        this.withdrawalId = withdrawalId;
    }
    
    public int getWalletId() {
        return walletId;
    }
    
    public void setWalletId(int walletId) {
        this.walletId = walletId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public BigDecimal getAmount() {
        return amount != null ? amount : BigDecimal.ZERO;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
        this.calculateFeeAndNetAmount();
    }
    
    public BigDecimal getFee() {
        return fee != null ? fee : BigDecimal.ZERO;
    }
    
    public void setFee(BigDecimal fee) {
        this.fee = fee;
        this.calculateNetAmount();
    }
    
    public BigDecimal getNetAmount() {
        return netAmount != null ? netAmount : BigDecimal.ZERO;
    }
    
    public void setNetAmount(BigDecimal netAmount) {
        this.netAmount = netAmount;
    }
    
    public int getPaymentMethodId() {
        return paymentMethodId;
    }
    
    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }
    
    public String getWithdrawalStatus() {
        return withdrawalStatus;
    }
    
    public void setWithdrawalStatus(String withdrawalStatus) {
        this.withdrawalStatus = withdrawalStatus;
    }
    
    public String getAdminNote() {
        return adminNote;
    }
    
    public void setAdminNote(String adminNote) {
        this.adminNote = adminNote;
    }
    
    public String getBankTransactionId() {
        return bankTransactionId;
    }
    
    public void setBankTransactionId(String bankTransactionId) {
        this.bankTransactionId = bankTransactionId;
    }
    
    public OffsetDateTime getRequestedAt() {
        return requestedAt;
    }
    
    public void setRequestedAt(OffsetDateTime requestedAt) {
        this.requestedAt = requestedAt;
    }
    
    public OffsetDateTime getProcessedAt() {
        return processedAt;
    }
    
    public void setProcessedAt(OffsetDateTime processedAt) {
        this.processedAt = processedAt;
    }
    
    public OffsetDateTime getCompletedAt() {
        return completedAt;
    }
    
    public void setCompletedAt(OffsetDateTime completedAt) {
        this.completedAt = completedAt;
    }
    
    public Integer getProcessedBy() {
        return processedBy;
    }
    
    public void setProcessedBy(Integer processedBy) {
        this.processedBy = processedBy;
    }
    
    public String getRejectionReason() {
        return rejectionReason;
    }
    
    public void setRejectionReason(String rejectionReason) {
        this.rejectionReason = rejectionReason;
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
    
    public String getMethodName() {
        return methodName;
    }
    
    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
    
    public String getBankName() {
        return bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    public String getAccountHolderName() {
        return accountHolderName;
    }
    
    public void setAccountHolderName(String accountHolderName) {
        this.accountHolderName = accountHolderName;
    }
    
    // ✅ ENHANCED: Business logic methods
    
    /**
     * Calculate withdrawal fee based on amount
     * Fee structure: 0.5% with minimum 5,000 VND and maximum 50,000 VND
     */
    private void calculateFeeAndNetAmount() {
        if (amount != null && amount.compareTo(BigDecimal.ZERO) > 0) {
            // Fee percentage: 0.5%
            BigDecimal feePercentage = new BigDecimal("0.005");
            BigDecimal minFee = new BigDecimal("5000");
            BigDecimal maxFee = new BigDecimal("50000");
            
            BigDecimal calculatedFee = amount.multiply(feePercentage);
            
            // Apply min/max limits
            if (calculatedFee.compareTo(minFee) < 0) {
                this.fee = minFee;
            } else if (calculatedFee.compareTo(maxFee) > 0) {
                this.fee = maxFee;
            } else {
                this.fee = calculatedFee.setScale(0, BigDecimal.ROUND_UP); // Round up to nearest VND
            }
            
            calculateNetAmount();
        }
    }
    
    /**
     * Calculate net amount (amount - fee)
     */
    private void calculateNetAmount() {
        if (amount != null && fee != null) {
            this.netAmount = amount.subtract(fee);
            
            // Ensure net amount is not negative
            if (this.netAmount.compareTo(BigDecimal.ZERO) < 0) {
                this.netAmount = BigDecimal.ZERO;
            }
        }
    }
    
    /**
     * Validate withdrawal request
     */
    public boolean isValid() {
        return walletId > 0 
            && userId > 0 
            && paymentMethodId > 0
            && amount != null 
            && amount.compareTo(new BigDecimal("50000")) >= 0 // Minimum 50,000 VND
            && amount.compareTo(new BigDecimal("10000000")) <= 0 // Maximum 10,000,000 VND
            && fee != null 
            && fee.compareTo(BigDecimal.ZERO) >= 0
            && netAmount != null 
            && netAmount.compareTo(BigDecimal.ZERO) > 0;
    }
    
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
    
    // Status check methods
    public boolean isPending() {
        return "pending".equals(withdrawalStatus);
    }
    
    public boolean isProcessing() {
        return "processing".equals(withdrawalStatus);
    }
    
    public boolean isApproved() {
        return "approved".equals(withdrawalStatus);
    }
    
    public boolean isCompleted() {
        return "completed".equals(withdrawalStatus);
    }
    
    public boolean isRejected() {
        return "rejected".equals(withdrawalStatus);
    }
    
    public boolean isFailed() {
        return "failed".equals(withdrawalStatus);
    }
    
    public boolean isCancelled() {
        return "cancelled".equals(withdrawalStatus);
    }
    
    /**
     * Get status display text in Vietnamese
     */
    public String getStatusDisplay() {
        switch (withdrawalStatus != null ? withdrawalStatus : "pending") {
            case "pending": return "Chờ duyệt";
            case "processing": return "Đang xử lý";
            case "approved": return "Đã duyệt";
            case "completed": return "Hoàn thành";
            case "rejected": return "Đã từ chối";
            case "failed": return "Thất bại";
            case "cancelled": return "Đã hủy";
            default: return withdrawalStatus;
        }
    }
    
    /**
     * Get formatted withdrawal summary
     */
    public String getSummary() {
        return String.format("WithdrawalRequest[ID=%d, Customer=%d, Amount=%s, Fee=%s, Net=%s, Status=%s, Method=%s]",
                withdrawalId, userId, 
                getAmount().toPlainString(),
                getFee().toPlainString(),
                getNetAmount().toPlainString(),
                withdrawalStatus,
                bankName != null ? bankName : "N/A");
    }
    
    @Override
    public String toString() {
        return "WithdrawalRequest{" +
                "withdrawalId=" + withdrawalId +
                ", walletId=" + walletId +
                ", userId=" + userId +
                ", amount=" + amount +
                ", fee=" + fee +
                ", netAmount=" + netAmount +
                ", paymentMethodId=" + paymentMethodId +
                ", withdrawalStatus='" + withdrawalStatus + '\'' +
                ", adminNote='" + adminNote + '\'' +
                ", bankTransactionId='" + bankTransactionId + '\'' +
                ", requestedAt=" + requestedAt +
                ", processedAt=" + processedAt +
                ", completedAt=" + completedAt +
                ", processedBy=" + processedBy +
                ", rejectionReason='" + rejectionReason + '\'' +
                ", userFullName='" + userFullName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", methodName='" + methodName + '\'' +
                ", bankName='" + bankName + '\'' +
                ", accountNumber='" + getMaskedAccountNumber() + '\'' +
                ", accountHolderName='" + accountHolderName + '\'' +
                '}';
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        WithdrawalRequest that = (WithdrawalRequest) obj;
        return withdrawalId == that.withdrawalId && userId == that.userId;
    }
    
    @Override
    public int hashCode() {
        return java.util.Objects.hash(withdrawalId, userId);
    }
}