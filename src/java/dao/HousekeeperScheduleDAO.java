/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import model.HousekeeperSchedule;
import utils.DBContext;

public class HousekeeperScheduleDAO {
    private Connection conn;

    public HousekeeperScheduleDAO() {
        conn = DBContext.getConnection();
        if (conn == null) {
            throw new RuntimeException("Failed to establish database connection.");
        }
    }

    public List<HousekeeperSchedule> getSchedulesByHousekeeperId(int housekeeperId, String startDate, String endDate, String status) {
        List<HousekeeperSchedule> schedules = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT schedule_id, housekeeper_id, start_time, end_time, is_available " +
                                            "FROM housekeeper_schedules WHERE housekeeper_id = ?");
        List<Object> params = new ArrayList<>();
        params.add(housekeeperId);

        if (startDate != null && !startDate.isEmpty()) {
            sql.append(" AND start_time >= ?");
            params.add(startDate + "T00:00:00+07:00");
        }
        if (endDate != null && !endDate.isEmpty()) {
            sql.append(" AND end_time <= ?");
            params.add(endDate + "T23:59:59+07:00");
        }
        if (status != null && !status.isEmpty()) {
            sql.append(" AND is_available = ?");
            params.add(Integer.parseInt(status));
        }

        sql.append(" ORDER BY start_time");

        try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HousekeeperSchedule schedule = new HousekeeperSchedule();
                schedule.setScheduleId(rs.getInt("schedule_id"));
                schedule.setHousekeeperId(rs.getInt("housekeeper_id"));
                schedule.setStartTime(rs.getObject("start_time", OffsetDateTime.class));
                schedule.setEndTime(rs.getObject("end_time", OffsetDateTime.class));
                schedule.setAvailable(rs.getBoolean("is_available"));
                schedules.add(schedule);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching schedules: " + e.getMessage(), e);
        }
        return schedules;
    }
}