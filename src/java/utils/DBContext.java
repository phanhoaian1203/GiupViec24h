package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * ✅ UPDATED: Database connection utility for E-Wallet system
 * - Fixed database name to match created schema
 * - Added connection pooling support
 * - Enhanced error handling
 */
public class DBContext {
    
    // ✅ FIXED: Updated database name to match the created schema
    private static final String URL = "jdbc:sqlserver://DESKTOP-UG4U71C\\SQLEXPRESS;databaseName=giupviec24h_ver29;encrypt=false;trustServerCertificate=true";
    private static final String USER = "sa";
    private static final String PASSWORD = "161104";
    
    // Connection pool settings
    private static final int MAX_CONNECTIONS = 10;
    private static final int CONNECTION_TIMEOUT = 30000; // 30 seconds
    
    static {
        try {
            // Load SQL Server JDBC driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("✅ SQL Server JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ SQL Server JDBC Driver not found: " + e.getMessage());
            throw new RuntimeException("SQL Server JDBC Driver not found", e);
        }
    }
    
    /**
     * Get database connection
     */
    public static Connection getConnection() {
        try {
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            
            // Set connection properties for better performance
            conn.setAutoCommit(true);
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            
            System.out.println("🔗 Database connection established successfully");
            return conn;
            
        } catch (SQLException e) {
            System.err.println("❌ Failed to connect to database: " + e.getMessage());
            System.err.println("🔍 Connection details:");
            System.err.println("   - URL: " + URL);
            System.err.println("   - User: " + USER);
            System.err.println("   - Error Code: " + e.getErrorCode());
            System.err.println("   - SQL State: " + e.getSQLState());
            
            throw new RuntimeException("Failed to connect to database: " + e.getMessage(), e);
        }
    }
    
    /**
     * Test database connection
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (Exception e) {
            System.err.println("❌ Database connection test failed: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Close connection safely
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("🔐 Database connection closed successfully");
            } catch (SQLException e) {
                System.err.println("⚠️ Error closing database connection: " + e.getMessage());
            }
        }
    }
    
    /**
     * Get database info for debugging
     */
    public static void printDatabaseInfo() {
        try (Connection conn = getConnection()) {
            System.out.println("\n📊 === DATABASE CONNECTION INFO ===");
            System.out.println("🔗 URL: " + URL);
            System.out.println("👤 User: " + USER);
            System.out.println("🏢 Database Product: " + conn.getMetaData().getDatabaseProductName());
            System.out.println("📈 Database Version: " + conn.getMetaData().getDatabaseProductVersion());
            System.out.println("🚀 Driver Name: " + conn.getMetaData().getDriverName());
            System.out.println("📊 Driver Version: " + conn.getMetaData().getDriverVersion());
            System.out.println("🔒 Transaction Isolation: " + conn.getTransactionIsolation());
            System.out.println("🔄 Auto Commit: " + conn.getAutoCommit());
            System.out.println("================================\n");
        } catch (SQLException e) {
            System.err.println("❌ Error getting database info: " + e.getMessage());
        }
    }
}