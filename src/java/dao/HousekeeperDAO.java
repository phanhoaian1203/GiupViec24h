package dao;

import model.Housekeeper;
import utils.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class HousekeeperDAO {
    
    /**
     * Lấy tất cả housekeeper đã được xác minh và kích hoạt
     */
    public List<Housekeeper> getAllActiveHousekeepers() {
        List<Housekeeper> housekeepers = new ArrayList<>();
        
        String sql = """
            SELECT 
                u.user_id, u.email, u.full_name, u.gender, u.phone_number, 
                u.address, u.hometown, u.is_active, u.birth_year, u.created_at,
                hp.experience_years, hp.hourly_rate, hp.daily_rate, hp.monthly_rate,
                hp.average_rating, hp.booking_count, hp.work_areas, hp.skills, hp.profile_image_url
            FROM users u
            INNER JOIN roles r ON u.role_id = r.role_id
            INNER JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
            WHERE r.name = 'housekeeper' 
                AND u.is_active = 1
            ORDER BY hp.average_rating DESC, hp.booking_count DESC
            """;
        
        System.out.println("🔄 Executing getAllActiveHousekeepers query...");
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            int count = 0;
            while (rs.next()) {
                try {
                    count++;
                    Housekeeper housekeeper = mapResultSetToHousekeeper(rs);
                    housekeepers.add(housekeeper);
                    
                    // Log chi tiết từng housekeeper cho 3 đầu tiên
                    if (count <= 3) {
                        System.out.printf("   ✅ Loaded: %s (ID=%d, Skills=%s)\n", 
                            housekeeper.getFullName(), 
                            housekeeper.getUserId(),
                            housekeeper.getSkills());
                    }
                    
                } catch (Exception e) {
                    System.err.println("❌ Error mapping housekeeper at row " + count + ": " + e.getMessage());
                    continue;
                }
            }
            
            System.out.println("✅ Retrieved " + housekeepers.size() + " active housekeepers from database");
            
        } catch (SQLException e) {
            System.err.println("❌ SQL Error in getAllActiveHousekeepers: " + e.getMessage());
            e.printStackTrace();
        }
        
        return housekeepers;
    }
    
    /**
     * Lấy housekeeper theo ID
     */
    public Housekeeper getHousekeeperById(int userId) {
        String sql = """
            SELECT 
                u.user_id, u.email, u.full_name, u.gender, u.phone_number, 
                u.address, u.hometown, u.is_active, u.birth_year, u.created_at,
                hp.experience_years, hp.hourly_rate, hp.daily_rate, hp.monthly_rate,
                hp.average_rating, hp.booking_count, hp.work_areas, hp.skills, hp.profile_image_url
            FROM users u
            INNER JOIN roles r ON u.role_id = r.role_id
            INNER JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
            WHERE r.name = 'housekeeper' 
                AND u.user_id = ?
                AND u.is_active = 1
            """;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("✅ Found housekeeper with ID: " + userId);
                    return mapResultSetToHousekeeper(rs);
                } else {
                    System.out.println("❌ No housekeeper found with ID: " + userId);
                }
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error getting housekeeper by ID " + userId + ": " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * Tìm kiếm housekeeper theo tiêu chí - ENHANCED với tìm kiếm theo skills chính xác hơn
     */
    public List<Housekeeper> searchHousekeepers(String searchTerm, String workArea, 
                                               BigDecimal minPrice, BigDecimal maxPrice, 
                                               String skills) {
        List<Housekeeper> housekeepers = new ArrayList<>();
        StringBuilder sql = new StringBuilder("""
            SELECT 
                u.user_id, u.email, u.full_name, u.gender, u.phone_number, 
                u.address, u.hometown, u.is_active, u.birth_year, u.created_at,
                hp.experience_years, hp.hourly_rate, hp.daily_rate, hp.monthly_rate,
                hp.average_rating, hp.booking_count, hp.work_areas, hp.skills, hp.profile_image_url
            FROM users u
            INNER JOIN roles r ON u.role_id = r.role_id
            INNER JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
            WHERE r.name = 'housekeeper' 
                AND u.is_active = 1
            """);
        
        List<Object> parameters = new ArrayList<>();
        
        // Thêm điều kiện tìm kiếm theo tên hoặc khu vực
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            sql.append(" AND (u.full_name LIKE ? OR hp.work_areas LIKE ? OR hp.skills LIKE ?)");
            String searchPattern = "%" + searchTerm.trim() + "%";
            parameters.add(searchPattern);
            parameters.add(searchPattern);
            parameters.add(searchPattern);
        }
        
        // Tìm kiếm theo khu vực làm việc
        if (workArea != null && !workArea.trim().isEmpty()) {
            sql.append(" AND hp.work_areas LIKE ?");
            parameters.add("%" + workArea.trim() + "%");
        }
        
        // Lọc theo giá tiền
        if (minPrice != null) {
            sql.append(" AND hp.hourly_rate >= ?");
            parameters.add(minPrice);
        }
        
        if (maxPrice != null) {
            sql.append(" AND hp.hourly_rate <= ?");
            parameters.add(maxPrice);
        }
        
        // Tìm kiếm theo skills - IMPROVED: Tách skills và tìm chính xác hơn
        if (skills != null && !skills.trim().isEmpty()) {
            String[] skillArray = skills.split(",");
            sql.append(" AND (");
            
            for (int i = 0; i < skillArray.length; i++) {
                if (i > 0) {
                    sql.append(" OR ");
                }
                sql.append("hp.skills LIKE ?");
                parameters.add("%" + skillArray[i].trim() + "%");
            }
            sql.append(")");
        }
        
        sql.append(" ORDER BY hp.average_rating DESC, hp.booking_count DESC");
        
        System.out.println("🔍 Search query: " + sql.toString());
        System.out.println("🔍 Parameters: " + parameters.toString());
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
            
            // Set parameters
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Housekeeper housekeeper = mapResultSetToHousekeeper(rs);
                    housekeepers.add(housekeeper);
                }
            }
            
            System.out.println("🔍 Search returned " + housekeepers.size() + " housekeepers");
            
        } catch (Exception e) {
            System.err.println("❌ Error searching housekeepers: " + e.getMessage());
            e.printStackTrace();
        }
        
        return housekeepers;
    }
    
    /**
     * NEW: Tìm kiếm housekeeper theo dịch vụ cụ thể
     */
    public List<Housekeeper> getHousekeepersByService(String serviceName) {
        if (serviceName == null || serviceName.trim().isEmpty()) {
            return getAllActiveHousekeepers();
        }
        
        System.out.println("🔍 Searching housekeepers by service: " + serviceName);
        return searchHousekeepers(null, null, null, null, serviceName.trim());
    }
    
    /**
     * NEW: Đếm số lượng housekeeper theo từng dịch vụ
     */
    public int countHousekeepersByService(String serviceName) {
        if (serviceName == null || serviceName.trim().isEmpty()) {
            return 0;
        }
        
        String sql = """
            SELECT COUNT(*) as total
            FROM users u
            INNER JOIN roles r ON u.role_id = r.role_id
            INNER JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
            WHERE r.name = 'housekeeper' 
                AND u.is_active = 1
                AND hp.skills LIKE ?
            """;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, "%" + serviceName.trim() + "%");
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt("total");
                    System.out.println("📊 Service '" + serviceName + "' has " + count + " housekeepers");
                    return count;
                }
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error counting housekeepers by service: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    /**
     * NEW: Lấy danh sách các dịch vụ và số lượng housekeeper tương ứng
     */
    public List<String[]> getServiceStatistics() {
        List<String[]> statistics = new ArrayList<>();
        
        String[] services = {
            "Giup viec theo gio", "Giup viec theo ngay", "Giup viec theo thang",
            "Vat nha", "Nau an", "Ve sinh may lanh", "Ve sinh may giat",
            "Cham soc nguoi gia", "Cham soc tre em", "Cham soc nguoi benh", "Don dep nha"
        };
        
        for (String service : services) {
            int count = countHousekeepersByService(service);
            statistics.add(new String[]{service, String.valueOf(count)});
        }
        
        return statistics;
    }
    
    /**
     * Lấy housekeeper theo khu vực
     */
    public List<Housekeeper> getHousekeepersByArea(String area) {
        if (area == null || area.trim().isEmpty()) {
            return getAllActiveHousekeepers();
        }
        return searchHousekeepers(null, area, null, null, null);
    }
    
    /**
     * Lấy top housekeeper có rating cao nhất
     */
    public List<Housekeeper> getTopRatedHousekeepers(int limit) {
        List<Housekeeper> housekeepers = new ArrayList<>();
        
        String sql = """
            SELECT TOP (?) 
                u.user_id, u.email, u.full_name, u.gender, u.phone_number, 
                u.address, u.hometown, u.is_active, u.birth_year, u.created_at,
                hp.experience_years, hp.hourly_rate, hp.daily_rate, hp.monthly_rate,
                hp.average_rating, hp.booking_count, hp.work_areas, hp.skills, hp.profile_image_url
            FROM users u
            INNER JOIN roles r ON u.role_id = r.role_id
            INNER JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
            WHERE r.name = 'housekeeper' 
                AND u.is_active = 1
                AND hp.average_rating >= 4.0
            ORDER BY hp.average_rating DESC, hp.booking_count DESC
            """;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, limit);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Housekeeper housekeeper = mapResultSetToHousekeeper(rs);
                    housekeepers.add(housekeeper);
                }
            }
            
            System.out.println("⭐ Retrieved " + housekeepers.size() + " top rated housekeepers");
            
        } catch (Exception e) {
            System.err.println("❌ Error getting top rated housekeepers: " + e.getMessage());
            e.printStackTrace();
        }
        
        return housekeepers;
    }
    
    /**
     * Đếm tổng số housekeeper active
     */
    public int getTotalActiveHousekeepers() {
        String sql = """
            SELECT COUNT(*) as total
            FROM users u
            INNER JOIN roles r ON u.role_id = r.role_id
            INNER JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
            WHERE r.name = 'housekeeper' 
                AND u.is_active = 1
            """;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            if (rs.next()) {
                int total = rs.getInt("total");
                System.out.println("📊 Total active housekeepers in DB: " + total);
                return total;
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error counting housekeepers: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    /**
     * Helper method để map ResultSet thành Housekeeper object - ENHANCED
     */
    private Housekeeper mapResultSetToHousekeeper(ResultSet rs) throws SQLException {
        Housekeeper housekeeper = new Housekeeper();
        
        try {
            // Basic user info
            housekeeper.setUserId(rs.getInt("user_id"));
            housekeeper.setEmail(rs.getString("email"));
            housekeeper.setFullName(rs.getString("full_name"));
            housekeeper.setGender(rs.getString("gender"));
            housekeeper.setPhoneNumber(rs.getString("phone_number"));
            housekeeper.setAddress(rs.getString("address"));
            housekeeper.setHometown(rs.getString("hometown"));
            housekeeper.setActive(rs.getBoolean("is_active"));
            housekeeper.setBirthYear(rs.getInt("birth_year"));
            
            // Handle created_at with null check
            Timestamp createdAtTimestamp = rs.getTimestamp("created_at");
            if (createdAtTimestamp != null) {
                housekeeper.setCreatedAt(createdAtTimestamp.toLocalDateTime());
            } else {
                housekeeper.setCreatedAt(LocalDateTime.now());
            }
            
            // Profile info with defaults for null values
            housekeeper.setExperienceYears(rs.getInt("experience_years"));
            
            // Handle BigDecimal fields with null checks
            BigDecimal hourlyRate = rs.getBigDecimal("hourly_rate");
            housekeeper.setHourlyRate(hourlyRate != null ? hourlyRate : new BigDecimal("150000"));
            
            BigDecimal dailyRate = rs.getBigDecimal("daily_rate");
            housekeeper.setDailyRate(dailyRate != null ? dailyRate : new BigDecimal("500000"));
            
            BigDecimal monthlyRate = rs.getBigDecimal("monthly_rate");
            housekeeper.setMonthlyRate(monthlyRate != null ? monthlyRate : new BigDecimal("6000000"));
            
            BigDecimal avgRating = rs.getBigDecimal("average_rating");
            housekeeper.setAverageRating(avgRating != null ? avgRating : new BigDecimal("4.0"));
            
            housekeeper.setBookingCount(rs.getInt("booking_count"));
            
            // Handle string fields with defaults
            String workAreas = rs.getString("work_areas");
            housekeeper.setWorkAreas(workAreas != null ? workAreas : "Hai Chau");
            
            String skills = rs.getString("skills");
            housekeeper.setSkills(skills != null ? skills : "Giup viec theo gio,Don dep nha,Nau an,Ve sinh may giat");
            
            String profileImageUrl = rs.getString("profile_image_url");
            housekeeper.setProfileImageUrl(profileImageUrl != null ? profileImageUrl : "view/assets/profile/default.jpg");
            
            // Set computed properties
            housekeeper.setHasDiscount(housekeeper.getAverageRating().compareTo(new BigDecimal("4.5")) >= 0);
            housekeeper.setTimeSlot("morning"); // Default time slot
            
            return housekeeper;
            
        } catch (Exception e) {
            System.err.println("❌ Error mapping ResultSet to Housekeeper: " + e.getMessage());
            System.err.println("   User ID: " + rs.getInt("user_id"));
            System.err.println("   Full Name: " + rs.getString("full_name"));
            e.printStackTrace();
            throw new SQLException("Failed to map housekeeper data", e);
        }
    }
    
    /**
     * Test connection
     */
    public boolean testConnection() {
        try (Connection conn = DBContext.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Database connection successful!");
                
                // Test query users table
                try (PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) FROM users")) {
                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            System.out.println("📊 Total users in database: " + rs.getInt(1));
                        }
                    }
                }
                
                // Test query housekeeper_profiles table
                try (PreparedStatement pstmt2 = conn.prepareStatement("SELECT COUNT(*) FROM housekeeper_profiles")) {
                    try (ResultSet rs2 = pstmt2.executeQuery()) {
                        if (rs2.next()) {
                            System.out.println("📊 Total housekeeper profiles: " + rs2.getInt(1));
                        }
                    }
                }
                
                return true;
            }
            return false;
        } catch (Exception e) {
            System.err.println("❌ Database connection test failed: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Method để kích hoạt tất cả housekeepers nếu cần
     */
    public boolean activateAllHousekeepers() {
        String sql = """
            UPDATE users 
            SET is_active = 1 
            WHERE user_id IN (
                SELECT u.user_id 
                FROM users u 
                INNER JOIN roles r ON u.role_id = r.role_id 
                WHERE r.name = 'housekeeper'
            )
            """;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            int updated = pstmt.executeUpdate();
            System.out.println("✅ Activated " + updated + " housekeepers");
            return updated > 0;
            
        } catch (Exception e) {
            System.err.println("❌ Error activating housekeepers: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * NEW: Method để debug và hiển thị thống kê dịch vụ
     */
    public void debugServiceCoverage() {
        System.out.println("🔍 DEBUG: Service Coverage Analysis");
        System.out.println("=====================================");
        
        List<String[]> stats = getServiceStatistics();
        
        for (String[] stat : stats) {
            String serviceName = stat[0];
            int count = Integer.parseInt(stat[1]);
            String status = count >= 3 ? "✅ OK" : "❌ NEED MORE";
            
            System.out.printf("%-25s: %2d housekeepers %s\n", serviceName, count, status);
        }
        
        System.out.println("=====================================");
        System.out.println("Total services: " + stats.size());
        
        long adequateServices = stats.stream()
            .mapToInt(stat -> Integer.parseInt(stat[1]))
            .filter(count -> count >= 3)
            .count();
            
        System.out.println("Services with 3+ housekeepers: " + adequateServices + "/" + stats.size());
    }
}