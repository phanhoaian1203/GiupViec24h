package model;

import java.time.OffsetDateTime;

/**
 * Model class cho bảng payment_methods
 */
public class PaymentMethod {
    private int methodId;
    private int userId;
    private String methodType;
    private String methodName;
    private String accountNumber;
    private String bankName;
    private String accountHolderName;
    private boolean isDefault;
    private boolean isActive;
    private String verificationStatus;
    private OffsetDateTime createdAt;
    private OffsetDateTime verifiedAt;
    
    // Constructors
    public PaymentMethod() {
        this.isDefault = false;
        this.isActive = true;
        this.verificationStatus = "pending";
    }
    
    public PaymentMethod(int userId, String methodType, String methodName, 
                        String accountNumber, String bankName, String accountHolderName) {
        this();
        this.userId = userId;
        this.methodType = methodType;
        this.methodName = methodName;
        this.accountNumber = accountNumber;
        this.bankName = bankName;
        this.accountHolderName = accountHolderName;
    }
    
    // Getters and Setters
    public int getMethodId() {
        return methodId;
    }
    
    public void setMethodId(int methodId) {
        this.methodId = methodId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getMethodType() {
        return methodType;
    }
    
    public void setMethodType(String methodType) {
        this.methodType = methodType;
    }
    
    public String getMethodName() {
        return methodName;
    }
    
    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    public String getBankName() {
        return bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    
    public String getAccountHolderName() {
        return accountHolderName;
    }
    
    public void setAccountHolderName(String accountHolderName) {
        this.accountHolderName = accountHolderName;
    }
    
    public boolean isDefault() {
        return isDefault;
    }
    
    public void setDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }
    
    public boolean isActive() {
        return isActive;
    }
    
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    public String getVerificationStatus() {
        return verificationStatus;
    }
    
    public void setVerificationStatus(String verificationStatus) {
        this.verificationStatus = verificationStatus;
    }
    
    public OffsetDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(OffsetDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public OffsetDateTime getVerifiedAt() {
        return verifiedAt;
    }
    
    public void setVerifiedAt(OffsetDateTime verifiedAt) {
        this.verifiedAt = verifiedAt;
    }
    
    // Utility methods
    public boolean isPending() {
        return "pending".equals(verificationStatus);
    }
    
    public boolean isVerified() {
        return "verified".equals(verificationStatus);
    }
    
    public boolean isFailed() {
        return "failed".equals(verificationStatus);
    }
    
    public String getMaskedAccountNumber() {
        if (accountNumber == null || accountNumber.length() <= 4) {
            return accountNumber;
        }
        
        String mask = "*".repeat(accountNumber.length() - 4);
        return mask + accountNumber.substring(accountNumber.length() - 4);
    }
    
    @Override
    public String toString() {
        return "PaymentMethod{" +
                "methodId=" + methodId +
                ", userId=" + userId +
                ", methodType='" + methodType + '\'' +
                ", methodName='" + methodName + '\'' +
                ", accountNumber='" + getMaskedAccountNumber() + '\'' +
                ", bankName='" + bankName + '\'' +
                ", accountHolderName='" + accountHolderName + '\'' +
                ", isDefault=" + isDefault +
                ", isActive=" + isActive +
                ", verificationStatus='" + verificationStatus + '\'' +
                ", createdAt=" + createdAt +
                ", verifiedAt=" + verifiedAt +
                '}';
    }
}