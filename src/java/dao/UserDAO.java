package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.UserGoogleDto;
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
        String sql = "SELECT u.user_id, u.email, u.full_name, u.gender, u.phone_number, u.address, " +
                     "r.role_id, r.name AS role, u.is_active, u.birth_year, u.hometown, hp.profile_image_url " +
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
                user.setRoleId(rs.getInt("role_id")); // Lấy role_id
                user.setRole(rs.getString("role"));
                user.setActive(rs.getBoolean("is_active"));
                user.setBirthYear(rs.getInt("birth_year"));
                user.setHometown(rs.getString("hometown"));
                user.setProfileImageUrl(rs.getString("profile_image_url"));
                System.out.println("✅ User authenticated: " + email);
                return user;
            } else {
                System.out.println("❌ Invalid email or password for: " + email);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Database error while authenticating user: " + e.getMessage(), e);
        }
        return null;
    }

    public User getUserById(int userId) {
        String sql = """
            SELECT u.user_id, u.email, u.full_name, u.gender, u.phone_number, u.address, 
                   r.name AS role, u.is_active, u.birth_year, u.hometown, 
                   hp.profile_image_url, hp.hourly_rate, hp.average_rating, hp.booking_count,
                   hp.skills, hp.work_areas, hp.experience_years, hp.deposit_percentage
            FROM users u 
            INNER JOIN roles r ON u.role_id = r.role_id 
            LEFT JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id 
            WHERE u.user_id = ?
            """;
            
        try (Connection connection = DBContext.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
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
                
                // Additional housekeeper fields if applicable
                if ("housekeeper".equals(rs.getString("role"))) {
                    user.setHourlyRate(rs.getBigDecimal("hourly_rate"));
                    user.setAverageRating(rs.getDouble("average_rating"));
                    user.setBookingCount(rs.getInt("booking_count"));
                    user.setSkills(rs.getString("skills"));
                    user.setWorkAreas(rs.getString("work_areas"));
                    user.setExperienceYears(rs.getInt("experience_years"));
                    user.setDepositPercentage(rs.getInt("deposit_percentage"));
                }
                
                System.out.println("✅ Found user: " + user.getFullName() + " (ID: " + userId + ")");
                return user;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting user by ID " + userId + ": " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }

    public User findUserByEmailOrPhone(String emailOrPhone) {
        String sql = """
            SELECT u.user_id, u.email, u.full_name, u.gender, u.phone_number, u.address, 
                   r.name AS role, u.is_active, u.birth_year, u.hometown, hp.profile_image_url
            FROM users u 
            INNER JOIN roles r ON u.role_id = r.role_id 
            LEFT JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id 
            WHERE (u.email = ? OR u.phone_number = ?) AND u.is_active = 1
            """;
            
        try (Connection connection = DBContext.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            
            ps.setString(1, emailOrPhone);
            ps.setString(2, emailOrPhone);
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
                
                System.out.println("✅ Found user by email/phone: " + user.getFullName());
                return user;
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error finding user by email/phone " + emailOrPhone + ": " + e.getMessage());
            e.printStackTrace();
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
        String checkRoleSql = "SELECT role_id FROM roles WHERE name = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement checkPs = conn.prepareStatement(checkRoleSql)) {
            checkPs.setString(1, user.getRole());
            ResultSet rs = checkPs.executeQuery();
            if (!rs.next()) {
                throw new RuntimeException("Vai trò '" + user.getRole() + "' không tồn tại trong bảng roles.");
            }
            int roleId = rs.getInt("role_id");

            String sql = "INSERT INTO users (email, password, full_name, gender, phone_number, address, role_id, is_active, birth_year, hometown) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, user.getEmail());
                ps.setString(2, user.getPassword()); 
                ps.setString(3, user.getFullName());
                ps.setString(4, user.getGender());
                ps.setString(5, user.getPhoneNumber());
                ps.setString(6, user.getAddress());
                ps.setInt(7, roleId);
                ps.setBoolean(8, user.isActive());
                ps.setInt(9, user.getBirthYear());
                ps.setString(10, user.getHometown());
                ps.executeUpdate();

                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    user.setUserId(generatedKeys.getInt(1));
                    user.setRoleId(roleId); // Gán role_id cho user
                } else {
                    throw new SQLException("Không thể lấy userId sau khi chèn.");
                }
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi lưu user vào DB: " + e.getMessage(), e);
        }
    }

    private void createVerificationRequest(int userId, String documentUrl) {
        String sql = "INSERT INTO verification_requests (user_id, document_url, status, submitted_at) VALUES (?, ?, 'pending', GETDATE())";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, documentUrl);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi tạo yêu cầu xác minh: " + e.getMessage(), e);
        }
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT u.user_id, u.email, u.full_name, r.role_id, r.name AS role " +
                     "FROM users u INNER JOIN roles r ON u.role_id = r.role_id WHERE u.email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setRoleId(rs.getInt("role_id")); // Lấy role_id
                user.setRole(rs.getString("role"));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi lấy user theo email: " + e.getMessage(), e);
        }
        return null;
    }

    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPassword); 
            ps.setString(2, email);
            int rows = ps.executeUpdate();
            System.out.println("✅ Password updated, rows affected: " + rows);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getPendingUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.user_id, u.email, u.full_name, r.role_id, r.name AS role " +
                     "FROM users u INNER JOIN roles r ON u.role_id = r.role_id WHERE u.is_active = 0";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setRoleId(rs.getInt("role_id")); // Lấy role_id
                user.setRole(rs.getString("role"));
                user.setActive(false);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void activateUser(int userId) {
        String sql = "UPDATE users SET is_active = 1 WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void saveGoogleUser(UserGoogleDto userDto) {
        if (emailExists(userDto.getEmail())) {
            System.out.println("User already exists: " + userDto.getEmail());
            return;
        }

        String sql = "INSERT INTO users (email, password, full_name, role_id, is_active, created_at, updated_at) " +
                     "VALUES (?, ?, ?, (SELECT role_id FROM roles WHERE name = 'customer'), 1, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET())";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userDto.getEmail());
            ps.setString(2, "GOOGLE");
            ps.setString(3, userDto.getName());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi lưu người dùng Google: " + e.getMessage(), e);
        }
    }
}