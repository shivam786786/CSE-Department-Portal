/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modulecatalog.dbutil.DBConnection;
import modulecatalog.dto.FacultyDTO;
import modulecatalog.dto.FileDTO;
import modulecatalog.dto.MarksUpdate;
import modulecatalog.dto.QueryDTO;
import modulecatalog.dto.UserDTO;

/**
 *
 * @author HP
 */
public class FacultyDAO {
private static PreparedStatement ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9,ps10,ps11,ps12,ps13,ps14,ps15,ps16,ps17,ps18,ps19,ps20,ps21,ps22,ps23,ps24,ps25,ps26,ps27,ps28,ps29,ps30,ps31,ps32;

    static
    {
    try{
        

ps1=DBConnection.getConnection().prepareStatement("select * from faculty where email=?");
ps2=DBConnection.getConnection().prepareStatement("update faculty set mob=?,address=?,photo=?,fname=? where email=? and sem=?");
ps3=DBConnection.getConnection().prepareStatement("select photo from faculty where email=?");
ps4=DBConnection.getConnection().prepareStatement("update users set password=? where username=? and usertype=?");
ps5=DBConnection.getConnection().prepareStatement("select count(*) as count from files");
ps6=DBConnection.getConnection().prepareStatement("insert into files values(?,?,?,?,?,?)");
ps7=DBConnection.getConnection().prepareStatement("select sem from faculty where email=?");
ps8=DBConnection.getConnection().prepareStatement("select subject from faculty where email=? and sem=?");
ps9=DBConnection.getConnection().prepareStatement("select * from marks where sem=? and subject=?");
ps10=DBConnection.getConnection().prepareStatement("select roll_no from student where sem=?");
ps11=DBConnection.getConnection().prepareStatement("select * from marks where subject=?");  
ps12=DBConnection.getConnection().prepareStatement("update marks set midsem1=?,update1=? where roll_no=? and sem=? and subject=?");
ps13=DBConnection.getConnection().prepareStatement("insert into marks(roll_no,sem,subject,midsem1,update1) values(?,?,?,?,?)");
ps14=DBConnection.getConnection().prepareStatement("update marks set midsem2=?,update2=? where roll_no=? and sem=? and subject=?");
ps15=DBConnection.getConnection().prepareStatement("insert into marks(roll_no,sem,subject,midsem2,update2) values(?,?,?,?,?)");
ps16=DBConnection.getConnection().prepareStatement("update marks set midsem3=?,update3=? where roll_no=? and sem=S? and subject=?");
ps17=DBConnection.getConnection().prepareStatement("insert into marks(roll_no,sem,subject,midsem3,update3) values(?,?,?,?,?)");
ps18=DBConnection.getConnection().prepareStatement("select * from marks where sem=? and subject=?");
ps19=DBConnection.getConnection().prepareStatement("select sname from student where roll_no=? and sem=?");
ps20=DBConnection.getConnection().prepareStatement("update marks set midsem1=?,midsem2=?,midsem3=? where roll_no=? and sem=? and subject=?");    
ps21=DBConnection.getConnection().prepareStatement("select update1 from marks where sem=? and subject=?");
ps22=DBConnection.getConnection().prepareStatement("select update2 from marks where sem=? and subject=?");
ps23=DBConnection.getConnection().prepareStatement("select update3 from marks where sem=? and subject=?");
ps24=DBConnection.getConnection().prepareStatement("update marks set midsem1=? where roll_no=? and sem=? and subject=?");
ps25=DBConnection.getConnection().prepareStatement("update marks set midsem2=? where roll_no=? and sem=? and subject=?");
ps26=DBConnection.getConnection().prepareStatement("update marks set midsem2=? where roll_no=? and sem=? and subject=?");
ps27=DBConnection.getConnection().prepareStatement("select fname from faculty where email=?");
ps28=DBConnection.getConnection().prepareStatement("select password from users where username=?");
ps29=DBConnection.getConnection().prepareStatement("select subject from faculty where email=?");
ps30=DBConnection.getConnection().prepareStatement("select question,asked_by,topic,answer,id from query where subject = ?");
ps31=DBConnection.getConnection().prepareStatement("update query set answer = ?,answered_by = ? where question = ?");
ps32=DBConnection.getConnection().prepareStatement("select topic,question,answer from query where id = ?");
    }
    
    catch(Exception e)
    {
        System.out.println("error"+e);
        e.printStackTrace();
    }
    
    }
    public static QueryDTO fetchQueryById(String id) throws SQLException {
        QueryDTO query = null;
        ps32.setString(1, id);
        ResultSet rs = ps32.executeQuery();
        if(rs.next()) {
            query = new QueryDTO();
            query.setTopic(rs.getString("topic"));
            query.setQuestion(rs.getString("question"));
            query.setAnswer(rs.getString("answer"));
        }
        return query;
    }
    public static boolean insertReply(String answer, String answer_by, String question) throws SQLException {
        ps31.setString(1, answer);
        ps31.setString(2, answer_by);
        ps31.setString(3, question);
        int result = ps31.executeUpdate();
        System.out.println(result +"inside insert reply");
        return (result != 0);
    }
    public static ArrayList<QueryDTO> getQueries(ArrayList<String> subject) throws SQLException {
        ArrayList<QueryDTO> queryData = new ArrayList<>();
        System.out.println("subject in dao is: "+subject);
       for(String sub : subject) {
           System.out.println("inside for loop : " + sub);
           ps30.setString(1, sub);
           ResultSet rs = ps30.executeQuery();
//           System.out.println(rs.next());
           while(rs.next()) {
               
               QueryDTO query = new QueryDTO();
               query.setAnswer(rs.getString("answer"));
               
               query.setQuestion(rs.getString("question"));
               
               query.setAskesdby(rs.getString("asked_by"));
               
               query.setTopic(rs.getString("topic"));
               query.setId(rs.getString("id"));
               
               queryData.add(query);
               
               
           }
          
       }
       return queryData;
    }
    public static ArrayList<String> getsubjectonusername(String username)throws SQLException
    {
        ArrayList<String> subject=new ArrayList();
    ps29.setString(1, username.toLowerCase());
    ResultSet rs=ps29.executeQuery();
    while(rs.next())
    {
    subject.add(rs.getString("subject"));
    }
    return subject;
    }
    public static FacultyDTO findFaculty(String username)throws SQLException
 {
     System.out.println("inside dao");
     ps1.setString(1,username.toLowerCase());
     FacultyDTO faculty=new FacultyDTO();
  
      ResultSet rs=ps1.executeQuery();
   if(rs.next())
    {
        System.out.println(""+rs.getString("photo"));
        faculty.setFname(rs.getString("fname").toUpperCase());
        faculty.setSem(rs.getInt("sem"));
        faculty.setSubject(rs.getString("subject".toUpperCase()));
        faculty.setMob(rs.getString("mob"));
        faculty.setEmail(rs.getString("email"));
        faculty.setAddress(rs.getString("address").toUpperCase());
        faculty.setPhoto(rs.getString("photo"));
        
      }
    return faculty;
}
    public static boolean updateFaculty(FacultyDTO f)throws SQLException
    {
       
        System.out.println("reached update faculty dao");
        ps2.setString(1,f.getMob());
            ps2.setString(2,f.getAddress());

            ps2.setString(3,f.getPhoto());
    ps2.setString(4,f.getFname());
      ps2.setString(5,f.getEmail());
        ps2.setInt(6,f.getSem());
        System.out.println(f.getMob());
                System.out.println(f.getAddress());
        System.out.println("update faculty"+f.getPhoto());
        System.out.println(f.getEmail());
        System.out.println(f.getSem());
        System.out.println(f.getFname());

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
     ps4.setString(1,user.getPassword());
     ps4.setString(2,user.getUsername().toLowerCase());
     ps4.setString(3,user.getUsertype().toLowerCase());
      int ans=ps4.executeUpdate();
        System.out.println(ans);
    return ans!=0;

        
    }
  public static boolean uploadFile(FileDTO file)throws SQLException
  {System.out.println("inside upload file");
      ResultSet rs=ps5.executeQuery();
      if(rs.next())
     {
          String index = rs.getString(1);
         System.out.println("index"+index);
         int id=Integer.parseInt(index);
          String nextId="F-000"+(id+1);
          file.setFile_id(nextId);
          System.out.println("nextId"+file.getFile_id());
     }
      ps6.setString(1,file.getFile_id());
      ps6.setString(2,file.getFilename());
      ps6.setString(3,file.getSubject());
      ps6.setString(4,file.getDescription());
      ps6.setDate(5,file.getTime_Stamp());
      ps6.setString(6,file.getFilepath());
       int ans=ps6.executeUpdate();
       System.out.println("ans"+ans);
   if(ans!=0)
   {
       System.out.println("Record inserted Succesfully in order master");
       return true;
   }
   else
       return false;
  }
  
 public static ArrayList<Integer> getSem(String email)throws SQLException
   {
             
   ArrayList<Integer> itemList=new ArrayList<>();
      ps7.setString(1,email.toLowerCase());
 ResultSet rs=ps7.executeQuery();
     
 while(rs.next())
 {
 itemList.add(rs.getInt(1));
     
 }
 
 return itemList;
    
}
public static String getSubject(String email,int sem)throws SQLException 
{
ps8.setString(1, email.toLowerCase());
ps8.setInt(2, sem);
ResultSet rs=ps8.executeQuery();
rs.next();
String subject=rs.getString("subject");
    System.out.println("in dao"+subject);
return subject;        
}
public static ArrayList<String> getRoll_no(int sem)throws SQLException
{
ps10.setInt(1,sem);
ArrayList<String> rollno=new ArrayList<String>();
ResultSet rs=ps10.executeQuery();
while(rs.next())
{
String roll=rs.getString("roll_no");
rollno.add(roll);
}
return rollno;
}

public static boolean setMidsem1Marks(ArrayList<MarksUpdate> marks,int midsem,String subject)throws SQLException
{
    int ans=0;
    String update="yes";
int lenght=marks.size();
    System.out.println("in the dao subject is"+subject);
    System.out.println("lenght of marks arraylist"+lenght);
ps11.setString(1, subject);
ResultSet rs=ps11.executeQuery();
if(rs.next())
{

    for(MarksUpdate mark:marks)
    {
        System.out.println("in the update section");
    ps12.setInt(1,mark.getMidsem1());
    ps12.setString(2,update);
    ps12.setString(3,mark.getRoll_no());
    ps12.setInt(4,mark.getSem());
    ps12.setString(5, subject);
    ans=ps12.executeUpdate();

    }

}
else
{
    System.out.println("in the insert section");
 for(MarksUpdate mark:marks)
    {
        System.out.println("inside marks insert");
    ps13.setString(1,mark.getRoll_no());
    ps13.setInt(2,mark.getSem());
    ps13.setString(3, subject);
    ps13.setInt(4,mark.getMidsem1());
        ps13.setString(5,update);

    ans=ps13.executeUpdate();
        System.out.println("not printed"+mark.getRoll_no()+"marks "+mark.getSem()+"amsg "+ans);
    }
 
}
    System.out.println("after else value of ans is:"+ans);
if(ans!=0)
    return true;
else 
    return false;
}
public static boolean setMidsem2Marks(ArrayList<MarksUpdate> marks,int midsem,String subject)throws SQLException
{
    int ans=0;
    String update="yes";
int lenght=marks.size();
    System.out.println("lenght of marks arraylist"+lenght);
ps11.setString(1, subject);
ResultSet rs=ps11.executeQuery();
if(rs.next())
{
    System.out.println("in the update module");
    for(MarksUpdate mark:marks)
    {
        
    ps14.setInt(1,mark.getMidsem2());
        ps14.setString(2,update);

    ps14.setString(3,mark.getRoll_no());
    ps14.setInt(4,mark.getSem());
    ps14.setString(5, subject);
    ans=ps14.executeUpdate();
         System.out.println("not printed"+mark.getRoll_no()+"marks "+mark.getSem()+"amsg "+ans);

    }

}
else
{
    System.out.println("in insert module");
 for(MarksUpdate mark:marks)
    {
    ps15.setString(1,mark.getRoll_no());
    ps15.setInt(2,mark.getSem());
    ps15.setString(3, subject);
    ps15.setInt(4,mark.getMidsem2());
        ps15.setString(5,update);

    ans=ps15.executeUpdate();
    }
 
}
if(ans!=0)
    return true;
else 
    return false;
}
public static boolean setMidsem3Marks(ArrayList<MarksUpdate> marks,int midsem,String subject)throws SQLException
{
    int ans=0;
    String update="yes";
int lenght=marks.size();
System.out.println("lenght of marks arraylist"+lenght);
ps11.setString(1, subject);
ResultSet rs=ps11.executeQuery();
if(rs.next())
{

    for(MarksUpdate mark:marks)
    {
    ps16.setInt(1,mark.getMidsem3());
        ps16.setString(2,update);

    ps16.setString(3,mark.getRoll_no());
    ps16.setInt(4,mark.getSem());
    ps16.setString(5, subject);
    ans=ps16.executeUpdate();
   
    }

}
else
{
 for(MarksUpdate mark:marks)
    {
    ps17.setString(1,mark.getRoll_no());
    ps17.setInt(2,mark.getSem());
    ps17.setString(3, subject);
    ps17.setInt(4,mark.getMidsem3());
    ps17.setString(5, update);
    ans=ps17.executeUpdate();
    }
 
}
if(ans!=0)
    return true;
else 
    return false;
}
 public static ArrayList<MarksUpdate> getResult(int sem,String subject)throws SQLException
   {
       
       ArrayList<MarksUpdate> m=new ArrayList<MarksUpdate>();
       ps18.setInt(1,sem);
       ps18.setString(2, subject);
       ResultSet rs=ps18.executeQuery();
       
       
       while(rs.next())
       {
           MarksUpdate obj=new MarksUpdate();
           obj.setRoll_no(rs.getString("roll_no"));
           ps19.setString(1,rs.getString("roll_no"));
           ps19.setInt(2,sem);
           ResultSet rs1=ps19.executeQuery();
           rs1.next();
           obj.setName(rs1.getString("sname"));
           obj.setMidsem1(rs.getInt("midsem1"));
           obj.setMidsem2(rs.getInt("midsem2"));
           obj.setMidsem3(rs.getInt("midsem3"));
           obj.setUpdate1(rs.getString("update1"));
           obj.setUpdate2(rs.getString("update2"));
           obj.setUpdate3(rs.getString("update3"));
           m.add(obj);
       }
       return m;
   }
 public static boolean editMarks(ArrayList<MarksUpdate> marks,String subject)throws SQLException
 {
     System.out.println("inside the dao");
   int ans=0;
int lenght=marks.size();
System.out.println("lenght of marks arraylist"+lenght);



    for(MarksUpdate mark:marks)
    {
 ps20.setInt(1,mark.getMidsem1());
 ps20.setInt(2,mark.getMidsem2());
  ps20.setInt(3,mark.getMidsem3());
ps20.setString(4,mark.getRoll_no());
ps20.setInt(5,mark.getSem());
ps20.setString(6,mark.getSubject());
ans=ps20.executeUpdate();
        System.out.println("1"+mark.getMidsem1()+"2"+mark.getMidsem2()+"3"+mark.getMidsem3()+"4"+mark.getRoll_no()+"5"+ans);
   }
    if(ans!=0)
        return true;
    else
        return false;
}
 public static String getUpdate1Value(int sem,String subject)throws SQLException
 {
 ps21.setInt(1, sem);
 ps21.setString(2, subject);
 String ans=null;
 ResultSet rs=ps21.executeQuery();
 if(rs.next())
 {
 String value=rs.getString("update1");
 if(value!=null)
 {
 ans="true";
 }
 else
 {     ans="false";
 }
 }
 else{
 ans="false";
 }
 return ans;
 }
  public static String getUpdate2Value(int sem,String subject)throws SQLException
 {
     System.out.println("reached in dao");
 ps22.setInt(1, sem);
     System.out.println("sem is"+sem);
 ps22.setString(2, subject);
     System.out.println("subject"+subject);
 String ans=null;
 ResultSet rs=ps22.executeQuery();
 if(rs.next())
 {
     System.out.println("we are inside");
 String value=rs.getString("update2");
     System.out.println("value is"+value);
 if(value!=null)
 {
 ans="true";
 }
 else
 {   ans="false";
 }
 }
 
 else{
 ans="false";
 }
     System.out.println("in dao the value of ans is:"+ans);
 return ans;
 }
 public static String getUpdate3Value(int sem,String subject)throws SQLException
 {
 ps23.setInt(1, sem);
 ps23.setString(2, subject);
 String ans=null;
 ResultSet rs=ps23.executeQuery();
 if(rs.next())
 {
 String value=rs.getString("update3");
 if(value!=null){
 ans="true";}
 else{
     ans="false";
 }}
 else{
 ans="false";
 }
 return ans;
 }

 public static boolean editMid1Marks(ArrayList<MarksUpdate> marks,String subject)throws SQLException
 {
     System.out.println("inside the dao");
   int ans=0;
int lenght=marks.size();
System.out.println("lenght of marks arraylist"+lenght);



    for(MarksUpdate mark:marks)
    {
 ps24.setInt(1,mark.getMidsem1());

ps24.setString(2,mark.getRoll_no());
ps24.setInt(3,mark.getSem());
ps24.setString(4,mark.getSubject());
ans=ps24.executeUpdate();
        System.out.println("1"+mark.getMidsem1()+"2"+mark.getMidsem2()+"3"+mark.getMidsem3()+"4"+mark.getRoll_no()+"5"+ans);
   }
    if(ans!=0)
        return true;
    else
        return false;
} 
 
 public static boolean editMid2Marks(ArrayList<MarksUpdate> marks,String subject)throws SQLException
 {
     System.out.println("inside the dao");
   int ans=0;
int lenght=marks.size();
System.out.println("lenght of marks arraylist"+lenght);



    for(MarksUpdate mark:marks)
    {
 ps25.setInt(1,mark.getMidsem2());

ps25.setString(2,mark.getRoll_no());
ps25.setInt(3,mark.getSem());
ps25.setString(4,mark.getSubject());
ans=ps25.executeUpdate();
        System.out.println("1"+mark.getMidsem1()+"2"+mark.getMidsem2()+"3"+mark.getMidsem3()+"4"+mark.getRoll_no()+"5"+ans);
   }
    if(ans!=0)
        return true;
    else
        return false;
}  
 
 public static boolean editMid3Marks(ArrayList<MarksUpdate> marks,String subject)throws SQLException
 {
     System.out.println("inside the dao");
   int ans=0;
int lenght=marks.size();
System.out.println("lenght of marks arraylist"+lenght);



    for(MarksUpdate mark:marks)
    {
 ps26.setInt(1,mark.getMidsem3());

ps26.setString(2,mark.getRoll_no());
ps26.setInt(3,mark.getSem());
ps26.setString(4,mark.getSubject());
ans=ps26.executeUpdate();
        System.out.println("1"+mark.getMidsem1()+"2"+mark.getMidsem2()+"3"+mark.getMidsem3()+"4"+mark.getRoll_no()+"5"+ans);
   }
    if(ans!=0)
        return true;
    else
        return false;
}  
 
public static String getFacultyName(String email)throws SQLException
{
    String name=null;
ps27.setString(1, email.toLowerCase());
ResultSet rs=ps27.executeQuery();
if(rs.next())
{
 name=rs.getString("fname");
}
return name;    
}
public static String getPassword(String username)throws SQLException
{
    ps28.setString(1, username);
    ResultSet rs=ps28.executeQuery();
    rs.next();
    String pass=rs.getString("password");
    return pass;
} 
 
}