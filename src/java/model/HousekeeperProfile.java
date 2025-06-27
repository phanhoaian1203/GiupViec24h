package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * HousekeeperProfile Model Class - Maps to housekeeper_profiles table
 * Represents detailed profile information for housekeepers
 */
public class HousekeeperProfile {
    private int housekeeperId;
    private int experienceYears;
    private BigDecimal hourlyRate;
    private BigDecimal dailyRate;
    private BigDecimal monthlyRate;
    private BigDecimal averageRating;
    private int bookingCount;
    private String workAreas;
    private String skills;
    private String profileImageUrl;
    private int depositPercentage;
    private LocalDateTime updatedAt;
    
    // User information for joins
    private String fullName;
    private String email;
    private String phoneNumber;
    private String address;
    private String gender;
    private Integer birthYear;
    private String hometown;
    private boolean active;

    // Constructors
    public HousekeeperProfile() {
        this.averageRating = BigDecimal.ZERO;
        this.bookingCount = 0;
        this.depositPercentage = 30; // Default 30%
        this.updatedAt = LocalDateTime.now();
    }

    public HousekeeperProfile(int housekeeperId, int experienceYears, 
                            BigDecimal hourlyRate, String workAreas, String skills) {
        this();
        this.housekeeperId = housekeeperId;
        this.experienceYears = experienceYears;
        this.hourlyRate = hourlyRate;
        this.workAreas = workAreas;
        this.skills = skills;
    }

    // Getters and Setters
    public int getHousekeeperId() {
        return housekeeperId;
    }

    public void setHousekeeperId(int housekeeperId) {
        this.housekeeperId = housekeeperId;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    public BigDecimal getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(BigDecimal hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public BigDecimal getDailyRate() {
        return dailyRate;
    }

    public void setDailyRate(BigDecimal dailyRate) {
        this.dailyRate = dailyRate;
    }

    public BigDecimal getMonthlyRate() {
        return monthlyRate;
    }

    public void setMonthlyRate(BigDecimal monthlyRate) {
        this.monthlyRate = monthlyRate;
    }

    public BigDecimal getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(BigDecimal averageRating) {
        this.averageRating = averageRating;
    }

    public int getBookingCount() {
        return bookingCount;
    }

    public void setBookingCount(int bookingCount) {
        this.bookingCount = bookingCount;
    }

    public String getWorkAreas() {
        return workAreas;
    }

    public void setWorkAreas(String workAreas) {
        this.workAreas = workAreas;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getProfileImageUrl() {
        return profileImageUrl;
    }

    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }

    public int getDepositPercentage() {
        return depositPercentage;
    }

    public void setDepositPercentage(int depositPercentage) {
        this.depositPercentage = depositPercentage;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    // User fields
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(Integer birthYear) {
        this.birthYear = birthYear;
    }

    public String getHometown() {
        return hometown;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    // Additional computed field for convenience
    public int getUserId() {
        return housekeeperId; // Same as housekeeperId since it's FK to users
    }

    // Utility methods
    public BigDecimal calculateDepositAmount(BigDecimal totalPrice) {
        BigDecimal percentage = new BigDecimal(depositPercentage).divide(new BigDecimal(100));
        return totalPrice.multiply(percentage);
    }

    public BigDecimal calculateRemainingAmount(BigDecimal totalPrice) {
        return totalPrice.subtract(calculateDepositAmount(totalPrice));
    }

    public boolean hasSkill(String skillName) {
        return skills != null && skills.toLowerCase().contains(skillName.toLowerCase());
    }

    public String[] getSkillsArray() {
        if (skills == null || skills.isEmpty()) {
            return new String[0];
        }
        return skills.split(",");
    }

    public boolean worksInArea(String area) {
        return workAreas != null && workAreas.toLowerCase().contains(area.toLowerCase());
    }

    public boolean isExperienced() {
        return experienceYears >= 3;
    }

    public boolean isHighlyRated() {
        return averageRating != null && averageRating.compareTo(new BigDecimal("4.5")) >= 0;
    }

    public boolean isPopular() {
        return bookingCount >= 20;
    }

    // Format methods
    public String getFormattedHourlyRate() {
        return hourlyRate != null ? String.format("%,.0f VNĐ/giờ", hourlyRate) : "Chưa cập nhật";
    }

    public String getFormattedDailyRate() {
        return dailyRate != null ? String.format("%,.0f VNĐ/ngày", dailyRate) : "Chưa cập nhật";
    }

    public String getFormattedMonthlyRate() {
        return monthlyRate != null ? String.format("%,.0f VNĐ/tháng", monthlyRate) : "Chưa cập nhật";
    }

    public String getFormattedAverageRating() {
        return averageRating != null ? String.format("%.1f", averageRating) : "4.0";
    }

    public String getExperienceDisplay() {
        if (experienceYears == 0) {
            return "Mới vào nghề";
        } else if (experienceYears == 1) {
            return "1 năm kinh nghiệm";
        } else {
            return experienceYears + " năm kinh nghiệm";
        }
    }

    public String getDepositPercentageDisplay() {
        return depositPercentage + "%";
    }

    @Override
    public String toString() {
        return "HousekeeperProfile{" +
                "housekeeperId=" + housekeeperId +
                ", fullName='" + fullName + '\'' +
                ", experienceYears=" + experienceYears +
                ", hourlyRate=" + hourlyRate +
                ", averageRating=" + averageRating +
                ", bookingCount=" + bookingCount +
                ", workAreas='" + workAreas + '\'' +
                ", active=" + active +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HousekeeperProfile that = (HousekeeperProfile) o;
        return housekeeperId == that.housekeeperId;
    }

    @Override
    public int hashCode() {
        return Integer.hashCode(housekeeperId);
    }
}