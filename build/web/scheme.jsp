<%@page import="modulecatalog.dto.CSEFileDTO"%>
<%@page import="modulecatalog.dto.FileDTO"%>
<%@page import="modulecatalog.dao.ValidateDAO"%>
<%@page import="modulecatalog.controller.ValidateControllerServlet"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <span id="homename"></span>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/editprofile.js"></script>
	<link rel="stylesheet" href="css/customstyle.css">
	
    <title>Document</title>
</head>
<body>
    <div class="container-fluid clearfix">
        <nav class ="navbar navbar-expand-lg navbar-light bg-light sticky-top">
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
    </div>
    <%
    ArrayList<CSEFileDTO> file=ValidateDAO.getScheme();
    int i=0;
    %>
  <div class="container-fluid padding">
            <div class="row text-center text-light jumbotron bg-dark">
                <div class="col-12">
                    <h1 class="">Files Will Be Uploaded For Programme:<strong>B.E</strong></h1>
                         </div>
            </div>
                    			<form method="get">
			
	<table  class="table table-bordered table-striped table-hover " >
	<thead class="thead-dark">
           
 <br>
 <label class="text-danger"> <h4>-Download schemes for Sem from Here:</h4></label>
 <div class="text-center">
<div class="col-xs-2">
    
</div></div>
 				
 


</thead>
<tbody>
 
        </tbody>
<div class="col-md-8 text-center">
<%
for(CSEFileDTO f:file)
{
%>

<tr>
    <td><%=(i+1)%></td><td><a href="FileDownload?scheme=<%=f.getFile()%>"><%=f.getFile()%></td>
 </tr>   
        <%
            i++;
        }
        %>






   


</div>
</table>
</form>
           
      </div>
    <!--Using card for notice-->
    <script src="js/jquery3.3.1.js"></script>
    <script src="js/bootstrap.min.js"></script> 
</body>
</html>
