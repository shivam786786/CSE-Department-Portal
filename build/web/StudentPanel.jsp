
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="modulecatalog.dto.MarksUpdate"%>
<%@page import="modulecatalog.dao.StudentDAO"%>
<%@page import="modulecatalog.dto.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modulecatalog.dto.SubjectsDTO"%>
<%@page import="modulecatalog.dto.StudentDTO"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel='icon' href='images/logo.jpg'>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
	<script src="js/jquery3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/editprofilestudent.js"></script>
	<script src="js/query.js"></script>




    <title>Student Panel</title>
</head>

<body>
<%
          

              String username=(String)session.getAttribute("username");
      if(username==null)
     {
         session.invalidate();
     response.sendRedirect("Accessedenied.html");
     }
         String password=null;
       String photo=null;
String rollno=null;
int sem=0;
int i=0;
  String update=null;
                          StudentDTO stu=new StudentDTO();
                          ArrayList<MarksUpdate> marks=new ArrayList<>();
              String usertype=(String)session.getAttribute("usertype");
                           
        MarksUpdate mr=new MarksUpdate();
           Date dt=(Date)request.getAttribute("dt");
           SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");

String str=sdf.format(dt);
           System.out.println("in qwertyuiijhgfdsxcvbnjkuytfcvbnjhgv bh"+str);
           
                            try{
                            
               password=(String)StudentDAO.getPassword(username);
                photo=(String)StudentDAO.getPhoto(username);
      stu=(StudentDTO)request.getAttribute("student");
      
      sem=stu.getSem();
      rollno=stu.getRollno();
      marks=StudentDAO.getMarks(sem,rollno);

      System.out.println("lenght of arrayList"+marks.size());
                            }
                            catch(Exception e)
                            {
                            System.out.println(""+e);
                            }
                                   

  

      SubjectsDTO sub=(SubjectsDTO)request.getAttribute("subjects");
      String uname=stu.getSname();
     
      String mob=stu.getMob();
      String email=stu.getEmail();
      String address=stu.getAddress();
      
       System.out.println("photo:"+photo);
       System.out.println("mobie"+mob);
       String sub1=sub.getSubject1();
       String sub2=sub.getSubject2();
       String sub3=sub.getSubject3();
       String sub4=sub.getSubject4();
       String sub5=sub.getSubject5();
      
       

      
%>
        <div class="container-fluid padding">
                <div class="row text-center text-light jumbotron bg-dark">
                    <div class="col-12">
                        <h1 class="">UNIVERSITY INSTITUE OF TECHNOLOGY, RGPV</h1>
                        <p  class="lead text-center" >Narshingarh Bypass Road Near Gandhi Nagar,Bhopal(M.P.)</p>
                    </div>
                </div>
                   <nav class ="navbar navbar-expand-lg navbar-light bg-light sticky-top">
            <div class="container-fluid">
                <a class = "navbar-brand"><img src="images/logo.jpg" style="width: 60px; height: 60px"><strong class="text-wrap" style="width: 6rem">Department of Computer Science & Engineering</strong></a>
                <button class = "navbar-toggler" type = "button" data-toggle="collapse" data-target="#navbarResp">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id = "navbarResp">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-primary mr-2 d-inline" href="Homepage.html" role="button">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-warning mr-2 d-inline dropdown-toggle" href="#" role="button" data-toggle="dropdown">About</a>
                            <div class="dropdown-menu">
                                <a href="Glance.html" class="dropdown-item">At A Glance</a>
                                <a href="developers.html" class="dropdown-item">Developers</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-danger mr-2 d-inline dropdown-toggle" href="#" role="button" data-toggle="dropdown">Community</a>
                            <div class="dropdown-menu">
                                    <a href="http://uitrgpv.ac.in/Index.aspx" class="dropdown-item">UIT_RGPV</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-info mr-2 d-inline dropdown-toggle" data-toggle="dropdown" href="#" role="button">Time Table</a>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item">SEMESTER-1</a>
                                <a href="#" class="dropdown-item">SEMESTER-2</a>
                                <a href="#" class="dropdown-item">SEMESTER-3</a>                       
                                <a href="#" class="dropdown-item">SEMESTER-4</a>
                                <a href="#" class="dropdown-item">SEMESTER-5</a>
                                <a href="#" class="dropdown-item">SEMESTER-6</a>
                                <a href="#" class="dropdown-item">SEMESTER-7</a>
                                <a href="#" class="dropdown-item">SEMESTER-8</a>

                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-dark mr-2  d-inline dropdown-toggle" data-toggle="dropdown" href="#" role="button">Syllabus & Scheme</a>
                            <div class="dropdown-menu">
                                <a href="scheme.jsp" class="dropdown-item">Syllabus</a>
                                <a href="syllabus.jsp" class="dropdown-item">Schemes</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-success d-inline text-wrap" href="Contact Us.html" role="button">Contact Us</a>
                        </li>
                       <li class="nav-item">
                            <a class="nav-link text-danger d-inline text-wrap" href="Registration.html" role="button">New User?</a>
                        </li>
					</ul>
                </div>
            </div>
        </nav>
           <div class="container-fluid padding">
               <div class="row text-center">
                   <div class="col-12">
                   
                   <div class="jumbotron bg-secondary ml-auto mr-auto rounded-pill text-light text-monospace">
                       
	<p class="lead display-4 text-monospace text-white-50">Student Panel</p>
						
				   </div>
	 <div class="row jumbotron bg-light ml-auto mr-auto text-nowrap ">
             <% if(session.getAttribute("time_stamp") == null) {%>
             <div class="col-sm-12 col-md-4 lead text-left h6 text-dark text-monospace" >Last Login:&nbsp;&nbsp;&nbsp;<span class="display-6 text-danger text-wrap font-weight-bold">First Time Logged In</span> </div>
             <%}
             else {%>
                     <div class="col-sm-12 col-md-4 lead text-left h6 text-dark text-monospace" >Last Login:&nbsp;&nbsp;&nbsp;<span class="display-6 text-danger text-wrap font-weight-bold"><%=session.getAttribute("time_stamp")%> </span> </div>
             <%}%>
             <div class="col-sm-12 col-md-4 lead text-center display-6 text-dark">Welcome <span class="text_monospace font-weight-bold"><%=stu.getSname()%><span> </div>
  <div class="col-sm-12 col-md-4 lead text-right display-6 text-danger" ><a href='ValidateControllerServlet?logout=logout'>Logout</a></div>
                     
				  </div>
			  </div>
            </div>
            <nav class="nav nav-tabs flex-column flex-sm-row nav-fill"id="nav-tab" role="tablist">
                
 <a class="nav-item nav-link active student" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="true">Profile</a>
 <a class="nav-item nav-link student" id="nav-file-tab" data-toggle="tab" href="#nav-file" role="tab" aria-controls="nav-file" aria-selected="false">File Download</a>

<a class="nav-item nav-link student" id="nav-result-tab" data-toggle="tab" href="#nav-result" role="tab" aria-controls="nav-result" aria-selected="true">Result</a>
                    <a class="nav-item nav-link student" id="nav-query-tab" data-toggle="tab" href="#nav-query" role="tab" aria-controls="nav-query" aria-selected="false">Ask Query</a>
                    <a class="nav-item nav-link student" id="nav-change_password-tab" data-toggle="tab" href="#nav-change_password" role="tab" aria-controls="nav-change_password" aria-selected="false">Change Password</a>
            </nav>
            <div class="tab-content nav-fills" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="container padding">
                        <div class="row">
                            <div class="col-md-3 mt-5">
                                <figure class="figure">
                                    <img src="images/<%=photo%>" class="figure-img img-fluid rounded-circle mt-5" alt="Profile Photo">
                                    <figcaption class="figure-caption text-center"><h3>Profile Photo</h3></figcaption>
                                  </figure>
                            </div>
                            <div class="col-md-6  mt-5">
                                <br>
                                <blockquote>
                                    <h5><%=uname%></h5>
                                    <strong>Student</strong>
                                </blockquote>
                                <hr class="bg-dark">
                               <h5><%=email%></h5>
                               </blackquote>
                                <hr class="bg-dark">
                                <h5><%=rollno%></h5><hr class="bg-dark">
                                 </blackquote>
                                <hr class="bg-dark">
                                <h5><%=mob%></h5>
                                   </blackquote>
                                <hr class="bg-dark">
                                <h5><%=sem%></h5>
                                <hr class="bg-dark">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EditProfileModal">Edit Profile</button>
                                </div>
                            </div>
                        </div>
                    </div>
 <div class="tab-pane fade" id="nav-file" role="tabpanel" aria-labelledby="nav-file-tab">
<div class="col-md-10 col-xm-12 col-sm-12 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; padding-top:20px; padding-bottom:10px;" >
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="far fa-file-pdf fa-3x"></i></h3><br>
                  <h2 class="text-center"><mark>&nbsp;File Download&nbsp;</mark></h2>
                  <p>Here You can download your Latest Files Uploaded By Concerned Faculties</p>
                  <div class="panel-body text-left"><form role="form">
		<br>
                  <label class="text-danger"><h4>- Your Semester :</h4></label>
	<div class="form-group">
            <input type="text" class="form-control" id="selectbox" readonly value="<%=sem%>">
                    </div> 
                <label class="text-danger"><h4>- Select the Subject :</h4></label>
	<div class="form-group">
            <select class="form-control" id="subject" onchange="getsubjectspdf()">
                <option> select a subject </option>
                <option><%=sub1%></option>
                <option><%=sub2%></option>
                <option><%=sub3%></option>
                <option><%=sub4%></option>
                <option><%=sub5%></option>
                           
            </select>          
        </div> 
                <br>		
                <label class="text-danger"><h4>- Latest Uploads of the selected subject are as follows :</h4></label>
                <br>
                <table id="fileDownloadTable" class="table table-bordered table-striped table-hover table-responsive" >
                    <thead class="thead-dark">
          
                        <tr>
                            <!-- rows and header wil be added dynamically-->   
               <th>Sr.NO.</th><th>File Name</th><th>Description</th><th>Upload Date</th><th>Downloads</th>
                        </tr>
             
                        </thead>
                    <tbody>				
                     
								
	</tbody>
	</table>
                      </form></div>
              </div>
              </div>
            </div></div>
			 <hr>  </div>
<!--------------------------------------------------Result Tab-------------------------->
<div class="tab-pane fade" id="nav-result" role="tabpanel" aria-labelledby="nav-result-tab">
<div class="container-fluid">
<div class="row " style="padding-top:20px;">
 <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding-top:20px;">
			 
 <div class="card text-center" style="width:80%; height:auto;" >
  <i class="fas fa-chalkboard-teacher fa-border fa-3x"></i>
<div class="card-body">
  <h4 class="card-title"><code><strong>1<sup>st</sup> Mid Semester</strong></code></h4>
 <p class="card-text">These exams are generally conducted in the second month of the alloted semester period.</p>
<input type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#studentResultModal1" value="Result">
                  </div>
  </div>
</div>
			
 <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding-top:20px;">
			 
  <div class="card text-center" style="width:80%; height:auto;" >
<i class="fas fa-laptop-code fa-3x fa-border"></i>
<div class="card-body">
  <h4 class="card-title"><code><strong>2<sup>nd</sup> Mid Semester</strong></code></h4>
  <p class="card-text">These exams are generally conducted during the third month of the alloted semester period. </p>
   <input type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#studentResultModal2" value="Result">
</div>
</div>
</div>
			
 <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding-top:20px;">
			<div class="card text-center" style="width:80%; height:auto;" >
				<i class="fas fa-chart-pie fa-border fa-3x"></i>
				<div class="card-body">
				  <h4 class="card-title"><code><strong>3<sup>rd</sup> Mid Semester</strong></code></h4>
				  <p class="card-text">These exams are generally conducted during the fourth month of the alloted semester period.</p>
<input type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#studentResultModal3" value="Result">
				</div>
			  </div>
			</div>
		
			
			 <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding-top:20px;">
				<div class="card text-center" style="width:80%; height:auto;" >
				<i class="fas fa-chart-area fa-3x fa-border"></i>
				<div class="card-body">
				  <h4 class="card-title"><code><strong>All Mid Semester</strong></code></h4>
				  <p class="card-text">Total of Three Mid Semester Examinations are conducted during the entire Semester period.</p>
<input type="button" class="btn btn-lg btn-success btn-block" data-toggle="modal" data-target="#studentResultModal" value="Result">
				</div>
			  </div>
			</div>
		
		</div>
	<!---------------------------------------------------------------------------------------------------------->

                






        
        
        
        
        <!--  Student result modal-->

<div id="studentResultModal" class="modal fade"  role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-success">
<h4 class="modal-title text-white">Your Performance Sheet Is: </h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<div class="col-md-12 col-xm-12 col-sm-12 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; padding-top:10px; padding-bottom:10px;" >
<div class="panel panel-default">
<div class="panel-body">
<div class="text-center">
<div class="panel-body text-left">
<form id="fileupload" role="form">
<br>	
<label class="text-danger"><h4>-Your Result is : </h4></label>
<table id="queryReplayTable" class="table table-bordered table-hover table-responsive" >
<%
if(marks.size()==0){
%>    
    <thead class="thead-dark">
<tr>
    <th>Marks For Any Subject Has Not Been Uploaded Yet..........</th>
</tr>
<%

}
else{
%>
</thead>  
<thead class="thead-dark">
<tr>
<th>Sr.No.</th><th>Subjects</th><th>MidSem1</th><th>MidSem2</th><th>MidSem3</th>
</tr>
</thead>
<%  
     for(MarksUpdate mrk:marks)
                                    {
      String update1=mrk.getUpdate1();
            String update2=mrk.getUpdate2();
      String update3=mrk.getUpdate3();

if(update1==null || update2==null || update3==null)
{
    if(update1==null && update2==null && update3==null)
  {
      
%>
  <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>

    <% }
else if(update3==null && update2==null)
{
%>
  <tr>	  
  <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem1()%>  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>
<%

}
else if(update1==null && update2==null)
{
%>
 <tr>	  
 <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem3()%>  readonly></td></div>
</tr>
<%
}
else if(update1==null && update3==null)
{
%>
 <tr>	  
 <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem2()%>  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>
<%}
else if(update1==null)
{
%>
 <tr>	  
 <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem2()%>  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem3()%>  readonly></td></div>
</tr>
<%}
else if(update2==null)
{
%>
 <tr>	  
 <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem1()%>  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem3()%>  readonly></td></div>
</tr>
<%}
else if(update3==null)
{
%>
 <tr>	  
 <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem1()%>  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem2()%>  readonly></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>
<%}



}
                                       else{
                                   
                                    %>

                                    <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem1()%>  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem2()%>  readonly></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem3()%>  readonly></td></div>
</tr>
<%
}}}
%>
				
</tbody>
		
</table>
							
</form>	
    
</div>
                </div>
             </div>
				</div>
				</div>
				
			</div>
			<div class="modal-footer bg-light">
	 
<button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>
<!------------------------------------------------------StudentModal1----->
<div id="studentResultModal1" class="modal fade"  role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-success">
<h4 class="modal-title text-white">Your Performance Sheet Is: </h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<div class="col-md-12 col-xm-12 col-sm-12 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; padding-top:10px; padding-bottom:10px;" >
<div class="panel panel-default">
<div class="panel-body">
<div class="text-center">
<div class="panel-body text-left">
<form role="form">
<br>	
<label class="text-danger"><h4>-Your Result is : </h4></label>
<table  class="table table-bordered table-hover table-responsive" >

<tbody>
    <%if(marks.size()==0)
    {
    %>
   <thead class="thead-dark">
<tr>
<th>Marks for Midsem1 for any of the subject has not been Uploaded Yet.</th>
</tr>
</thead>
<%}
else{
%>
<thead class="thead-dark">
<tr>
<th>Sr.No.</th><th>Subjects</th><th>MidSem1</th>
</tr>
</thead>
  <%
      
     for(MarksUpdate mrk:marks)
                                    {
      update=mrk.getUpdate1();
if(update==null)
{
%>
  <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>

    <%}
                                       else{
                                   
                                    %>

                                    <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem1()%>  readonly></td></div>
</tr>
<%
}}}
%>
				
</tbody>
			
</table>
							
</form>	
    
</div>
                </div>
             </div>
				</div>
				</div>
				
			</div>
			<div class="modal-footer bg-light">
	 
<button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>
<!------------------------studentresultmodal2------->
<div id="studentResultModal2" class="modal fade"  role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-success">
<h4 class="modal-title text-white">Your Performance Sheet Is: </h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<div class="col-md-12 col-xm-12 col-sm-12 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; padding-top:10px; padding-bottom:10px;" >
<div class="panel panel-default">
<div class="panel-body">
<div class="text-center">
<div class="panel-body text-left">
<form role="form">
<br>	
<label class="text-danger"><h4>-Your Result is : </h4></label>
<table  class="table table-bordered table-hover table-responsive" >
    <tbody>
        <%
        if(marks.size()==0){%>
   <thead class="thead-dark">
<tr>
<th>Marks for Midsem2 for any of the Subject has not been Uploaded Yet</th>
</tr>
</thead>
    <thead class="thead-dark">
        <%
        }
else{%>
<tr>
<th>Sr.No.</th><th>Subjects</th><th>MidSem2</th>
</tr>
</thead>
<tbody>
    <thead class="thead-dark">

</thead>
  <%
     for(MarksUpdate mrk:marks)
                                    {
      update=mrk.getUpdate2();
if(update==null)
{
%>
  <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>

    <%}
                                       else{
                                   
                                    %>

                                    <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem2()%>  readonly></td></div>
</tr>
<%
}}}
%>
				
</tbody>
			
</table>
							
</form>	
    
</div>
                </div>
             </div>
				</div>
				</div>
				
			</div>
			<div class="modal-footer bg-light">
	 
<button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>
<!-----------stidentresultModal3------------------>
<div id="studentResultModal3" class="modal fade"  role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-success">
<h4 class="modal-title text-white">Your Performance Sheet Is: </h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<div class="col-md-12 col-xm-12 col-sm-12 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; padding-top:10px; padding-bottom:10px;" >
<div class="panel panel-default">
<div class="panel-body">
<div class="text-center">
<div class="panel-body text-left">
<form  role="form">
<br>	
<label class="text-danger"><h4>-Your Result is : </h4></label>
<table  class="table table-bordered table-hover table-responsive" >
<thead class="thead-dark">
  <tbody>
    <%
    if(marks.size()==0)
    {
    %>
       <thead class="thead-dark">
<tr>
<th>Marks for Midsem3 for any of the subject has not been uploaded Yet</th>
</tr>
</thead>
    <thead class="thead-dark">
        <%
        }
else{%>
<tr>
<th>Sr.No.</th><th>Subjects</th><th>MidSem3</th>
</tr>
</thead>
  <%
     for(MarksUpdate mrk:marks)
                                    {
      update=mrk.getUpdate3();
if(update==null)
{
%>
  <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value="marks not uploaded"  readonly></td></div>
</tr>

    <%}
                                       else{
                                   
                                    %>

                                    <tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="topic"><%=mrk.getSubject()%></label></td><td><input type="text" class="form-control" value=<%=mrk.getMidsem3()%>  readonly></td></div>
</tr>
<%
}}}
%>
				
</tbody>
	
			
</table>
							
</form>	
    
</div>
                </div>
             </div>
				</div>
				</div>
				
			</div>
			<div class="modal-footer bg-light">
	 
<button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>
<!-- end of Student result modal-->


	</div>    
                        
                        
                        
                    </div>






		
<div class="tab-pane fade" id="nav-query" role="tabpanel" aria-labelledby="nav-query-tab">
		
			<div class="container-fluid">
			<div class="row " style="padding-top:20px;">
			
			 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			 
			  <div class="card text-center" style="width:100%; height:auto; padding:10px;" >
			<mark><i class="fas fa-chalkboard-teacher fa-border fa-3x"></i></mark>
				<div class="card-body">
		  <h4 class="card-title"><code><strong>Ask Queries</strong></code></h4>
				  <p class="card-text">Here you can <strong class="text-success" style="font-size:25px;"> Ask </strong> Questions and other subject specific queries.</p>
                                  <input type="button" class="btn btn-lg btn-info" id="aksQueries" data-toggle="modal" data-target="#askQueryModal" value="Ask Query">
			
							
				</div>
			  </div>
			</div>
			
			 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="card text-center" style="width:100%; height:auto; padding:10px;" >
				<mark><i class="fas fa-edit fa-border fa-3x"></i></mark>
				<div class="card-body">
				  <h4 class="card-title"><code><strong>Replies</strong></code></h4>
				  <p class="card-text">Here you can see the<strong class="text-success" style="font-size:25px;">  Answers </strong> of your previously asked Questions.</p>
				<input type="button" class="btn btn-lg btn-info" id="viewQuery" data-toggle="modal" data-target="#viewReplayModal" value="View Replies">
				
				</div>
			  </div>
			</div>
		</div>
		
		
<!--  Ask Query modal-->

		<div id="askQueryModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered">

			<div class="modal-content ">
			<div class="modal-header text-center bg-danger">
			`	
				<h4 class="modal-title text-white  text-center"> <i class="fas fa-chalkboard-teacher"></i>&nbsp;&nbsp;&nbsp;Ask Question</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form role="form">
					<label class="text-danger"><h4>- Select the Subject :</h4></label>
							 <div class="form-group">
                                                             <select class="form-control" id="selectsub">
                                             <option><%=sub1%></option>
                <option><%=sub2%></option>
                <option><%=sub3%></option>
                <option><%=sub4%></option>
                <option><%=sub5%></option>	  
								   </select>          
							 </div> 
					
					<label class="text-danger"><h4>- Topic :</h4></label>
							<div class="form-group"> 
                                                            <input type="text" class="form-control" id="topic" placeholder="For Ex: Dynamic Programming"> 
							</div>
					<label class="text-danger"><h4>- Your Question :</h4></label>
							<div class="form-group">
                                                            <textarea class="form-control" rows="4" id="question" placeholder="For Ex: What is DFC's in Dynamic Programming ?"></textarea>
							</div>
					    <div class="form-group">
                                                <input type="button" class="btn btn-lg btn-success btn-block" onclick="askquestion('<%=stu.getSname()%>')" data-toggle="modal" data-dismiss="modal" data-target="#askQuerySuccessModal" value="Ask Question">
						</div>
						
				</form>
			</div>
			<div class="modal-footer bg-light text-center ">
	 
			<button type="button" class="btn btn-danger btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>

<!-- end of Ask Query modal-->
<!--  View Replay modal-->

		<div id="viewReplayModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered ">

			<!-- Modal content-->
			<div class="modal-content ">
			<div class="modal-header text-center bg-danger">
				<h4 class="modal-title text-white">Choose One Of The Options To Continue :</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
					<form role="form">
					<label class="text-danger"><h5>- Select the Subject :</h5></label>
							 <div class="form-group">
                                 <select class="form-control" id='getsubjectquery' onchange="fetchQueryTable('<%=uname%>')">
                <option>Choose from below</option>
                <option><%=sub1%></option>
                <option><%=sub2%></option>
                <option><%=sub3%></option>
                <option><%=sub4%></option>
                <option><%=sub5%></option>  
								   </select>          
							 </div> 
						<br>		
<label class="text-danger"><h5>- The Status Of Your Asked Questions are as follows :</h5></label>
						<br>
						
                                                <div id="tabledata"></div>
				</form>
			</div>
			<div class="modal-footer bg-light">
			 <div class="card-footer">
				  <h4>Instructions :</h4>
					<ul>
					<li>Choose the Concerned Subject to know the status of your asked queries.</li>
					<li>Click on the Status(<span class="text-success">Answered</span><span>/</span><span class="text-danger">Not-Answered</span>) to know your Replay.</li>
					</ul>
					<button type="button" class="btn btn-danger btn-md text-center " data-dismiss="modal"> Close</button>
			</div>
			</div>
		</div>

		</div>
		</div>

<!-- end of View Replay modal-->

<!-- Student Replay Status Modal-->
<div id="showQuery"></div>

<!-- end of Student Replay Status Modal-->		
		</div>
	
		</div>
                   
<!----------------------------------------------------------------------------------------------------------------------->
                    	<div id="notAnsweredModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered text-center">

			<!-- Modal content-->
			<div class="modal-content  text-center">
			<div class="modal-header text-center bg-danger">
				<h4 class="modal-title text-white">Sorry!</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p class="text-success text-center"><h4>Opps...!!</h4></p>
				<p>Your Query is not resolved yet. Stay Tuned :) </p>
			</div>
			<div class="modal-footer bg-light">
	 
			<button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>
          
            <div id="querySuccessModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered text-center">

			<!-- Modal content-->
<div class="modal-content  text-center">
<div class="modal-header text-center bg-success">
<h4 class="modal-title text-white">Success</h4>
<button type="button" class="close" onclick="reload()" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">

<p>Your Qurery has been updated:) </p>
</div>
<div class="modal-footer bg-light">
	 
    <button type="button" class="btn btn-primary" onclick="reload()" data-dismiss="modal">Close</button>
	
			</div>
		</div>

		</div>
		</div>
<!------------------------------------------------------------------------------------>
<div class="tab-pane fade" id="nav-change_password" role="tabpanel" aria-labelledby="nav-change_password-tab">
<div class="container">
<div class="col-md-6 col-xm-12 col-sm-8 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; padding-top:20px; padding-bottom:10px;" >
            <div class="panel panel-default">
              <div class="panel-body">
                  <div class="text-center">
            <h3><i class="fas fa-id-card-alt fa-3x"></i></h3><br>
                  <h2 class="text-center"><mark>&nbsp;Change Password&nbsp;</mark></h2>
                  <p>You can reset your password here.</p>    
                   <div class="panel-body text-left">
    
                       <form role="form" action="javascript:checkpswd('<%=password%>','<%=usertype%>','<%=username%>')" autocomplete="off">
            <label><code><h5>Current Password:</h5></code></label>
            <div class="form-group pass_show"> 
                <input type="password" class="form-control" placeholder="Current Password" id="current" value="<%=password%>" readonly> 
</div>
         <label><code><h5>New Password:</h5></code></label>
<div class="form-group pass_show"> 
<input type="password" class="form-control" placeholder="New Password" id="new" required> 
</div> 
       <label><code><h5>Confirm Password:</h5></code></label>
<div class="form-group pass_show"> 
<input type="password" class="form-control" placeholder="Confirm Password" id="confirm" required> 
</div>  
       <div class="form-group ">
           <input type="submit" class="btn btn-lg btn-success btn-block"  value="Save Changes">
</div>
		
            </form>
                   </div>
                  </div></div></div>
   <style>
			
			.pass_show{position: relative} 

			.pass_show .ptxt { 
			position: absolute; 
			top: 50%; 
			right: 10px; 
			z-index: 1; 
			color: #f36c01; 
			margin-top: -10px; 
			cursor: pointer; 
			transition: .3s ease all; 
			} 
			.pass_show .ptxt:hover{color: #333333;} 
		
							</style>

<!--inline JS  for change pwd-->		<script>
			
			  
			$(document).ready(function(){
			$('.pass_show').append('<span class="ptxt">Show</span>');  
			});
			
			$(document).on('click','.pass_show .ptxt', function(){ 
			$(this).text($(this).text() == "Show" ? "Hide" : "Show"); 
			$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 
			});  
						</script>
			</div></div>    
                     
            <div id="changePasswordSuccessModal" class="modal fade"  role="dialog">
	
			  <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Success</h4>
		    <button type="button" class="btn btn-primary" onclick="reload()">Close</button>
			</div>
				  <div class="modal-body">
					<P>Password Has Been Changed</P>
				 </div>
		
				</div>
		
			  </div>
			</div>
		</div>
          
          
            <script>
              function reload()
              {
                  location.reload();
              }
            </script>
            
 <!-- Edit Profile Section-->
			
<div class="modal fade" id="EditProfileModal">
<div class="modal-dialog modal-lg modal-dialog-centered">
<div class="modal-content">

      <!-- Modal Header -->
<div class="modal-header bg-light">
<img id="homelogo" style="height:44px; " src="images/<%=photo%>">
<div class="text-center text-info lead"> <h4 class="modal-title">&nbsp;&nbsp;Edit Profile</h4></div>
<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

      <!-- Modal body -->
					<div class="modal-body ">
<div class="row">
      <!-- left column -->
	  <br>
      <div class="col-md-4">
        <div class="text-center">
		<br>
		<h3>Edit Profile Panel</h3>
<br>
	<div class="rounded-circle" id="editprofile" style=" height:100; width:100; margin-right:auto; margin-left:auto;" alt="Unable to show image">
	 <img src="images/<%=photo%>" id="browsedimg"  class="img-fluid "  style="width:100%; height: 100%" alt="avatar">
	</div>	
	<br>
	   <h6>Profile Photo</h6>
           <form class="form-horizontal" role="form" action="javascript:update()" autocomplete="off" id="fileUploadForm" method='POST' enctype='multipart/form-data'>
     
               <input type="file" id="profileupload" class="form-control" name="files" >
<script>
		
		$("#profileupload").change(function(e) {
		if(typeof browsedimg =='defined');
		$("#browsedimg").remove();
    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        
        var file = e.originalEvent.srcElement.files[i];
       
        var img = document.createElement("img");
        var reader = new FileReader();
        reader.onloadend = function() {
             img.src = reader.result;
			 img.height= 200;
			img.width=200;
			img.id="browsedimg";
			
        }
        reader.readAsDataURL(file);
        $("#editprofile").append(img);
		
    }
});</script>

	   </div>
	   
      </div>
      
      <!-- edit form column -->
      <div class="col-md-8 personal-info">
       
     		<br>
          <div class="form-group">
            <label class="col-lg-3 control-label"><strong>Name :</strong></label>
            <div class="col-lg-8">
                <input class="form-control" type="text" value="<%=uname%>"  id="name" required>
            </div>
          </div>
            <div class="form-group">
            <label class="col-lg-3 control-label"><strong>Roll No :</strong></label>
            <div class="col-lg-8">
                <input class="form-control" type="text" value="<%=rollno%>"  id="rollno" readonly>
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-lg-3 control-label"><strong>Semester :</strong></label>
            <div class="col-lg-8">
                <input class="form-control" type="text" value="<%=sem%>" id="sem" readonly>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label"><strong>Email :</strong></label>
            <div class="col-lg-8">
                <input class="form-control" type="text" value="<%=email%>" id="email"readonly>
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-md-3 control-label"><strong>Mob No. :</strong></label>
            <div class="col-md-8">
                <input class="form-control" type="text" value="<%=mob%>" id="mob" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"><strong>Address :</strong></label>
            <div class="col-md-8">
                <input class="form-control" type="text" value="<%=address%>" id="address" required>
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Save Changes">
              <span></span>
             <input type="button" class="btn btn-primary" data-dismiss="modal" value="Cancel"></button>
		
            </div>
          </div>
        </form>
      </div>
  </div>

  
				

 </div>
 	<br>
	</div>
     <!-- Modal footer 
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
-->
    </div>
  </div>
<div id="profileSuccessModal" class="modal fade"  role="dialog">
			  <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Success</h4>
		    <button type="button" class="btn btn-primary" onclick="reload()">Close</button>
			</div>
				  <div class="modal-body">
					<P>Profile has been Edited</P>
				 </div>
		
				</div>
		
			  </div>
			</div>
                         <div id="HomeModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logout'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>


             <div id="ContactModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logoutcontact'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>  




       <div id="UITModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logoutuit'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>  





       <div id="SchemeModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logoutscheme'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>  




       <div id="SyllabusModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logoutsyllabus'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>             
            
            
            
            
         <div id="AtaGlanceModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logoutglance'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>            
            
            
            
            
            <div id="DevelopersModal" class="modal fade"  role="dialog">
 <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Logout</h4>
		     <a href='ValidateControllerServlet?logout=logoutdeveloper'>Logout</a>
			</div>
				  <div class="modal-body">
                                      <P>You Will Be Logged Out from Your Profile</P>
				 </div>
		
				</div>
		
			  </div>
		</div>     
<script>
    function reload()
    {
        location.reload();
    }
    
</script>    
			
			<!-- end of Edit Profile Section-->
            <footer>
                    <div class="jumbotron bg-dark text-light text-center mt-4">
                        <h3><strong>&copy; COPY-RIGHT, UIT-RGPV</strong></h3>
                        <hr class="dark w-50 bg-light">
                        <p class="lead text-muted">ALL RIGHTS ARE RESERVED</p>
                        <div class="col-12 text-center social-icon padding">
                         <p class="text-muted">Connect with us:   
                             <a href="https://www.facebook.com/uitrgpvbhopal/" class="fab fa-facebook fa-2x" ></a>
                            <a href="#" class="fab fa-instagram fa-2x"></a>
                            <a href="#" class="fab fa-twitter fa-2x"></a>
                            <a href="#" class="fab fa-youtube fa-2x"></a>
                            <a href="#" class="fab fa-linkedin fa-2x"></a>
                        </p> 
                        </div>
                    </div>
            </footer>
    
               
            
        </div>
    
	
	
	
	
	

</body>

</html>
