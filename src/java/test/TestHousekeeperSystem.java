package test;

import dao.HousekeeperDAO;
import model.Housekeeper;
import utils.DBContext;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class TestHousekeeperSystem {
    
    public static void main(String[] args) {
        System.out.println("🔧 TESTING HOUSEKEEPER SYSTEM");
        System.out.println("=====================================\n");
        
        // Test 1: Database Connection
        testDatabaseConnection();
        
        // Test 2: Check housekeepers status
        checkHousekeepersStatus();
        
        // Test 3: Test DAO
        testDAO();
        
        // Test 4: Show recommendations
        showRecommendations();
        
        System.out.println("\n=====================================");
        System.out.println("🎯 TESTING COMPLETED");
        System.out.println("=====================================");
    }
    
    private static void testDatabaseConnection() {
        System.out.println("1️⃣ TESTING DATABASE CONNECTION:");
        try (Connection conn = DBContext.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Database connected successfully!");
                System.out.println("   📊 Database: " + conn.getMetaData().getDatabaseProductName());
                System.out.println("   🔗 URL: " + conn.getMetaData().getURL());
            } else {
                System.out.println("❌ Database connection failed!");
            }
        } catch (Exception e) {
            System.out.println("❌ Connection error: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println();
    }
    
    private static void checkHousekeepersStatus() {
        System.out.println("2️⃣ CHECKING HOUSEKEEPERS STATUS:");
        System.out.println("─".repeat(60));
        
        try (Connection conn = DBContext.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Count all housekeepers
            ResultSet rs = stmt.executeQuery("""
                SELECT 
                    COUNT(*) as total,
                    SUM(CASE WHEN u.is_active = 1 THEN 1 ELSE 0 END) as active,
                    SUM(CASE WHEN u.is_active = 0 THEN 1 ELSE 0 END) as inactive
                FROM users u
                INNER JOIN roles r ON u.role_id = r.role_id
                WHERE r.name = 'housekeeper'
                """);
            
            if (rs.next()) {
                int total = rs.getInt("total");
                int active = rs.getInt("active");
                int inactive = rs.getInt("inactive");
                
                System.out.println("📈 SUMMARY:");
                System.out.println("   👥 Total housekeepers: " + total);
                System.out.println("   ✅ Active housekeepers: " + active);
                System.out.println("   ❌ Inactive housekeepers: " + inactive);
                
                if (active == 0 && total > 0) {
                    System.out.println("\n🚨 PROBLEM DETECTED:");
                    System.out.println("   ❗ All housekeepers are INACTIVE (is_active = 0)");
                    System.out.println("   ❗ This is why your website shows no data!");
                    System.out.println("   ❗ You need to run the SQL fix provided below.");
                } else if (active > 0) {
                    System.out.println("\n✅ Good! " + active + " housekeepers are active.");
                } else {
                    System.out.println("\n⚠️  No housekeepers found in database!");
                }
            }
            rs.close();
            
            // Show individual housekeeper status
            rs = stmt.executeQuery("""
                SELECT u.user_id, u.full_name, u.is_active, 
                       ISNULL(hp.hourly_rate, 0) as hourly_rate, 
                       ISNULL(hp.average_rating, 0) as average_rating,
                       hp.work_areas, hp.skills
                FROM users u
                INNER JOIN roles r ON u.role_id = r.role_id
                LEFT JOIN housekeeper_profiles hp ON u.user_id = hp.housekeeper_id
                WHERE r.name = 'housekeeper'
                ORDER BY u.user_id
                """);
            
            System.out.println("\n📋 INDIVIDUAL HOUSEKEEPER STATUS:");
            System.out.println("─".repeat(80));
            int count = 0;
            while (rs.next()) {
                count++;
                int id = rs.getInt("user_id");
                String name = rs.getString("full_name");
                boolean active = rs.getBoolean("is_active");
                double rate = rs.getDouble("hourly_rate");
                double rating = rs.getDouble("average_rating");
                String areas = rs.getString("work_areas");
                String skills = rs.getString("skills");
                
                String status = active ? "🟢 ACTIVE" : "🔴 INACTIVE";
                String profileStatus = (rate > 0) ? "📋 HAS PROFILE" : "❌ NO PROFILE";
                
                System.out.printf("   %d. ID %d: %s [%s] [%s]\n", count, id, name, status, profileStatus);
                if (rate > 0) {
                    System.out.printf("      💰 Rate: %.0f đ/h | ⭐ Rating: %.1f | 📍 Area: %s\n", 
                        rate, rating, areas != null ? areas : "N/A");
                }
                if (skills != null && !skills.trim().isEmpty()) {
                    System.out.printf("      🛠️  Skills: %s\n", skills);
                }
            }
            rs.close();
            
        } catch (Exception e) {
            System.out.println("❌ Error checking status: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println();
    }
    
    private static void testDAO() {
        System.out.println("3️⃣ TESTING HOUSEKEEPER DAO:");
        System.out.println("─".repeat(60));
        
        try {
            HousekeeperDAO dao = new HousekeeperDAO();
            
            // Test connection
            if (!dao.testConnection()) {
                System.out.println("❌ DAO connection test failed!");
                return;
            }
            
            // Test get all active
            List<Housekeeper> housekeepers = dao.getAllActiveHousekeepers();
            
            System.out.println("📊 DAO RESULTS:");
            System.out.println("   📋 Found " + housekeepers.size() + " active housekeepers via DAO");
            
            if (housekeepers.isEmpty()) {
                System.out.println("   🚨 NO DATA RETURNED FROM DAO!");
                System.out.println("   📝 Possible reasons:");
                System.out.println("      - All housekeepers have is_active = 0");
                System.out.println("      - Missing housekeeper_profiles records");
                System.out.println("      - SQL query issues");
            } else {
                System.out.println("   ✅ DAO working correctly! Found data:");
                for (int i = 0; i < Math.min(housekeepers.size(), 5); i++) {
                    Housekeeper h = housekeepers.get(i);
                    System.out.printf("   %d. %s (%s) - %.0f đ/h - Rating: %.1f\n", 
                        i + 1, h.getFullName(), h.getWorkAreas(), 
                        h.getHourlyRate(), h.getAverageRating());
                }
                if (housekeepers.size() > 5) {
                    System.out.println("   ... and " + (housekeepers.size() - 5) + " more");
                }
            }
            
            // Test search functionality
            System.out.println("\n🔍 Testing search functionality:");
            List<Housekeeper> searchResults = dao.searchHousekeepers("", "Hai Chau", null, null, null);
            System.out.println("   📍 Search by area 'Hai Chau': " + searchResults.size() + " results");
            
            // Test get by ID
            if (!housekeepers.isEmpty()) {
                int testId = housekeepers.get(0).getUserId();
                Housekeeper byId = dao.getHousekeeperById(testId);
                System.out.println("   🔍 Get by ID " + testId + ": " + (byId != null ? "✅ Found" : "❌ Not found"));
            }
            
        } catch (Exception e) {
            System.out.println("❌ DAO test failed: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println();
    }
    
    private static void showRecommendations() {
        System.out.println("4️⃣ RECOMMENDATIONS TO FIX:");
        System.out.println("─".repeat(60));
        
        System.out.println("🛠️  Step 1: Run this SQL in SQL Server Management Studio:");
        System.out.println();
        System.out.println("-- Fix: Activate all housekeepers");
        System.out.println("UPDATE users SET is_active = 1");
        System.out.println("WHERE user_id IN (6, 7, 8, 11, 12, 13, 14, 15);");
        System.out.println();
        System.out.println("-- Verify the fix");
        System.out.println("SELECT u.user_id, u.full_name, u.is_active");
        System.out.println("FROM users u");
        System.out.println("INNER JOIN roles r ON u.role_id = r.role_id");
        System.out.println("WHERE r.name = 'housekeeper';");
        System.out.println();
        
        System.out.println("🚀 Step 2: Restart your Tomcat server");
        System.out.println();
        
        System.out.println("🌐 Step 3: Test the website:");
        System.out.println("   - Visit: http://localhost:8080/GiupViec24h/hire");
        System.out.println("   - You should see the housekeepers list");
        System.out.println();
        
        System.out.println("🔍 Step 4: Check console output:");
        System.out.println("   - Look for DAO success messages");
        System.out.println("   - Verify data loading logs");
        System.out.println();
        
        System.out.println("💡 Additional tips:");
        System.out.println("   - Make sure JDBC driver is in lib folder");
        System.out.println("   - Check database name spelling: 'giupviec24h_ver8'");
        System.out.println("   - Verify SQL Server is running");
        System.out.println("   - Check file paths for profile images");
    }
}