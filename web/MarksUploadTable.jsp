<%@page import="modulecatalog.dto.MarksUpdate"%>
<%@page import="modulecatalog.dao.FacultyDAO"%>
<%@page import="java.util.ArrayList"%>
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
	  <script src="js/jquery3.3.1.js" type="text/javascript"></script>
    
          
          <script src="js/bootstrap.min.js" type="text/javascript"></script> 
        <script src="js/markupload.js" type="text/javascript"></script> 

    <title>CSE Department Portal of UIT, RGPV</title>
</head>
<body>
 <%
          
      int size=0;
            String subjectformarks=(String)session.getAttribute("subjectformarks");
            String username=(String)session.getAttribute("username");
           
      if(username==null)
     {
         System.out.println("inside to invalidate session");
         session.invalidate();
         System.out.println("inside accessedenied");
     response.sendRedirect("Accessedenied.html");
     return;
     }
         String sem=(String)session.getAttribute("sem");
              
             System.out.println("in marks upload sem is:"+sem);
              System.out.println("in marks uploadusername:"+username);
                            System.out.println("in marks uploadusername:"+subjectformarks);
              ArrayList<String> roll_no=(ArrayList<String>)session.getAttribute("roll_no");
System.out.println("in jsp of marks upload "+roll_no);
String midsem=request.getParameter("midsem");
System.out.println("midsem is"+midsem);
int mid=Integer.parseInt(midsem);
int s=Integer.parseInt(sem);
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
            </div> </nav> 

			<!-- <button class = "navbar-toggler" type = "button" data-toggle="collapse" data-target="#navbarResp">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id = "navbarResp">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-primary mr-2 d-inline" href="carousel.html" role="button">Home</a>
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
                                <a href="#" class="dropdown-item">Syllabus</a>
                                <a href="#" class="dropdown-item">Schemes</a>
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
        </nav> -->
			<div class="jumbotron bg-secondary ml-auto mr-auto text-light">
			<p class="lead display-4 text-center text-white" >Marks Upload Panel</p>
			</div>
	<div class="container-fluid">
	<div class="row">
		
		<div class="card" style="width:100%">
  <div class="card-header bg-danger text-white text-center"><h4>Upload The Marks of : MID SEMESTER-1/2/3</h4></div>
  <div class="card-body text-center">
			
			<form method="get">
			
	<table id="marksUploadTable" class="table table-bordered table-striped table-hover " >
	<thead class="thead-dark">
<label class="text-danger"><h4>- Marks will be uploaded for Sem :</h4></label><input type="text" id="sem" value="<%=sem%>" readonly>
  
     
            
 <br>
 <label class="text-danger"> <h4>-Marks Will be Uploaded for subject:</h4></label>
 <div class="text-center">
<div class="col-xs-2">
    <br><input type="text" class="form-control" id="subject" value="<%=subjectformarks%>" readonly>
</div></div>
 				
 

<%
    try{
        String updateValue=null;
if(mid==1)
{
 updateValue=FacultyDAO.getUpdate1Value(s,subjectformarks);
}
else if(mid==2)
{
    System.out.println("midsem value is2");
 updateValue=FacultyDAO.getUpdate2Value(s,subjectformarks);
System.out.println("value of "+updateValue);
}
else
{
 updateValue=FacultyDAO.getUpdate3Value(s,subjectformarks);
}
if(updateValue.equalsIgnoreCase("true"))
{
%>
<tr>
<th>Marks of midsem<%=mid%> for <%=subjectformarks%> has already been uploaded..To Change the marks Click on Result Tab and Edit Marks</th>
</tr>
<%
    }
else
{
size=roll_no.size();
%>

<tr>
<th>Sr.NO.</th><th>Enrollment NO.</th><th>Marks</th>
</tr>
<%
for(int i=0;i<roll_no.size();i++)
{
%>
</thead>
<tbody>
 <div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="email" class="success"><%=roll_no.get(i)%></label></td><td><input type="text" class="form-control"  placeholder="For Ex: 12" id="<%=roll_no.get(i)%>"></td></div> </tr> 
<% 
}
%>
        </tbody>
<div class="col-md-8 text-center">
<td colspan="3"><input type="button" class="btn btn-success" onclick="setmarks('<%=midsem%>','<%=size%>')" value=" Upload Marks " ></td>
<%}
}    catch(Exception e)
    {
    }    
%>






   

</div>
</table>
</form>	
			
  
  </div> 
  <div class="card-footer">
  <h3>Instructions</h3>
	<ul>
	<li>Input the marks in the respective fields allocated to each student.</li>
	<li>Marks will be alloted as per the <code><strong>CBGS</strong></code> marking Scheme i.e. Marks will be given out of <kbd> 30 </kbd></li>
	<li>If a Student was <code><strong>ABSENT</strong></code> during the conduction of the Examination, Input his/her marks as <kbd>0</kbd>.</li>
	<li>Before final submission, please make sure that all the fields/marks have been filled properly.</li>
	</ul>
	</div>
	</div>
		
	</div>
	
	<!--  Upload marks success modal-->

		<div id="UploadMarksSuccessModal" class="modal fade"  role="dialog">
		<div class="modal-dialog modal-md modal-dialog-centered text-center">

			<!-- Modal content-->
			<div class="modal-content  text-center">
			<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Success</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p class="text-success text-center"><h4><code>Congratulations..!!</code></h4></p>
				<p><strong>Marks has been Uploaded Succesfully :) </strong></p>
			</div>
			<div class="modal-footer bg-light">
	 
			<button type="button" class="btn btn-primary btn-md " onclick="reload()"> Close</button>
	
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

<!-- end of Upload Mark ssuccess modal-->
	
	
	
	</div>

<hr>
	 <footer>
                    <div class="jumbotron bg-dark text-light text-center mt-4">
                        <h3><strong>&copy; COPY-RIGHT 2019, UIT-RGPV, BHOPAL</strong></h3>
                        <hr class="dark w-50 bg-light">
                        <p class="lead text-muted">ALL RIGHTS ARE RESERVED</p>
                        <div class="col-12 text-center social-icon padding ">
                         <p class="text-white"><strong>Connect with us :  </strong></p> 
							<a href="#" class="fab fa-facebook fa-2x" ></a>
                            <a href="#" class="fab fa-instagram fa-2x text-purple"></a>
                            <a href="#" class="fab fa-twitter fa-2x"></a>
                            <a href="#" class="fab fa-youtube fa-2x"></a>
                            <a href="#" class="fab fa-linkedin fa-2x"></a>
                        
                        </div>
                    </div>
            </footer>	
			
</div>			
	
</body>
</html>		