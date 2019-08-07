package modulecatalog.dbutil;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shivam
 */
public class DBConnection {
    private static Connection conn;
    private static final String DRIVERLOAD = "oracle.jdbc.OracleDriver".trim();
    private static final String URL = "jdbc:oracle:thin:@//DESKTOP-GFP2I2D:1521/XE".trim();
    private static final String DB = "Minor".trim();
    private static final String PASS = "project".trim();
    static {
        try {
            Class.forName(DRIVERLOAD);
            System.out.println("Driver load Successfully");
            conn = DriverManager.getConnection(URL,DB,PASS);
            System.out.println("Connection done!");
        } catch(ClassNotFoundException | SQLException ex) {
            System.out.println("Error in opening connection  : " + ex);
        }
    }
    public static Connection getConnection(){
        return conn;
    }
    public static void closeConnection() {
        try {
            conn.close();
        } catch(SQLException ex) {
            System.out.println("Error in closing connection" +ex);
        }
    }
}
