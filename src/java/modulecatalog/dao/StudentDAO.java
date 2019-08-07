/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import modulecatalog.dbutil.DBConnection;
import modulecatalog.dto.FileDTO;
import modulecatalog.dto.MarksUpdate;
import modulecatalog.dto.QueryDTO;
import modulecatalog.dto.StudentDTO;
import modulecatalog.dto.SubjectsDTO;
import modulecatalog.dto.UserDTO;

/**
 *
 * @author HP
 */
public class StudentDAO {
      private static PreparedStatement ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9,ps10,ps11,ps27,ps12,ps13,ps14,ps15,ps16;


    static
    {
    try{
        

ps1=DBConnection.getConnection().prepareStatement("select * from student where roll_no=?");
ps2=DBConnection.getConnection().prepareStatement("update student set mob=?,address=?,photo=?,email=?,sname=?,sem=? where roll_no=?");
ps3=DBConnection.getConnection().prepareStatement("select photo from student where roll_no=?");
ps4=DBConnection.getConnection().prepareStatement("update users set password=? where username=? and usertype=?");
ps5=DBConnection.getConnection().prepareStatement("select * from subjects where sem=?");
ps6=DBConnection.getConnection().prepareStatement("select * from files where subject=?");
ps7=DBConnection.getConnection().prepareStatement("select password from users where username=?");
ps8=DBConnection.getConnection().prepareStatement("select photo from student where username=?");
ps9=DBConnection.getConnection().prepareStatement("select * from files where file_id=?");
ps10=DBConnection.getConnection().prepareStatement("select * from marks where roll_no=? and sem=?");
ps11=DBConnection.getConnection().prepareStatement("select roll_no from student where email=?");
ps12=DBConnection.getConnection().prepareStatement("select * from student where email=?");
ps27=DBConnection.getConnection().prepareStatement("select sname from student where email=?");

ps13=DBConnection.getConnection().prepareStatement("insert into query(question,asked_by,topic,subject,id,time_stamp) values(?,?,?,?,?,?)");
ps14=DBConnection.getConnection().prepareStatement("select topic,answer,time_stamp,id from query where asked_by=? and subject=?");
ps15=DBConnection.getConnection().prepareStatement("select question,answer,answered_by,topic from query where id = ?");
ps16=DBConnection.getConnection().prepareStatement("select sname from student where roll_no = ?");
    }
    catch(Exception e)
    {
        System.out.println("error"+e);
        e.printStackTrace();
    }}
    private static String getCurrentTime() {
        LocalDateTime myDateObj = LocalDateTime.now(); 
         DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MMM-yyyy HH:mm:ss"); 
        String current_time = myDateObj.format(myFormatObj);
        System.out.println("Current time in student Dao: " + current_time);
        return current_time;
    }
    public static String getStudentNameByUsername(String username) throws SQLException {
        ps16.setString(1, username);
        ResultSet rs = ps16.executeQuery();
        if(rs.next())
            return rs.getString("SNAME");
        return null;
    }
    public static QueryDTO getQueryDetails(String id) throws SQLException {
        QueryDTO query = new QueryDTO();
        ps15.setString(1, id);
       
        ResultSet rs = ps15.executeQuery();
        if(rs.next()) {
            query.setTopic(rs.getString("topic"));
            query.setAnswer(rs.getString("answer"));
            query.setQuestion(rs.getString("question"));
            query.setAnsweredby(rs.getString("answered_by"));
        }
        return query;
    }
    public static ArrayList<QueryDTO> getQueryTopic(String name,String subject)throws SQLException
    {
        ArrayList<QueryDTO> query=new ArrayList<>();
    ps14.setString(1,name);
    ps14.setString(2, subject);
    ResultSet rs=ps14.executeQuery();
    while(rs.next())
    {
    QueryDTO q=new QueryDTO();
    q.setTopic(rs.getString("topic"));
    q.setAnswer(rs.getString("answer"));
    q.setTimestamp(rs.getString("time_stamp"));
    q.setId(rs.getString("id"));
    query.add(q);
    }
    return query;
    }
      public static boolean askQuery(String topic, String name, String question, String sub) throws SQLException {
        ps13.setString(1, question);
        ps13.setString(2, name);
        ps13.setString(3, topic);
        ps13.setString(4, sub);
        String id = FileDAO.getNewId();
        ps13.setString(5, id);
        ps13.setString(6, getCurrentTime());
        int i = ps13.executeUpdate();
        return i != 0;
   }
     public static StudentDTO getStudentDetails(String email) throws SQLException {
         System.out.println("inside student dao"+email);
        StudentDTO Student = null;
        ps12.setString(1, email);
        ResultSet rs = ps12.executeQuery();
        if(rs.next()) {
            Student = new StudentDTO();
            Student.setRollno(rs.getString("roll_no").toUpperCase());
            System.out.println("rollno is;"+rs.getString("roll_no"));
            Student.setSname(rs.getString("sname").toUpperCase());
            Student.setSem(rs.getInt("sem"));
            Student.setMob(rs.getString("mob"));
            Student.setEmail(rs.getString("email"));
            Student.setAddress(rs.getString("address").toUpperCase());
            Student.setPhoto(rs.getString("photo"));
        }
        return Student;
    }
    public static StudentDTO findStudent(String username)throws SQLException
 {
     System.out.println("inside dao");
     ps1.setString(1,username);
     StudentDTO faculty=new StudentDTO();
  
      ResultSet rs=ps1.executeQuery();
   if(rs.next())
    {
        System.out.println(""+rs.getString("photo"));
        faculty.setSname(rs.getString("sname").toUpperCase());
        faculty.setSem(rs.getInt("sem"));
       faculty.setRollno(rs.getString("roll_no"));
        faculty.setMob(rs.getString("mob"));
        faculty.setEmail(rs.getString("email"));
        faculty.setAddress(rs.getString("address").toUpperCase());
        faculty.setPhoto(rs.getString("photo"));
        System.out.println("faculty:"+faculty.getPhoto());
               
      }
    return faculty;
}
    public static boolean updateStudent(StudentDTO s)throws SQLException
    {
       
        System.out.println("reached update faculty dao");
        ps2.setString(1,s.getMob());
            ps2.setString(2,s.getAddress());

            ps2.setString(3,s.getPhoto());
    ps2.setString(4,s.getEmail());
      ps2.setString(5,s.getSname());
        ps2.setInt(6,s.getSem());
        ps2.setString(7,s.getRollno());
        System.out.println(s.getMob());
                System.out.println(s.getAddress());
        System.out.println(s.getPhoto());
        System.out.println(s.getEmail());
        System.out.println(s.getSem());
        System.out.println(s.getSname());
        System.out.println(s.getRollno());
  int ans=ps2.executeUpdate();
        System.out.println(ans);
  if(ans!=0)
      return true;
  else
      return false;

    }
    
    public static String getPhoto(String username)throws SQLException
    {
        ps3.setString(1, username);
        ResultSet rs=ps3.executeQuery();
        rs.next();
        String photo=rs.getString("photo");
        return photo;
      }
    public static boolean changepswd(UserDTO user)throws SQLException
    {
        System.out.println("inside changepswd");
     ps4.setString(1,user.getPassword());
     ps4.setString(2,user.getUsername().toLowerCase());
     ps4.setString(3,user.getUsertype().toLowerCase());
        System.out.println(""+user.getPassword()+""+user.getUsername()+""+user.getUsertype());
      
        int ans=ps4.executeUpdate();
        System.out.println("ans:"+ans);
  if(ans!=0)
      return true;
  else
      return false;

        
    }
 
  public static SubjectsDTO getSubjects(int sem)throws SQLException
 {
     System.out.println("inside dao");
     ps5.setInt(1,sem);
     System.out.println("sem"+sem);
     SubjectsDTO subject=new SubjectsDTO();
  
      ResultSet rs=ps5.executeQuery();
   if(rs.next())
    {
        System.out.println(""+rs.getString("subject1"));
        subject.setSubject1(rs.getString("subject1"));
        subject.setSubject2(rs.getString("subject2"));
        subject.setSubject3(rs.getString("subject3"));
        subject.setSubject4(rs.getString("subject4"));
        subject.setSubject5(rs.getString("subject5"));

       
               
      }
    return subject;
   }
  public static ArrayList<FileDTO> getSubjectFiles(String subject)throws SQLException
  {
  ps6.setString(1, subject);
   ArrayList<FileDTO> file=new ArrayList<FileDTO>();
  ResultSet rs=ps6.executeQuery();
  while(rs.next())
  {
  FileDTO files=new FileDTO();
  files.setFile_id(rs.getString("file_id"));
  files.setFilename(rs.getString("file_name"));
  files.setDescription(rs.getString("description"));
  files.setTime_Stamp(rs.getDate("time_stamp"));
  files.setFilepath(rs.getString("file_path"));
  file.add(files);
  }
  return file;
  }
  public static String getPassword(String username)throws SQLException
  {
  ps7.setString(1, username);
  ResultSet rs=ps7.executeQuery();
  rs.next();
  String password=rs.getString("password");
  return password;
  }
   public static FileDTO getFiles(String id)throws SQLException
  {
  ps9.setString(1, id);
  ResultSet rs=ps9.executeQuery();
    FileDTO files=new FileDTO();

  if(rs.next())
  {
  
  files.setFilename(rs.getString("file_name"));
  files.setDescription(rs.getString("description"));
  files.setTime_Stamp(rs.getDate("time_stamp"));
  files.setFilepath(rs.getString("file_path"));
  
  }
  return files;
  }
  public static ArrayList<MarksUpdate> getMarks(int sem,String rollno)throws SQLException
  {
      System.out.println("reached in dao");
      System.out.println(""+sem);
      System.out.println(""+rollno);
  ps10.setString(1, rollno);
  ps10.setInt(2, sem);
     ArrayList<MarksUpdate> mark=new ArrayList<MarksUpdate>();

  ResultSet rs=ps10.executeQuery();
  while(rs.next())
  {
  MarksUpdate m=new MarksUpdate();
  m.setSubject(rs.getString("subject"));
  m.setMidsem1(rs.getInt("midsem1"));
    m.setMidsem2(rs.getInt("midsem2"));
  m.setMidsem3(rs.getInt("midsem3"));
  m.setUpdate1(rs.getString("update1"));
  m.setUpdate2(rs.getString("update2"));
  m.setUpdate3(rs.getString("update3"));
  mark.add(m);
  }
      System.out.println("in dao size of list"+mark.size());
  return mark;
  }
  public static String getEnrollmentNo(String email)throws SQLException
  {
      String no=null;
  ps11.setString(1, email);
  ResultSet rs=ps11.executeQuery();
  if(rs.next())
  {
  no=rs.getString("roll_no");
  }
  return no;
   
  
  
  
  }
  public static String getStudentName(String email)throws SQLException
{
    String name=null;
ps27.setString(1, email);
ResultSet rs=ps27.executeQuery();
if(rs.next())
{
 name=rs.getString("sname");
}
return name;    
}
 
}
