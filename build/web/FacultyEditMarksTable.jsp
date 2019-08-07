<%@page import="modulecatalog.dao.FacultyDAO"%>
<%@page import="modulecatalog.dto.MarksUpdate"%>
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
        <script src="js/editmarks.js" type="text/javascript"></script> 

    <title>CSE Department Portal of UIT, RGPV</title>
</head>
<body>
     <%
          
      ArrayList<MarksUpdate> marks=new ArrayList<>();
            String subject=(String)session.getAttribute("subjectforresult");
            String username=(String)session.getAttribute("username");
           int i=0;
           int size=0;
      if(username==null)
     {
         System.out.println("inside to invalidate session");
         session.invalidate();
         System.out.println("inside accessedenied");
     response.sendRedirect("Accessedenied.html");
     return;
     }
         String sem=(String)session.getAttribute("semforresult");
         int s=Integer.parseInt(sem);
              String name=(String)session.getAttribute("nameforresult");
              String midsem=request.getParameter("midsem");
              int mid=Integer.parseInt(midsem);
             System.out.println("in marks upload sem is:"+sem);
              System.out.println("in marks uploadusername:"+username);
                            System.out.println("in marks uploadusername:"+subject);
                                                    System.out.println("in marks uploadusername:"+name);
 try{   
                                                    marks=FacultyDAO.getResult(s, subject);
        }
 catch(Exception e)
 {
 System.out.println(""+e);
 e.printStackTrace();
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
					<p class="lead display-4 text-center text-white" >View Marks Panel</p>
					</div>
	<div class="container-fluid">
	<div class="row">
				<div class="row jumbotron bg-light ml-auto mr-auto text-nowrap" style="width:100%;">
				<div class="col-sm-12 col-md-4 lead text-left display-6 text-danger text-nowrap" >Semester : <code><%=sem%></code> </div>
				<div class="col-sm-12 col-md-4 lead text-center display-6 text-success">Welcome <%=name%></div>
				<div class="col-sm-12 col-md-4 lead text-right display-6 text-danger text-wrap" >Subject :<code><%=subject%></code></div>
				</div>
		<div class="card" style="width:100%">
  <div class="card-header bg-danger text-white text-center"><h4>Marks of MID SEMESTER-1/2/3/All are as follows :</h4></div><!--  1/2/3/All any one one of the options -->
  <div class="card-body text-center">
			<!-- considering faculty has selected  view All MId Sem Marks then structure will be as follows -->
			<form method="get">
			
	<table id="marksUploadTable" class="table table-bordered table-hover table-responsive" >
				
		
<%
    size=marks.size();

 if(marks.size()==0)
{%>
<tr><th>Marks Have Not Been Uploaded For <%=subject%>.....Upload the marks by clicking on the tab Upload </th></tr>
<%
    return;
}
else
{ 
try
{
String updateValue=null;      
if(mid==1)
{
 updateValue=FacultyDAO.getUpdate1Value(s,subject);
}
else if(mid==2)
{
    System.out.println("midsem value is2");
 updateValue=FacultyDAO.getUpdate2Value(s,subject);
System.out.println("value of "+updateValue);
}
else
{
 updateValue=FacultyDAO.getUpdate3Value(s,subject);
}
if(updateValue.equalsIgnoreCase("false"))
{System.out.println("in the if section ");
%>
<tr><th>Marks of all the three midsem for <%=subject%> have not been uploaded...Click On Upload Tab to upload the marks</th></tr>

<%return;}
else 
{
if(mid==1)
{
%>
<thead class="thead-dark">
				<tr>
<!-- rows and header wil be added dynamically-->   
<th>Sr.NO.</th><th>Enrollment NO.</th><th>Name</th><th>Mid Sem_1</th>
				</tr>
				</thead>
<%
     for(MarksUpdate r:marks)
    {
        String mid1=r.getRoll_no()+"one";
  %>
<tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="roll_no" class="success"><%=r.getRoll_no()%></label></td><td><label for="name"><%=r.getName()%></label></td><td><input type="text" class="form-control" id="<%=mid1%>" value="<%=r.getMidsem1()%>"></td></div>
</tr>
<tr class="bg-dark">
<div class="col-md-8 text-center"></div>
</div>
                </tr>
  <%
      }
%>
<tr class="bg-dark">
                <div class="col-md-8 text-center">
 <td colspan="6"><input type="button" class="btn btn-success" value="Save Changes" onclick="setmarks1('<%=size%>','<%=sem%>','<%=subject%>')"></td>
				
				</div>
				</tr>			
				</table>
				</form>  </div>

<%
}
else if(mid==2)
{
%>
<thead class="thead-dark">
				<tr>
<!-- rows and header wil be added dynamically-->   
<th>Sr.NO.</th><th>Enrollment NO.</th><th>Name</th><th>Mid Sem_2</th>
				</tr>
				</thead>

<%
    
     for(MarksUpdate r:marks)
    {
        String mid2=r.getRoll_no()+"two";
%>
<tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="roll_no" class="success"><%=r.getRoll_no()%></label></td><td><label for="name"><%=r.getName()%></label></td><td><input type="text" class="form-control" id="<%=mid2%>" value="<%=r.getMidsem2()%>"></td></div>
</tr>

                                
<%
}%>
<tr class="bg-dark">
<div class="col-md-8 text-center"></div>
</div>
                </tr><tr class="bg-dark">
                <div class="col-md-8 text-center">
 <td colspan="6"><input type="button" class="btn btn-success" value="Save Changes" onclick="setmarks2('<%=size%>','<%=sem%>','<%=subject%>')"></td>
				
				</div>
				</tr>			
				</table>
				</form>  </div>
  <%

}
else if(mid==3)
{
%>
<thead class="thead-dark">
				<tr>
<!-- rows and header wil be added dynamically-->   
<th>Sr.NO.</th><th>Enrollment NO.</th><th>Name</th><th>Mid Sem_3</th>
				</tr>
				</thead>
                                <%
    
     for(MarksUpdate r:marks)
    {
        String mid3=r.getRoll_no()+"three";
%>
<tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="roll_no" class="success"><%=r.getRoll_no()%></label></td><td><label for="name"><%=r.getName()%></label></td><td><input type="text" class="form-control" id="<%=mid3%>" value="<%=r.getMidsem3()%>"></td></div>
</tr>
<tr class="bg-dark">
<div class="col-md-8 text-center"></div>
</div>
                                             <%

}
%>
   </tr><tr class="bg-dark">
                <div class="col-md-8 text-center">
 <td colspan="6"><input type="button" class="btn btn-success" value="Save Changes" onclick="setmarks3('<%=size%>','<%=sem%>','<%=subject%>')"></td>
				
				</div>
				</tr>			
				</table>
				</form>  
</div>
<%}

else
{
%>
<thead class="thead-dark">
				<tr>
<!-- rows and header wil be added dynamically-->   
<th>Sr.NO.</th><th>Enrollment NO.</th><th>Name</th><th>Mid Sem_1</th><th>Mid Sem_2</th><th>Mid Sem_3</th>
				</tr>
				</thead>

<%  for(MarksUpdate r:marks)
    {
        String mid1=r.getRoll_no()+"one";
                String mid2=r.getRoll_no()+"two";
        String mid3=r.getRoll_no()+"three";
    
%>



<tr>	  
<div class="form-group"><td><label><%=(i+1)%></label></td><td><label for="roll_no" class="success"><%=r.getRoll_no()%></label></td><td><label for="name"><%=r.getName()%></label></td><td><input type="text" class="form-control" id="<%=mid1%>" value="<%=r.getMidsem1()%>"></td><td><input type="text" class="form-control" id="<%=mid2%>" value="<%=r.getMidsem2()%>"></td><td><input type="text" class="form-control" id="<%=mid3%>" value="<%=r.getMidsem3()%>"></td></div>
</tr>

<%        }
%>
<tr class="bg-dark">
<div class="col-md-8 text-center"></div>
</div>
                </tr><tr class="bg-dark">
                <div class="col-md-8 text-center">
 <td colspan="6"><input type="button" class="btn btn-success" value="Save Changes" onclick="setmarks('<%=size%>','<%=sem%>','<%=subject%>')"></td>
				
				</div>
				</tr>			
				</table>
				
		</form>	
			
  
  </div> 

<%
}
}
}

catch(Exception e)
{
System.out.println(""+e);
}
}
%>				

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
	
	</div>
<div id="UploadMarksSuccessModal" class="modal fade"  role="dialog">
			  <div class="modal-dialog modal-md modal-dialog-centered">

				<div class="modal-content text-center">
				<div class="modal-header text-center bg-success">
				<h4 class="modal-title text-white">Success</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
				  <div class="modal-body">
					<P>Marks has been Uploaded Successfully</P>
				 </div>
		
				</div>
		
			  </div>
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