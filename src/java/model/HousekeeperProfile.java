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
    private String fullName;
    private String email;
    private String phoneNumber;
    private String address;
    private int birthYear;
    private String hometown;
    private int experienceYears;
    private double hourlyRate;
    private double dailyRate;
    private double monthlyRate;
    private String workAreas;
    private String skills;
    private String profileImageUrl;
    private double averageRating;
    private int bookingCount;

    public HousekeeperProfile() {}

    // Getters and Setters
    public int getHousekeeperId() { return housekeeperId; }
    public void setHousekeeperId(int housekeeperId) { this.housekeeperId = housekeeperId; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public int getBirthYear() { return birthYear; }
    public void setBirthYear(int birthYear) { this.birthYear = birthYear; }
    public String getHometown() { return hometown; }
    public void setHometown(String hometown) { this.hometown = hometown; }
    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }
    public double getHourlyRate() { return hourlyRate; }
    public void setHourlyRate(double hourlyRate) { this.hourlyRate = hourlyRate; }
    public double getDailyRate() { return dailyRate; }
    public void setDailyRate(double dailyRate) { this.dailyRate = dailyRate; }
    public double getMonthlyRate() { return monthlyRate; }
    public void setMonthlyRate(double monthlyRate) { this.monthlyRate = monthlyRate; }
    public String getWorkAreas() { return workAreas; }
    public void setWorkAreas(String workAreas) { this.workAreas = workAreas; }
    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }
    public String getProfileImageUrl() { return profileImageUrl; }
    public void setProfileImageUrl(String profileImageUrl) { this.profileImageUrl = profileImageUrl; }
    public double getAverageRating() { return averageRating; }
    public void setAverageRating(double averageRating) { this.averageRating = averageRating; }
    public int getBookingCount() { return bookingCount; }
    public void setBookingCount(int bookingCount) { this.bookingCount = bookingCount; }
}