// Model cho Housekeeper
package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class Housekeeper {
    private int userId;
    private String email;
    private String fullName;
    private String gender;
    private String phoneNumber;
    private String address;
    private String hometown;
    private boolean isActive;
    private int birthYear;
    private LocalDateTime createdAt;
    
    // Thông tin profile
    private int experienceYears;
    private BigDecimal hourlyRate;
    private BigDecimal dailyRate;
    private BigDecimal monthlyRate;
    private BigDecimal averageRating;
    private int bookingCount;
    private String workAreas;
    private String skills;
    private String profileImageUrl;
    
    // Thêm các field để hiển thị trên JSP
    private List<String> skillsList;
    private boolean hasDiscount;
    private String timeSlot;
    
    // Constructor mặc định
    public Housekeeper() {}
    
    // Constructor đầy đủ
    public Housekeeper(int userId, String email, String fullName, String gender, 
                      String phoneNumber, String address, String hometown, 
                      boolean isActive, int birthYear, LocalDateTime createdAt,
                      int experienceYears, BigDecimal hourlyRate, BigDecimal dailyRate,
                      BigDecimal monthlyRate, BigDecimal averageRating, int bookingCount,
                      String workAreas, String skills, String profileImageUrl) {
        this.userId = userId;
        this.email = email;
        this.fullName = fullName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.hometown = hometown;
        this.isActive = isActive;
        this.birthYear = birthYear;
        this.createdAt = createdAt;
        this.experienceYears = experienceYears;
        this.hourlyRate = hourlyRate;
        this.dailyRate = dailyRate;
        this.monthlyRate = monthlyRate;
        this.averageRating = averageRating;
        this.bookingCount = bookingCount;
        this.workAreas = workAreas;
        this.skills = skills;
        this.profileImageUrl = profileImageUrl;
        
        // Xử lý skills thành list
        if (skills != null && !skills.isEmpty()) {
            this.skillsList = List.of(skills.split(","));
        }
        
        // Giả sử có discount nếu rating >= 4.5
        this.hasDiscount = averageRating != null && averageRating.compareTo(new BigDecimal("4.5")) >= 0;
        
        // Mặc định time slot
        this.timeSlot = "morning";
    }
    
    // Getters và Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getHometown() { return hometown; }
    public void setHometown(String hometown) { this.hometown = hometown; }
    
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
    
    public int getBirthYear() { return birthYear; }
    public void setBirthYear(int birthYear) { this.birthYear = birthYear; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }
    
    public BigDecimal getHourlyRate() { return hourlyRate; }
    public void setHourlyRate(BigDecimal hourlyRate) { this.hourlyRate = hourlyRate; }
    
    public BigDecimal getDailyRate() { return dailyRate; }
    public void setDailyRate(BigDecimal dailyRate) { this.dailyRate = dailyRate; }
    
    public BigDecimal getMonthlyRate() { return monthlyRate; }
    public void setMonthlyRate(BigDecimal monthlyRate) { this.monthlyRate = monthlyRate; }
    
    public BigDecimal getAverageRating() { return averageRating; }
    public void setAverageRating(BigDecimal averageRating) { this.averageRating = averageRating; }
    
    public int getBookingCount() { return bookingCount; }
    public void setBookingCount(int bookingCount) { this.bookingCount = bookingCount; }
    
    public String getWorkAreas() { return workAreas; }
    public void setWorkAreas(String workAreas) { this.workAreas = workAreas; }
    
    public String getSkills() { return skills; }
    public void setSkills(String skills) { 
        this.skills = skills;
        if (skills != null && !skills.isEmpty()) {
            this.skillsList = List.of(skills.split(","));
        }
    }
    
    public String getProfileImageUrl() { return profileImageUrl; }
    public void setProfileImageUrl(String profileImageUrl) { this.profileImageUrl = profileImageUrl; }
    
    public List<String> getSkillsList() { return skillsList; }
    public void setSkillsList(List<String> skillsList) { this.skillsList = skillsList; }
    
    public boolean isHasDiscount() { return hasDiscount; }
    public void setHasDiscount(boolean hasDiscount) { this.hasDiscount = hasDiscount; }
    
    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }
    
    @Override
    public String toString() {
        return "Housekeeper{" +
                "userId=" + userId +
                ", fullName='" + fullName + '\'' +
                ", workAreas='" + workAreas + '\'' +
                ", hourlyRate=" + hourlyRate +
                ", averageRating=" + averageRating +
                ", isActive=" + isActive +
                '}';
    }
}