package model;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

/**
 * ✅ UPDATED: Model class for customer_wallets table
 * - Updated to match the new database schema
 * - Added validation methods
 * - Enhanced utility methods for e-wallet operations
 */
public class Wallet {
    private int walletId;
    private int customerId; // ✅ CHANGED: userId -> customerId to match schema
    private BigDecimal balance;
    private BigDecimal totalDeposited;
    private BigDecimal totalWithdrawn;
    private boolean isActive;
    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;
    
    // Additional fields for e-wallet functionality
    private BigDecimal lockedBalance; // For holding funds during transactions
    
    // Constructors
    public Wallet() {
        this.balance = BigDecimal.ZERO;
        this.totalDeposited = BigDecimal.ZERO;
        this.totalWithdrawn = BigDecimal.ZERO;
        this.lockedBalance = BigDecimal.ZERO;
        this.isActive = true;
    }
    
    public Wallet(int customerId) {
        this();
        this.customerId = customerId;
    }
    
    // Getters and Setters
    public int getWalletId() {
        return walletId;
    }
    
    public void setWalletId(int walletId) {
        this.walletId = walletId;
    }
    
    public int getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    // ✅ DEPRECATED: Keep for backward compatibility
    public int getUserId() {
        return customerId;
    }
    
    public void setUserId(int userId) {
        this.customerId = userId;
    }
    
    public BigDecimal getBalance() {
        return balance != null ? balance : BigDecimal.ZERO;
    }
    
    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }
    
    public BigDecimal getTotalDeposited() {
        return totalDeposited != null ? totalDeposited : BigDecimal.ZERO;
    }
    
    public void setTotalDeposited(BigDecimal totalDeposited) {
        this.totalDeposited = totalDeposited;
    }
    
    public BigDecimal getTotalWithdrawn() {
        return totalWithdrawn != null ? totalWithdrawn : BigDecimal.ZERO;
    }
    
    public void setTotalWithdrawn(BigDecimal totalWithdrawn) {
        this.totalWithdrawn = totalWithdrawn;
    }
    
    public boolean isActive() {
        return isActive;
    }
    
    public void setActive(boolean active) {
        isActive = active;
    }
    
    public OffsetDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(OffsetDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public OffsetDateTime getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(OffsetDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public BigDecimal getLockedBalance() {
        return lockedBalance != null ? lockedBalance : BigDecimal.ZERO;
    }
    
    public void setLockedBalance(BigDecimal lockedBalance) {
        this.lockedBalance = lockedBalance;
    }
    
    // ✅ DEPRECATED: Keep for backward compatibility
    public String getWalletStatus() {
        return isActive ? "active" : "inactive";
    }
    
    public void setWalletStatus(String status) {
        this.isActive = "active".equals(status);
    }
    
    // Utility methods for e-wallet operations
    
    /**
     * Get available balance (balance - locked balance)
     */
    public BigDecimal getAvailableBalance() {
        return getBalance().subtract(getLockedBalance());
    }
    
    /**
     * Check if wallet has enough available balance
     */
    public boolean hasEnoughBalance(BigDecimal amount) {
        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            return false;
        }
        return getAvailableBalance().compareTo(amount) >= 0;
    }
    
    /**
     * Add money to wallet (deposit)
     */
    public void deposit(BigDecimal amount) {
        if (amount != null && amount.compareTo(BigDecimal.ZERO) > 0) {
            this.balance = getBalance().add(amount);
            this.totalDeposited = getTotalDeposited().add(amount);
        }
    }
    
    /**
     * Remove money from wallet (withdraw)
     */
    public boolean withdraw(BigDecimal amount) {
        if (amount != null && amount.compareTo(BigDecimal.ZERO) > 0 && hasEnoughBalance(amount)) {
            this.balance = getBalance().subtract(amount);
            this.totalWithdrawn = getTotalWithdrawn().add(amount);
            return true;
        }
        return false;
    }
    
    /**
     * Lock amount for pending transactions
     */
    public boolean lockAmount(BigDecimal amount) {
        if (amount != null && amount.compareTo(BigDecimal.ZERO) > 0 && hasEnoughBalance(amount)) {
            this.lockedBalance = getLockedBalance().add(amount);
            return true;
        }
        return false;
    }
    
    /**
     * Unlock amount (cancel transaction or complete)
     */
    public void unlockAmount(BigDecimal amount) {
        if (amount != null && amount.compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal currentLocked = getLockedBalance();
            if (currentLocked.compareTo(amount) >= 0) {
                this.lockedBalance = currentLocked.subtract(amount);
            } else {
                this.lockedBalance = BigDecimal.ZERO;
            }
        }
    }
    
    /**
     * Complete locked transaction (convert locked to spent)
     */
    public boolean completeLocked(BigDecimal amount) {
        if (amount != null && amount.compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal currentLocked = getLockedBalance();
            if (currentLocked.compareTo(amount) >= 0) {
                this.lockedBalance = currentLocked.subtract(amount);
                this.balance = getBalance().subtract(amount);
                return true;
            }
        }
        return false;
    }
    
    /**
     * Get wallet summary for display
     */
    public String getSummary() {
        return String.format("Wallet[ID=%d, Customer=%d, Balance=%s, Available=%s, Deposited=%s, Withdrawn=%s, Active=%s]",
                walletId, customerId, 
                getBalance().toPlainString(),
                getAvailableBalance().toPlainString(),
                getTotalDeposited().toPlainString(),
                getTotalWithdrawn().toPlainString(),
                isActive);
    }
    
    /**
     * Validate wallet state
     */
    public boolean isValid() {
        return customerId > 0 
                && getBalance().compareTo(BigDecimal.ZERO) >= 0
                && getLockedBalance().compareTo(BigDecimal.ZERO) >= 0
                && getTotalDeposited().compareTo(BigDecimal.ZERO) >= 0
                && getTotalWithdrawn().compareTo(BigDecimal.ZERO) >= 0
                && getLockedBalance().compareTo(getBalance()) <= 0;
    }
    
    @Override
    public String toString() {
        return "Wallet{" +
                "walletId=" + walletId +
                ", customerId=" + customerId +
                ", balance=" + getBalance() +
                ", lockedBalance=" + getLockedBalance() +
                ", totalDeposited=" + getTotalDeposited() +
                ", totalWithdrawn=" + getTotalWithdrawn() +
                ", isActive=" + isActive +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Wallet wallet = (Wallet) obj;
        return walletId == wallet.walletId && customerId == wallet.customerId;
    }
    
    @Override
    public int hashCode() {
        return java.util.Objects.hash(walletId, customerId);
    }
}