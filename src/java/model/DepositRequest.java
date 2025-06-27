package model;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

/**
 * Model class cho bảng deposit_requests
 */
public class DepositRequest {
    private int depositId;
    private int walletId;
    private int userId;
    private BigDecimal amount;
    private String gatewayName;
    private String gatewayTransactionId;
    private String gatewayResponse;
    private String depositStatus;
    private OffsetDateTime requestedAt;
    private OffsetDateTime completedAt;
    private OffsetDateTime expiredAt;
    private String adminNote;
    private Integer processedBy;
    private String rejectionReason;
    
    // User information (for joins)
    private String userFullName;
    private String userEmail;
    
    // Constructors
    public DepositRequest() {
        this.depositStatus = "pending";
        this.gatewayName = "vietqr";
    }
    
    public DepositRequest(int walletId, int userId, BigDecimal amount) {
        this();
        this.walletId = walletId;
        this.userId = userId;
        this.amount = amount;
    }
    
    // Getters and Setters
    public int getDepositId() {
        return depositId;
    }
    
    public void setDepositId(int depositId) {
        this.depositId = depositId;
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
        return amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public String getGatewayName() {
        return gatewayName;
    }
    
    public void setGatewayName(String gatewayName) {
        this.gatewayName = gatewayName;
    }
    
    public String getGatewayTransactionId() {
        return gatewayTransactionId;
    }
    
    public void setGatewayTransactionId(String gatewayTransactionId) {
        this.gatewayTransactionId = gatewayTransactionId;
    }
    
    public String getGatewayResponse() {
        return gatewayResponse;
    }
    
    public void setGatewayResponse(String gatewayResponse) {
        this.gatewayResponse = gatewayResponse;
    }
    
    public String getDepositStatus() {
        return depositStatus;
    }
    
    public void setDepositStatus(String depositStatus) {
        this.depositStatus = depositStatus;
    }
    
    public OffsetDateTime getRequestedAt() {
        return requestedAt;
    }
    
    public void setRequestedAt(OffsetDateTime requestedAt) {
        this.requestedAt = requestedAt;
    }
    
    public OffsetDateTime getCompletedAt() {
        return completedAt;
    }
    
    public void setCompletedAt(OffsetDateTime completedAt) {
        this.completedAt = completedAt;
    }
    
    public OffsetDateTime getExpiredAt() {
        return expiredAt;
    }
    
    public void setExpiredAt(OffsetDateTime expiredAt) {
        this.expiredAt = expiredAt;
    }
    
    public String getAdminNote() {
        return adminNote;
    }
    
    public void setAdminNote(String adminNote) {
        this.adminNote = adminNote;
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
    
    // Utility methods
    public boolean isPending() {
        return "pending".equals(depositStatus);
    }
    
    public boolean isCompleted() {
        return "completed".equals(depositStatus);
    }
    
    public boolean isFailed() {
        return "failed".equals(depositStatus);
    }
    
    public boolean isCancelled() {
        return "cancelled".equals(depositStatus);
    }
    
    public boolean isExpired() {
        return expiredAt != null && OffsetDateTime.now().isAfter(expiredAt);
    }
    
    @Override
    public String toString() {
        return "DepositRequest{" +
                "depositId=" + depositId +
                ", walletId=" + walletId +
                ", userId=" + userId +
                ", amount=" + amount +
                ", gatewayName='" + gatewayName + '\'' +
                ", gatewayTransactionId='" + gatewayTransactionId + '\'' +
                ", depositStatus='" + depositStatus + '\'' +
                ", requestedAt=" + requestedAt +
                ", completedAt=" + completedAt +
                ", expiredAt=" + expiredAt +
                '}';
    }
}