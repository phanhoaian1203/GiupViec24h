package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {


    private static final String URL = "jdbc:sqlserver://DESKTOP-UG4U71C\\SQLEXPRESS;databaseName=giupviec24h_ver13;encrypt=false;trustServerCertificate=true";

    private static final String USER = "sa";
    private static final String PASSWORD = "161104";

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("SQL Server JDBC Driver not found: " + e.getMessage(), e);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to connect to database: " + e.getMessage(), e);
        }
    }
}