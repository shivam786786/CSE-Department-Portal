
package modulecatalog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import modulecatalog.dbutil.DBConnection;
import modulecatalog.dto.CSEFileDTO;
import modulecatalog.dto.UserDTO;



public class ValidateDAO {
    
    private static PreparedStatement ps1,ps2,ps3,ps4,ps5,ps6,ps7, ps8;
    


    static
    {
    try{
        

ps1=DBConnection.getConnection().prepareStatement("select * from users where username=? and password=? and usertype=? and status = 'y'");
ps2=DBConnection.getConnection().prepareStatement("select * from users where username = ?");
ps3=DBConnection.getConnection().prepareStatement("update users set password = ? where username = ?");
ps4=DBConnection.getConnection().prepareStatement("insert into users(username,password,usertype,status) values(?,?,?,?)");
ps5=DBConnection.getConnection().prepareStatement("select scheme,path from csefile");
ps6=DBConnection.getConnection().prepareStatement("select syllabus,path from csefile");
ps7=DBConnection.getConnection().prepareStatement("update users set time_stamp = ? where username = ?");
ps8=DBConnection.getConnection().prepareStatement("select time_stamp from users where username = ?");
        


    }
    catch(Exception e)
    {
        System.out.println("error"+e);
        e.printStackTrace();
    }}
    public static String getLastLoginTime(String username) throws SQLException {
        ps8.setString(1, username.toLowerCase());
        ResultSet rs = ps8.executeQuery();
        if(rs.next())
            return rs.getString("time_stamp");
        return null;
    }
    public static boolean setLogoutTime(String username) throws SQLException {
       
         LocalDateTime myDateObj = LocalDateTime.now(); 
         DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MMM-yyyy HH:mm:ss"); 
        String lastLogin = myDateObj.format(myFormatObj); 
    ps7.setString(1, lastLogin);
     ps7.setString(2, username.toLowerCase());
     
    System.out.println("lastLogin date: " + lastLogin); 
    int i = ps7.executeUpdate();
    return i!=0;
    
    }
      public static boolean registerUser(UserDTO user) throws SQLException {
          System.out.println(""+user.getUsername()+""+user.getPassword()+""+user.getUsertype()+""+user.getStatus());
        ps4.setString(1, user.getUsername().toLowerCase());
        ps4.setString(2, user.getPassword());
        ps4.setString(3, user.getUsertype());
        ps4.setString(4, user.getStatus().toLowerCase());
        int i = ps4.executeUpdate();
        return i != 0;
    }
       public static boolean changePassword (String username, String pass) throws SQLException {
        ps3.setString(1, pass);
        ps3.setString(2, username.toLowerCase());
        int i = ps3.executeUpdate();
        return i != 0;
    }
        public static boolean findUser(String username) throws SQLException {
        ps2.setString(1, username.toLowerCase());
        ResultSet rs = ps2.executeQuery();
        return rs.next();
    }

    
    public static boolean validateUsers(UserDTO user)throws SQLException
 {
     System.out.println("inside dao " +user.getUsername().toLowerCase() + "  " + user.getUsertype().toLowerCase() + "  " + user.getPassword());
     ps1.setString(1,user.getUsername().toLowerCase());
     ps1.setString(2,user.getPassword());
     ps1.setString(3, user.getUsertype().toLowerCase());
      ResultSet rs=ps1.executeQuery();
      return rs.next();
 }
    
    public static ArrayList<CSEFileDTO> getScheme()throws SQLException
    {
  ArrayList<CSEFileDTO> f=new ArrayList<>();
  ResultSet rs=ps5.executeQuery();
  while(rs.next())
  {
  CSEFileDTO file=new CSEFileDTO();
  file.setFile(rs.getString("scheme"));
  file.setPath(rs.getString("path"));
  f.add(file);
  }
  return f;
    }
      public static ArrayList<CSEFileDTO> getSyllabus()throws SQLException
    {
  ArrayList<CSEFileDTO> f=new ArrayList<>();
  ResultSet rs=ps6.executeQuery();
  while(rs.next())
  {
  CSEFileDTO file=new CSEFileDTO();
  file.setFile(rs.getString("syllabus"));
  file.setPath(rs.getString("path"));
  f.add(file);
  }
  return f;
    }
}
 
 
