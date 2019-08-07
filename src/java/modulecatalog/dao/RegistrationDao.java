/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modulecatalog.dbutil.DBConnection;

/**
 *
 * @author Shivam
 */
public class RegistrationDao {
    private static PreparedStatement ps1, ps2, ps3, ps4, ps5, ps6;
     static
    {
    try{
        ps1=DBConnection.getConnection().prepareStatement("select * from users where username = ?");
        ps2=DBConnection.getConnection().prepareStatement("select * from faculty where email = ?");
        ps3=DBConnection.getConnection().prepareStatement("select * from student where roll_no = ?");
        ps4=DBConnection.getConnection().prepareStatement("select * from admin where email = ?");
        ps5=DBConnection.getConnection().prepareStatement("select email from student where roll_no=?");
    }
    catch(Exception e)
    {
        System.out.println("error"+e);
        e.printStackTrace();
    }
   }
     public static boolean userAllReadyPresent(String username) throws SQLException {
         System.out.println("name is"+username);
         ps1.setString(1, username);
         ResultSet rs = ps1.executeQuery();
         return rs.next();
     }
     public static boolean chechkAvailbility(String username) throws SQLException {
         //boolean status = false;
//         DBConnection.getConnection().setAutoCommit(false);
         ps2.setString(1, username.toLowerCase());
         ps3.setString(1, username.toLowerCase());
         ps4.setString(1, username.toLowerCase());
         
         ResultSet rs1 = ps2.executeQuery();
         ResultSet rs2 = ps3.executeQuery();
         ResultSet rs3 = ps4.executeQuery();
         return rs1.next() || rs2.next() || rs3.next();
//             status = true;
//         return status;
     }
     public static String getEmail(String username) throws SQLException {
         String email = null;
         ps5.setString(1,username.toLowerCase());
         ResultSet rs = ps5.executeQuery();
         if(rs.next()) {
             email = rs.getString("email");
         }
         return email;
     }
     
}
