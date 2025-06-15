/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class HousekeeperProfile {
    private int housekeeperId;
    private int experienceYears;
    private double hourlyRate;
    private double dailyRate;
    private double monthlyRate;
    private double averageRating;
    private int bookingCount;
    private String workAreas;
    private String skills;
    private String profileImageUrl;
    private java.time.OffsetDateTime updatedAt;

    public HousekeeperProfile() {}

    // Getters and Setters
    public int getHousekeeperId() { return housekeeperId; }
    public void setHousekeeperId(int housekeeperId) { this.housekeeperId = housekeeperId; }
    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }
    public double getHourlyRate() { return hourlyRate; }
    public void setHourlyRate(double hourlyRate) { this.hourlyRate = hourlyRate; }
    public double getDailyRate() { return dailyRate; }
    public void setDailyRate(double dailyRate) { this.dailyRate = dailyRate; }
    public double getMonthlyRate() { return monthlyRate; }
    public void setMonthlyRate(double monthlyRate) { this.monthlyRate = monthlyRate; }
    public double getAverageRating() { return averageRating; }
    public void setAverageRating(double averageRating) { this.averageRating = averageRating; }
    public int getBookingCount() { return bookingCount; }
    public void setBookingCount(int bookingCount) { this.bookingCount = bookingCount; }
    public String getWorkAreas() { return workAreas; }
    public void setWorkAreas(String workAreas) { this.workAreas = workAreas; }
    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }
    public String getProfileImageUrl() { return profileImageUrl; }
    public void setProfileImageUrl(String profileImageUrl) { this.profileImageUrl = profileImageUrl; }
    public java.time.OffsetDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(java.time.OffsetDateTime updatedAt) { this.updatedAt = updatedAt; }
}