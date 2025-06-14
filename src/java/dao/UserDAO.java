package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import utils.DBContext;

public class UserDAO {
    private Connection conn;

    public UserDAO() {
        conn = DBContext.getConnection();
        if (conn == null) {
            throw new RuntimeException("Failed to establish database connection.");
        }
    }

    public User getUserByEmailAndPassword(String email, String password) {
        String sql = "SELECT u.user_id, u.email, u.full_name, u.gender, u.phone_number, u.address, r.name AS role, u.is_active, u.birth_year, u.hometown, hp.profile_image_url " +
                     "FROM users u " +
                     "INNER JOIN roles r ON u.role_id = r.role_id " +
                     "LEFT JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id " +
                     "WHERE u.email = ? AND u.password = ? AND u.is_active = 1";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setActive(rs.getBoolean("is_active"));
                user.setBirthYear(rs.getInt("birth_year"));
                user.setHometown(rs.getString("hometown"));
                user.setProfileImageUrl(rs.getString("profile_image_url"));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error while authenticating user: " + e.getMessage(), e);
        }
        return null;
    }

    public boolean emailExists(String email) {
        String sql = "SELECT 1 FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi kiểm tra email tồn tại: " + e.getMessage(), e);
        }
    }

    public User saveUser(User user) {
    // Kiểm tra vai trò có tồn tại
    String checkRoleSql = "SELECT role_id FROM roles WHERE name = ?";
    try (Connection conn = DBContext.getConnection();
         PreparedStatement checkPs = conn.prepareStatement(checkRoleSql)) {
        checkPs.setString(1, user.getRole());
        ResultSet rs = checkPs.executeQuery();
        if (!rs.next()) {
            throw new RuntimeException("Vai trò '" + user.getRole() + "' không tồn tại trong bảng roles.");
        }
        int roleId = rs.getInt("role_id");

        // Tiến hành chèn dữ liệu
        String sql = "INSERT INTO users (email, password, full_name, gender, phone_number, address, role_id, is_active, birth_year, hometown) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAddress());
            ps.setInt(7, roleId); // Sử dụng role_id đã lấy
            ps.setBoolean(8, user.isActive());
            ps.setInt(9, user.getBirthYear());
            ps.setString(10, user.getHometown());
            ps.executeUpdate();

            // Lấy userId vừa tạo
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                user.setUserId(generatedKeys.getInt(1));
            } else {
                throw new SQLException("Không thể lấy userId sau khi chèn.");
            }
            return user;
        }
    } catch (SQLException e) {
        throw new RuntimeException("Lỗi lưu user vào DB: " + e.getMessage(), e);
    }
}
}