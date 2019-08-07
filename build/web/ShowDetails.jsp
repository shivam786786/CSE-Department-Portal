<%-- 
    Document   : ShowDetails
    Created on : Mar 25, 2019, 12:58:32 AM
    Author     : Shivam
--%>

<%@page import="modulecatalog.dto.StudentDTO"%>
<%@page import="modulecatalog.dto.FacultyDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
            
          FacultyDTO faculty = (FacultyDTO) request.getAttribute("faculty");
          StudentDTO student = (StudentDTO) request.getAttribute("student");
        
          System.out.println("inside showdetails");
        
          System.out.println(student);
          System.out.println(faculty);
          System.out.println("gshfekjlmzdjikfdsjk");
 StringBuffer display = new StringBuffer("<div class='modal fade' id='registerModal' style='overflow-y: auto;'>");
          display.append("<div class='modal-dialog modal-lg modal-dialog-centered'>");
          display.append("<div class='modal-content'>");
          display.append("<div class='modal-header text-center bg-primary'>");
          display.append("<img id='homelogo' style='height:44px;' src='images/logo.jpg'>");
          display.append("<div class='text-white  lead'> <h4 class='modal-title text-center'>&nbsp;&nbsp;Registration Form</h4></div>");
          display.append("<button type='button' class='close' data-dismiss='modal'>&times;</button></div>");
          display.append("<div class='modal-body'>");
          display.append("<div class='row'><br>");
          display.append("<div class='col-md-4 mb-auto mt-auto'>");
          display.append("<div class='text-center'><br>");
          display.append("<div id='registeruser' style= 'height:200; width:200; margin-right:auto; margin-left:auto; border-radius:40%;' alt='Unable to show image'>");
          if(student==null) {
              display.append("<img src='images/"+faculty.getPhoto()+"' id='browsed'  class='img-fluid'  style='width:100%; height:100%; border-radius:40%;' alt='profilephoto'></div><br>");
              display.append("<h6>Profile Photo</h6>");

              display.append("</div></div>");
              display.append("<div class='col-md-8 personal-info'>");
              display.append("<form class='form-horizontal' role='form'><br>");
              display.append("<div class='form-group'>");
              display.append(" <label class='col-lg-3 control-label'><strong>Name :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+faculty.getFname()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append(" <label class='col-lg-3 control-label'><strong>Designation :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='Faculty'  id='desg' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>SUBJECT :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+faculty.getSubject()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>SEM :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+faculty.getSem()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>EMAIL :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+faculty.getEmail()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>NEW PASSWORD :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='password' placeholder = 'Enter New Password' id = 'pass'></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>CONFIRM PASSWORD :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='password' placeholder = 'Enter Confirm password' id='conpass'></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>MOB :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+faculty.getMob()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>ADDRESS :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+faculty.getAddress()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<div class='col-lg-8'><input type='button' class='btn btn-success'  value='Register Me' id='registeruser' onclick = 'sendData()'></div></div>");
              display.append("</form></div></div></div><br></div></div></div>");
              out.println(display);
              System.out.println(display);
         }
          else if(faculty==null){
              System.out.println("hellllooooo");
              display.append("<img src='images/"+student.getPhoto()+"' id='browsed'  class='img-fluid'  style='width:100%; height:100%; border-radius:40%;' alt='profilephoto'></div><br>");
              display.append("<h6>Profile Photo</h6>");

                display.append("</div></div>");
              display.append("<div class='col-md-8 personal-info'>");
              display.append("<form class='form-horizontal' role='form'><br>");
              display.append("<div class='form-group'>");
              display.append(" <label class='col-lg-3 control-label'><strong>Name :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+student.getSname().toUpperCase()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append(" <label class='col-lg-3 control-label'><strong>Designation :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='Student' readonly id='desg'></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>Roll No :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+student.getRollno()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>SEM :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+student.getSem()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>EMAIL :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+student.getEmail()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>NEW PASSWORD :</strong></label>");
              display.append("<div class='col-lg-8'><input type='password' placeholder = 'Enter New Password' id = 'pass'></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>CONFIRM PASSWORD :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='password' placeholder = 'Enter Confirm password' id='conpass'></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>MOB NO :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+student.getMob()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
              display.append("<label class='col-lg-3 control-label'><strong>ADDRESS :</strong></label>");
              display.append("<div class='col-lg-8'><input class='form-control' type='text' value='"+student.getAddress()+"' readonly></div></div>");
              display.append("<div class='form-group'>");
//              display.append("<label class='col-lg-3 control-label'><strong>ADDRESS :</strong></label>");
              display.append("<div class='col-lg-8'><button type='button' class='btn btn-success' id='registeruser'  onclick = 'sendData()'>Register Me</button></div></div>");
              display.append("</form></div></div></div><br></div></div></div>");
              out.println(display);
              System.out.println(display);
          }
        
          else {
              out.println("error");
          }
          
          
        %>
       
