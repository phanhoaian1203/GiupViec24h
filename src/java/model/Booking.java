/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.OffsetDateTime;
import java.util.Date;

public class Booking {
    private int bookingId;
    private int customerId;
    private int housekeeperId;
    private OffsetDateTime startTime;
    private OffsetDateTime endTime;
    private String status;
    private String specialRequests;
    private double totalPrice;
    private double discountedPrice;
    private String customerName;
    private String customerAddress;
    private String serviceNames; // Danh sách tên dịch vụ (nối chuỗi)

    public Booking() {}

    public Booking(int bookingId, int customerId, int housekeeperId, OffsetDateTime startTime, OffsetDateTime endTime,
                   String status, String specialRequests, double totalPrice, double discountedPrice,
                   String customerName, String customerAddress, String serviceNames) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.housekeeperId = housekeeperId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
        this.specialRequests = specialRequests;
        this.totalPrice = totalPrice;
        this.discountedPrice = discountedPrice;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.serviceNames = serviceNames;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public int getHousekeeperId() { return housekeeperId; }
    public void setHousekeeperId(int housekeeperId) { this.housekeeperId = housekeeperId; }
    public OffsetDateTime getStartTime() { return startTime; }
    public void setStartTime(OffsetDateTime startTime) { this.startTime = startTime; }
    public OffsetDateTime getEndTime() { return endTime; }
    public void setEndTime(OffsetDateTime endTime) { this.endTime = endTime; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getSpecialRequests() { return specialRequests; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }
    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    public double getDiscountedPrice() { return discountedPrice; }
    public void setDiscountedPrice(double discountedPrice) { this.discountedPrice = discountedPrice; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public String getCustomerAddress() { return customerAddress; }
    public void setCustomerAddress(String customerAddress) { this.customerAddress = customerAddress; }
    public String getServiceNames() { return serviceNames; }
    public void setServiceNames(String serviceNames) { this.serviceNames = serviceNames; }

    // Convert OffsetDateTime to Date for JSTL
    public Date getStartTimeAsDate() {
        return startTime != null ? Date.from(startTime.toInstant()) : null;
    }

    public Date getEndTimeAsDate() {
        return endTime != null ? Date.from(endTime.toInstant()) : null;
    }
}