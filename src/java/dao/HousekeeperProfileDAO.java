/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;
import model.HousekeeperProfile;
import model.User;
import utils.DBContext;
/**
 *
 * @author ADMIN
 */

public class HousekeeperProfileDAO {
    private Connection conn;

    public HousekeeperProfileDAO() {
        conn = DBContext.getConnection();
        if (conn == null) {
            throw new RuntimeException("Failed to establish database connection.");
        }
    }

    public void saveVerificationRequest(int userId, String documentUrlFront, String documentUrlBack, String selfieUrl, 
                                       String status, String reviewedAt, Integer reviewerId, String comments) {
        String sql = "INSERT INTO verification_requests (user_id, document_url, status, reviewed_at, reviewer_id, comments) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, documentUrlFront + "|" + documentUrlBack); // Kết hợp hai URL
            ps.setString(3, status);
            ps.setString(4, reviewedAt); // Có thể null
            ps.setObject(5, reviewerId); // Có thể null
            ps.setString(6, comments);   // Có thể null
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi lưu yêu cầu xác minh: " + e.getMessage(), e);
        }
    }

    public void approveVerificationRequest(int verificationId, int reviewerId, String comments, HttpSession session) {
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);

            // Lấy thông tin từ verification_requests
            String selectSql = "SELECT user_id, document_url FROM verification_requests WHERE verification_id = ? AND status = 'pending'";
            PreparedStatement selectPs = conn.prepareStatement(selectSql);
            selectPs.setInt(1, verificationId);
            ResultSet rs = selectPs.executeQuery();
            if (!rs.next()) {
                throw new RuntimeException("Yêu cầu xác minh không tồn tại hoặc đã được xử lý.");
            }

            int userId = rs.getInt("user_id");
            String documentUrls = rs.getString("document_url");
            String[] urls = documentUrls.split("\\|");
            if (urls.length < 2) {
                throw new RuntimeException("Dữ liệu giấy tờ xác minh không đầy đủ.");
            }
            String documentUrlFront = urls[0];
            String documentUrlBack = urls[1];

            // Lấy HousekeeperProfile từ session
            HousekeeperProfile profile = (HousekeeperProfile) session.getAttribute("pendingProfile_" + userId);
            if (profile == null) {
                throw new RuntimeException("Không tìm thấy thông tin hồ sơ tạm thời cho user ID: " + userId);
            }

            // Kiểm tra tính hợp lệ của dữ liệu
            if (profile.getExperienceYears() < 0 || profile.getHourlyRate() < 0 || profile.getDailyRate() < 0 || 
                profile.getMonthlyRate() < 0 || profile.getAverageRating() < 0 || profile.getAverageRating() > 5 || 
                profile.getBookingCount() < 0) {
                throw new RuntimeException("Dữ liệu hồ sơ không hợp lệ.");
            }

            // Lưu vào housekeeper_profiles
            String insertSql = "INSERT INTO housekeeper_profiles (housekeeper_id, experience_years, hourly_rate, daily_rate, " +
                              "monthly_rate, average_rating, booking_count, work_areas, skills, profile_image_url) " +
                              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement insertPs = conn.prepareStatement(insertSql);
            insertPs.setInt(1, userId);
            insertPs.setInt(2, profile.getExperienceYears());
            insertPs.setDouble(3, profile.getHourlyRate());
            insertPs.setDouble(4, profile.getDailyRate());
            insertPs.setDouble(5, profile.getMonthlyRate());
            insertPs.setDouble(6, profile.getAverageRating());
            insertPs.setInt(7, profile.getBookingCount());
            insertPs.setString(8, profile.getWorkAreas());
            insertPs.setString(9, profile.getSkills());
            insertPs.setString(10, profile.getProfileImageUrl());
            insertPs.executeUpdate();

            // Cập nhật trạng thái user thành active
            String updateUserSql = "UPDATE users SET is_active = 1, updated_at = SYSDATETIMEOFFSET() WHERE user_id = ?";
            PreparedStatement updateUserPs = conn.prepareStatement(updateUserSql);
            updateUserPs.setInt(1, userId);
            updateUserPs.executeUpdate();

            // Cập nhật trạng thái verification_requests
            String updateVerificationSql = "UPDATE verification_requests SET status = ?, reviewed_at = ?, reviewer_id = ?, comments = ? WHERE verification_id = ?";
            PreparedStatement updateVerificationPs = conn.prepareStatement(updateVerificationSql);
            updateVerificationPs.setString(1, "approved");
            // Đặt thời gian hiện tại: 05:12 PM +07, Saturday, June 14, 2025
            updateVerificationPs.setString(2, "2025-06-14T17:12:00+07:00");
            updateVerificationPs.setInt(3, reviewerId);
            updateVerificationPs.setString(4, comments != null ? comments : "Đã phê duyệt thành công");
            updateVerificationPs.setInt(5, verificationId);
            updateVerificationPs.executeUpdate();

            // Xóa dữ liệu session sau khi phê duyệt
            session.removeAttribute("pendingProfile_" + userId);

            conn.commit();
            System.out.println("Phê duyệt yêu cầu thành công cho user ID: " + userId + " tại " + java.time.OffsetDateTime.now());
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                    System.err.println("Rollback do lỗi: " + e.getMessage());
                } catch (SQLException ex) {
                    throw new RuntimeException("Lỗi rollback: " + ex.getMessage(), ex);
                }
            }
            throw new RuntimeException("Lỗi phê duyệt yêu cầu: " + e.getMessage(), e);
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    throw new RuntimeException("Lỗi đóng kết nối: " + e.getMessage(), e);
                }
            }
        }
    }

    public void updateUserStatus(int userId, boolean isActive) {
        String sql = "UPDATE users SET is_active = ? WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBoolean(1, isActive);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi cập nhật trạng thái user: " + e.getMessage(), e);
        }
    }
}