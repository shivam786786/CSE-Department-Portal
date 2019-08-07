import java.sql.*;
import java.util.*;
class Demo
{
public static void main(String args[])
{
try{
Class.forName("oracle.jdbc.OracleDriver");
System.out.println("class found");
}
catch(ClassNotFoundException e)
{
System.out.println("class not found"+e);
}}}