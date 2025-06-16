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
import java.util.stream.Collectors;
import model.Booking;
import utils.DBContext;

public class BookingDAO {
    private Connection conn;

    public BookingDAO() {
        conn = DBContext.getConnection();
        if (conn == null) {
            throw new RuntimeException("Failed to establish database connection.");
        }
    }

    public List<Booking> getBookingsByHousekeeperId(int housekeeperId, String startDate, String endDate, String status) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.booking_id, b.customer_id, b.housekeeper_id, b.start_time, b.end_time, " +
                     "b.status, b.special_requests, b.total_price, b.discounted_price, " +
                     "u.full_name AS customer_name, u.address AS customer_address, " +
                     "STRING_AGG(s.service_name, ', ') AS service_names " +
                     "FROM bookings b " +
                     "JOIN users u ON b.customer_id = u.user_id " +
                     "LEFT JOIN booking_service_details bsd ON b.booking_id = bsd.booking_id " +
                     "LEFT JOIN services s ON bsd.service_id = s.service_id " +
                     "WHERE b.housekeeper_id = ? " +
                     (startDate != null && !startDate.isEmpty() ? "AND b.start_time >= ? " : "") +
                     (endDate != null && !endDate.isEmpty() ? "AND b.end_time <= ? " : "") +
                     (status != null && !status.isEmpty() ? "AND b.status = ? " : "") +
                     "GROUP BY b.booking_id, b.customer_id, b.housekeeper_id, b.start_time, b.end_time, " +
                     "b.status, b.special_requests, b.total_price, b.discounted_price, " +
                     "u.full_name, u.address " +
                     "ORDER BY b.start_time";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            int paramIndex = 1;
            ps.setInt(paramIndex++, housekeeperId);
            if (startDate != null && !startDate.isEmpty()) {
                ps.setString(paramIndex++, startDate + "T00:00:00+07:00");
            }
            if (endDate != null && !endDate.isEmpty()) {
                ps.setString(paramIndex++, endDate + "T23:59:59+07:00");
            }
            if (status != null && !status.isEmpty()) {
                ps.setString(paramIndex++, status);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setHousekeeperId(rs.getInt("housekeeper_id"));
                booking.setStartTime(rs.getObject("start_time", OffsetDateTime.class));
                booking.setEndTime(rs.getObject("end_time", OffsetDateTime.class));
                booking.setStatus(rs.getString("status"));
                booking.setSpecialRequests(rs.getString("special_requests"));
                booking.setTotalPrice(rs.getDouble("total_price"));
                booking.setDiscountedPrice(rs.getDouble("discounted_price"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setCustomerAddress(rs.getString("customer_address"));
                booking.setServiceNames(rs.getString("service_names"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching bookings: " + e.getMessage(), e);
        }
        return bookings;
    }
}