package model;

import java.math.BigDecimal;

public class User {
    private int userId; 
    private String email;
    private String password;
    private String fullName;
    private String gender;
    private String phoneNumber;
    private String address;
    private String role;
    private boolean isActive;
    private int birthYear;
    private String hometown;
    private String profileImageUrl;
    
    // NEW: Additional fields for housekeeper functionality
    private BigDecimal hourlyRate;
    private Double averageRating;
    private int bookingCount;
    private String skills;
    private String workAreas;
    private int experienceYears;
    private int depositPercentage;
    private int roleId;
    
    public User() {}
    
    public User(int userId, String email, String password, String fullName, String gender, 
                String phoneNumber, String address, String role, boolean isActive, 
                int birthYear, String hometown, String profileImageUrl) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.role = role;
        this.isActive = isActive;
        this.birthYear = birthYear;
        this.hometown = hometown;
        this.profileImageUrl = profileImageUrl;
    }
    
    // Existing getters & setters...
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    
    public boolean isActive() { return isActive; }
    public void setActive(boolean isActive) { this.isActive = isActive; }
    
    public int getBirthYear() { return birthYear; }
    public void setBirthYear(int birthYear) { this.birthYear = birthYear; }
    
    public String getHometown() { return hometown; }
    public void setHometown(String hometown) { this.hometown = hometown; }
    
    public String getProfileImageUrl() { return profileImageUrl; }
    public void setProfileImageUrl(String profileImageUrl) { this.profileImageUrl = profileImageUrl; }
    
    // NEW: Housekeeper-specific getters & setters
    public BigDecimal getHourlyRate() { return hourlyRate; }
    public void setHourlyRate(BigDecimal hourlyRate) { this.hourlyRate = hourlyRate; }
    
    public Double getAverageRating() { return averageRating; }
    public void setAverageRating(Double averageRating) { this.averageRating = averageRating; }
    
    public int getBookingCount() { return bookingCount; }
    public void setBookingCount(int bookingCount) { this.bookingCount = bookingCount; }
    
    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }
    
    public String getWorkAreas() { return workAreas; }
    public void setWorkAreas(String workAreas) { this.workAreas = workAreas; }
    
    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }
    
    public int getDepositPercentage() { return depositPercentage; }
    public void setDepositPercentage(int depositPercentage) { this.depositPercentage = depositPercentage; }
    
    public int getRoleId() { return roleId; }
    public void setRoleId(int roleId) { this.roleId = roleId; }
    
    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", email='" + email + '\'' +
                ", fullName='" + fullName + '\'' +
                ", role='" + role + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}