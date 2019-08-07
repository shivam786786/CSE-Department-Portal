
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modulecatalog.dao.FacultyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modulecatalog.dto.FacultyDTO"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta content-type="identity" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel='icon' href='images/logo.jpg'>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/profilefaculty.js"></script>
        <script src="js/markupload.js" type="text/javascript"></script> 
        <script src="js/queryfaculty.js"></script>






    <title>Faculty Panel</title>
</head>

<body>
<% 
    int size=0;
       ArrayList<Integer> semester = (ArrayList <Integer>) request.getAttribute("semester");
            
             String username=(String)session.getAttribute("username");
                     String usertype=(String)session.getAttribute("usertype");
              System.out.println("username:"+username);
      if(username==null)
     {
         System.out.println("inside to invalidate session");
         session.invalidate();
         System.out.println("inside accessedenied");
     response.sendRedirect("Accessedenied.html");
     return;
     }
      String password=null;
      FacultyDTO fac=(FacultyDTO)request.getAttribute("faculty");
         Date today=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");
String str=sdf.format(today);
           

      String uname=fac.getFname();
      int sem=fac.getSem();
      String subject=fac.getSubject();
      String mob=fac.getMob();
      String email=fac.getEmail();
      String address=fac.getAddress();
      String photo=fac.getPhoto();
      System.out.println("sem is:"+sem);
      System.out.println("photo:"+photo);
       try{
           password= (String) session.getAttribute("password");

 
      size=semester.size();
      System.out.println("seize is"+size);
      System.out.println(""+semester);
      
      }
     
      catch(Exception e)
      {
      }
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
                       
					<p class="lead display-4 text-monospace text-white-50">Faculty Panel</p>
						
				   </div>
					 <div class="row jumbotron bg-light ml-auto mr-auto text-nowrap ">
					 <div class="col-sm-12 col-md-4 lead text-left text-monospace text-dark" >Last Login:&nbsp;&nbsp;&nbsp;<span class="display-6 text-danger text-wrap font-weight-bold"><%=session.getAttribute("time_stamp")%></div>
					  <div class="col-sm-12 col-md-4 lead text-center display-6 text-success">Welcome <%=fac.getFname()%> </div>
					   <div class="col-sm-12 col-md-4 lead text-right display-6 text-danger"><a href='ValidateControllerServlet?logout=logout'>Logout</a></div>
                     
				  </div>
			  </div>
            </div>
            <nav class="nav nav-tabs flex-column flex-sm-row nav-fill"id="nav-tab" role="tablist">
                
                    <a class="nav-item nav-link active student" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="true">Profile</a>
                    <a class="nav-item nav-link student" id="nav-file-tab" data-toggle="tab" href="#nav-file" role="tab" aria-controls="nav-file" aria-selected="false">File Upload</a>
                    <a class="nav-item nav-link student" id="nav-marks-tab" data-toggle="tab" href="#nav-marks" role="tab" aria-controls="nav-marks" aria-selected="false">Marks Upload</a>
                    <a class="nav-item nav-link student" id="nav-result-tab" data-toggle="tab" href="#nav-result" role="tab" aria-controls="nav-result" aria-selected="true">Result</a>
                    <a class="nav-item nav-link student" id="nav-query-tab" data-toggle="tab" href="#nav-query" role="tab" aria-controls="nav-query" aria-selected="false">Query Reply</a>
                   <a class="nav-item nav-link student"  data-toggle="tab" href="#nav-change_password" role="tab" aria-controls="nav-change_password" aria-selected="false">Change Password</a>
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
                                    <h5><strong><%=fac.getFname()%></strong></h5>
                                    <strong>Faculty Member</cite></strong>
                                    
                                </blockquote>
                                <hr class="bg-dark">
                               <h5 id="getusername"><%=email%></h5>
                                </blockquote>
                                <hr class="bg-dark">
                              <h5><%=fac.getMob()%></h5>
                               </blockquote>
                                <hr class="bg-dark">
                                <h5><%=fac.getAddress()%></h5>
                                 </blockquote>
                                <hr class="bg-dark">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EditProfileModal">Edit Profile</button>
                                </div>
                            </div>
                        </div>
                    </div>
   <div class="tab-pane fade" id="nav-file" role="tabpanel" aria-labelledby="nav-file-tab" onshow="getsem()">
  			
 <div class="col-md-6 col-xm-12 col-sm-8 border border-dark" style="margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; padding-top:20px; padding-bottom:10px;" >
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="far fa-file-pdf fa-3x"></i></h3><br>
                  <h2 class="text-center"><mark>&nbsp;File Upload&nbsp;</mark></h2>
                  <p>You can upload file with its Description here</p>
                  <div class="panel-body text-left">
<form id="fileupload" role="form" action="javascript:addfile()" autocomplete="off" method='POST' enctype='multipart/form-data'>
  <label class="text-danger"><h4>- Select the Semester :</h4></label>
  <div class="form-group" >
     
          <select class="form-control" id="semselected" onchange="getsubject('<%=email%>')">
                <option>Choose Your Semester from below:</option>
      <%
      for(int i=0;i<semester.size();i++)
      {
      %>
      <option><%=semester.get(i)%></option>
      <%
      }
      %>       
                                         
            </select>          
        </div> 
      <label class="text-danger"><h4>- Subject :</h4></label>
<div class="form-group"> 
    <input type="text" class="form-control" id="semsubject" readonly> 
</div>
    <label class="text-danger"><h4>- Select the File :</h4></label>
<div class="form-group"> 
    <input type="file" class="form-control" name="files" required> 
</div>

 <label class="text-danger"><h4>- Description :</h4></label>
<div class="form-group">
 <textarea class="form-control" rows="5" placeholder="Description about the file" id="description" required></textarea>
							</div>
						
						 <div class="form-group">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Upload File">
						</div>
						
					</form>
    
                  </div>
                </div>
              </div>
            </div>
			
<!-- fileupload success modal-->
			
			<div id="uploadSuccessModal" class="modal fade"  role="dialog">
			  <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Success</h4>
		    <button type="button" class="btn btn-primary" onclick="reload()">Close</button>
			</div>
				  <div class="modal-body">
					<P>File Has Been Uploaded Successfully</P>
				 </div>
		
				</div>
		
			  </div>
			</div>
			 
			<!--end of fileupload success modal --> 

			</div>
			 <hr>                                  
                                   </div>
<div class="tab-pane fade" id="nav-marks" role="tabpanel" aria-labelledby="nav-marks-tab"><div class="container-fluid " style="margin:20px; padding:0px;">
 <label class="text-danger"><h4>- Select Your Semester :</h4></label>
  <div class="form-group" >
     
          <select class="form-control" id="semselect" onchange="redirect('<%=username%>')">
                <option>Choose Your Semester from below:</option>
      <%
      for(int i=0;i<semester.size();i++)
      {
      %>
      <option><%=semester.get(i)%></option>
      <%
      }
      %>       
                                         
            </select>          
        </div> 		
        
        <div class="row " style="padding-top:20px; padding-right:0px; padding-left:0px;">
			 <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
			 
			  <div class="card text-center" style="width:80%; height:auto;  margin-top:20px;" >
<i class="fas fa-chart-area fa-3x fa-border"></i>
<div class="card-body">
 <h4 class="card-title"><code><strong>1<sup>st</sup> Mid Semester</strong></code></h4>
 <p class="card-text">Upload the marks for Mid Sem-1 <br>These exams are generally conducted in the second month of the alloted session period.</p>
  <input type="button" class="btn btn-primary" onclick="updateMid1()" value="Upload"></a>
<script>
    function updateMid1()
    {
        var s=$("#semselect").val();
        if(s=="Choose Your Semester from below:")
        {
            alert('Choose Your Semester');
            return;
        }
        else
        {
        window.setTimeout(destines,200);
   }
   function destines()
   {
    window.location="MarksUploadTable.jsp?midsem=1";
   }        
            
        }
    
    </script>
				</div>
			  </div>
			</div>
			
			 <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
			 
			  <div class="card text-center" style="width:80%; height:auto;  margin-top:20px;" >
				<i class="fas fa-laptop-code fa-3x fa-border"></i>
				<div class="card-body">
				  <h4 class="card-title"><code><strong>2<sup>nd</sup> Mid Semester</strong></code></h4>
				  <p class="card-text">Upload the marks for the Mid Sem-2 <br>These exams are generally conducted in the third month of the alloted session period. </p>
<input type="button" class="btn btn-primary" onclick="updateMid2()" value="Upload"></a>
<script>
    function updateMid2()
    {
        var s=$("#semselect").val();
        if(s==="Choose Your Semester from below:")
        {
            alert('Choose Your Semester');
            return;
        }
        else
        {
        window.setTimeout(destines,200);
   }
   function destines()
   {
    window.location="MarksUploadTable.jsp?midsem=2";
   }        
            
        }
    
    </script>

				</div>
			  </div>
			</div>
			
			 <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
			<div class="card text-center" style="width:80%; height:auto;  margin-top:20px;" >
				<i class="fas fa-chart-pie fa-border fa-3x"></i>
				<div class="card-body">
				  <h4 class="card-title"><code><strong>3<sup>rd</sup> Mid Semester</strong></code></h4>
				  <p class="card-text">Upload the marks for the Mid Sem-3 <br>These exams are generally conducted in the fourth month of the alloted session period.</p>
<input type="button" class="btn btn-primary" onclick="updateMid3()" value="Upload"></a>
<script>
    function updateMid3()
    {
        var s=$("#semselect").val();
        if(s=="Choose Your Semester from below:")
        {
            alert('Choose Your Semester');
            return;
        }
        else
        {
        window.setTimeout(destines,200);
   }
   function destines()
   {
    window.location="MarksUploadTable.jsp?midsem=3";
   }        
            
        }
    
    </script>

				</div>
			  </div>
			</div>
		</div>
		</div>
	
	 </div>
<div class="tab-pane fade" id="nav-result" role="tabpanel" aria-labelledby="nav-result-tab">
		<div class="container-fluid " style="margin:20px; padding:0px;">
			<div class="row " style="padding-top:20px;">
			
			 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-top:20px;">
			 
			  <div class="card text-center" style="width:100%; height:auto; padding:10px;" >
			<mark><i class="fas fa-chalkboard-teacher fa-border fa-3x"></i></mark>
				<div class="card-body">
				  <h4 class="card-title"><code><strong>View Marks</strong></code></h4>
				  <p class="card-text">Here you can <strong class="text-success" style="font-size:25px;"> View </strong> the Mid Semester Marks of The Students associated with your Subject.</p>
		<input type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#selectsemviewMarksModal" value="View">
			
							
				</div>
			  </div>
			</div>
			
			 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-top:20px;">
			<div class="card text-center" style="width:100%; height:auto; padding:10px;" >
				<mark><i class="fas fa-edit fa-border fa-3x"></i></mark>
				<div class="card-body">
	  <h4 class="card-title"><code><strong>Edit Marks</strong></code></h4>
				  <p class="card-text">Here you can <strong class="text-success" style="font-size:25px;">  Edit </strong> the Mid Semester Marks of The Students associated with your Subject.</p>
		<input type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#selectsemeditMarksModal" value="Edit">
				</div>
			  </div>
			</div>
		</div>
	<!----------------------------------------------------------------------------------------------------------->	
		<div id="selectsemviewMarksModal" class="modal fade"  role="dialog">
<div class="modal-dialog modal-md modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-danger">
<h4 class="modal-title text-center text-white">Choose A Semester From Given Box :</h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
 <label class="text-danger"><h4>- Select Your Semester :</h4></label>
  <div class="form-group" >
     
      <select class="form-control" id="semselect1" onchange="redirect1('<%=uname%>')">
           <option>Choose Your Semester From Below:</option>   
      <%
      for(int i=0;i<semester.size();i++)
      {
      %>
  
      <option><%=semester.get(i)%></option>
      <%
      }
      %>       
                                         
            </select>          
        </div>
      <input type="button" class="btn btn-lg btn-info" value="View Result"  onclick="chksem()">
      <script>
    function chksem()
    {
       var sem=$("#semselect1").val();
       if(sem=="Choose Your Semester From Below:")
       {
           alert("Select A Semester");
           return;
       }
       else
       {
           $("#viewMarksModal").modal('show');
       }
    }
    </script>
</div>
    <div class="modal-footer bg-light">
        
        <button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
       

			</div>
		</div>

		</div>
		</div>
      <!----------------------------------------------------------------------------------------------------------------->
      		<div id="selectsemeditMarksModal" class="modal fade"  role="dialog">
<div class="modal-dialog modal-md modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-danger">
<h4 class="modal-title text-center text-white">Choose Semester from given box :</h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
 <label class="text-danger"><h4>- Select Your Semester :</h4></label>
  <div class="form-group" >
     
      <select class="form-control" id="semselect2" onchange="redirect2('<%=uname%>')">
           <option>Choose Your Semester From Below:</option>   
      <%
      for(int i=0;i<semester.size();i++)
      {
      %>
  
      <option><%=semester.get(i)%></option>
      <%
      }
      %>       
                                         
            </select>          
        </div>
      <input type="button" class="btn btn-lg btn-info" value="View Result"  onclick="chksem1()">
      <script>
    function chksem1()
    {
       var sem=$("#semselect2").val();
       if(sem=="Choose Your Semester From Below:")
       {
           alert("Select A Semester");
           return;
       }
       else
       {
           $("#editMarksModal").modal('show');
       }
    }
    </script>
</div>
    <div class="modal-footer bg-light">
        
        <button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
       

			</div>
		</div>

		</div>
		</div>
		<!-- result tab- View marks modal-->

<div id="viewMarksModal" class="modal fade"  role="dialog">
<div class="modal-dialog modal-md modal-dialog-centered text-center">
<div class="modal-content  text-center">
<div class="modal-header text-center bg-danger">
<h4 class="modal-title text-center text-white">Choose One Of The Options To Continue :</h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
 <div>
<ul class="list-group list-group-flush">
<li class="list-group-item">
    <a href="FacultyViewMarksTable.jsp?midsem=1" class="text-dark text-decoration-none"><strong>1<sup>st</sup> Mid Semester Marks</strong></a>
</li>
<li class="list-group-item">
    <a href="FacultyViewMarksTable.jsp?midsem=2" class="text-dark text-decoration-none"><strong>2<sup>nd</sup> Mid Semester Marks</strong></a>
</li>
<li class="list-group-item">
<a href="FacultyViewMarksTable.jsp?midsem=3" class="text-dark text-decoration-none"><strong>3<sup>rd</sup> Mid Semester Marks</strong></a>
</li>
<li class="list-group-item">
<a href="FacultyViewMarksTable.jsp?midsem=4" class="text-dark text-decoration-none"><strong>All Mid Semester Marks</strong></a>
</li>
</ul>
 </div>
</div>
    <div class="modal-footer bg-light">
        
        <button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>

<!-- end of View Marks modal-->
<!-- Result tab- Edit marks modal-->

		<div id="editMarksModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered text-center">

			<!-- Modal content-->
			<div class="modal-content  text-center">
			<div class="modal-header text-center bg-danger">
				<h4 class="modal-title text-center text-white">Choose One Of The Options To Continue :</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
					 <div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<a href="FacultyEditMarksTable.jsp?midsem=1" class="text-dark text-decoration-none"><strong>1<sup>st</sup> Mid Semester Marks</strong></a>
										</li>
										<li class="list-group-item">
											<a href="FacultyEditMarksTable.jsp?midsem=2" class="text-dark text-decoration-none"><strong>2<sup>nd</sup> Mid Semester Marks</strong></a>
										</li>
										<li class="list-group-item">
											<a href="FacultyEditMarksTable.jsp?midsem=3" class="text-dark text-decoration-none"><strong>3<sup>rd</sup> Mid Semester Marks</strong></a>
										</li>
									<li class="list-group-item">
											<a href="FacultyEditMarksTable.jsp?midsem=4" class="text-dark text-decoration-none"><strong>All Mid Semester Marks</strong></a>
										</li>
									</ul>
					</div>
			</div>
			<div class="modal-footer bg-light">
	 
			<button type="button" class="btn btn-primary btn-md " data-dismiss="modal"> Close</button>
	
			</div>
		</div>

		</div>
		</div>

<!-- end of edit Marks modal-->
		
		</div>    





</div>
      <!----------------------------------------------------------------------------------------------------------------------------->
                                <div class="tab-pane fade" id="nav-query" role="tabpanel" aria-labelledby="nav-query-tab">
                                    		<div id="responseData">    </div>
				<!--  Query Replay modal-->
                                <div id="showQueryModal"></div>



<!-- end of Query Replay modal-->		
				
<!--  Query Replay Submit modal-->

		<div id="queryReplaySubmitModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered text-center">

			<!-- Modal content-->
			<div class="modal-content  text-center">
			<div class="modal-header text-center bg-success">
                            <h4 class="modal-title text-white" id="success"></h4>
				<button type="button" class="close" onclick="reload()" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
                            <p class="text-success text-center"><h4 class="text-success" id="replyStatus"></h4></p>
				<p> </p>
			</div>
			<div class="modal-footer bg-light">
	 
			<button type="button" class="btn btn-primary btn-md " onclick ="reload()" data-dismiss="modal"> Close</button>
	
			</div>
			</div>

		</div>
		</div>
                                </div>
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
				<h4 class="modal-title text-white" id="pswd"></h4>
		    <button type="button" class="btn btn-primary" onclick="reload()">Close</button>
			</div>
				  <div class="modal-body">
					<P id="pswdsuccess"></P>
				 </div>
		
				</div>
		
			  </div>
		</div></div>
          
          
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
                <input class="form-control" type="text" value="<%=uname%>"  id="name">
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
            
            
            
            
			
			<!-- end of Edit Profile Section-->
            <footer>
                    <div class="jumbotron bg-dark text-light text-center mt-4">
                        <h3><strong>&copy; COPY-RIGHT, UIT-RGPV</strong></h3>
                        <hr class="dark w-50 bg-light">
                        <p class="lead text-muted">ALL RIGHTS ARE RESERVED</p>
                        <div class="col-12 text-center social-icon padding">
                         <p class="text-muted">Connect with us:   <a href="#" class="fab fa-facebook" ></a>
                            <a href="#" class="fab fa-instagram"></a>
                            <a href="#" class="fab fa-twitter"></a>
                            <a href="#" class="fab fa-youtube"></a>
                            <a href="#" class="fab fa-linkedin"></a>
                        </p> 
                        </div>
                    </div>
            </footer>
    
               
            
        </div>
    
	
	
	
	
	

</body>

</html>



