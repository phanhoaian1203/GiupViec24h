/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.OffsetDateTime;
import java.util.Date;
import java.time.ZoneId;

/**
 *
 * @author ADMIN
 */

public class HousekeeperSchedule {
    private int scheduleId;
    private int housekeeperId;
    private OffsetDateTime startTime;
    private OffsetDateTime endTime;
    private boolean isAvailable;

    public HousekeeperSchedule() {}

    public HousekeeperSchedule(int scheduleId, int housekeeperId, OffsetDateTime startTime, OffsetDateTime endTime, boolean isAvailable) {
        this.scheduleId = scheduleId;
        this.housekeeperId = housekeeperId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.isAvailable = isAvailable;
    }

    // Getters and Setters
    public int getScheduleId() { return scheduleId; }
    public void setScheduleId(int scheduleId) { this.scheduleId = scheduleId; }
    public int getHousekeeperId() { return housekeeperId; }
    public void setHousekeeperId(int housekeeperId) { this.housekeeperId = housekeeperId; }
    public OffsetDateTime getStartTime() { return startTime; }
    public void setStartTime(OffsetDateTime startTime) { this.startTime = startTime; }
    public OffsetDateTime getEndTime() { return endTime; }
    public void setEndTime(OffsetDateTime endTime) { this.endTime = endTime; }
    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean isAvailable) { this.isAvailable = isAvailable; }

    // Thêm getter để chuyển đổi OffsetDateTime thành Date
    public Date getStartTimeAsDate() {
        return startTime != null ? Date.from(startTime.toInstant()) : null;
    }

    public Date getEndTimeAsDate() {
        return endTime != null ? Date.from(endTime.toInstant()) : null;
    }
}