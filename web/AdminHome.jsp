<%@page errorPage="errorpage.jsp" contentType="text/html"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Site Administration | Dashboard</title>
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/custom.css" rel="stylesheet">
</head>
<body>
    <%
        String username = (String)session.getAttribute("username");
        if(username == null){
            session.invalidate();
            response.sendRedirect("accessdenied.html");
            return;
        }
    %>
    <nav class="navbar navbar-default hidden-xs">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" id="brand">Site Administration</a>
        </div>
        <div class="container-fluid" id="lg-header">
            <div class="nav navbar-right">
                <span class="text-uppercase">Welcome, <strong id="admin"><a href="#" class="link" data-target="#adminProfile" data-toggle="modal"><%= session.getAttribute("username")%></a><strong>.</span>
                <a href="index.html" class="text-uppercase link">View Site</a> /
                <a href="Email.jsp" class="text-uppercase link">Send Mail</a> /  
                <a href="#" class="text-uppercase link"  data-target="#cngPassModal" data-toggle="modal">Change Password</a> /
                <a href="ValidateControllerServlet?logout=logout" class="text-uppercase link">Logout</a>
            </div>
        </div>
    </nav>
    <nav class="navbar navbar-default navbar-fixed visible-xs">
        <div class="navbar-header">
            <a class="navbar-brand " href="#" id="brand">Site Administration</a>
            <button type="button" class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="#" class="link">View Site</a></li>
                <li><a href="Email.jsp" class="link">Send Mail</a></li>
                <li><a href="#" class="link" data-target="#cngPassModal" data-toggle="modal">Change Password</a></li>
                <li><a href="ValidateControllerServlet?logout=logout" class="link">Logout</a></li>
            </ul>
        </div>
    </nav>
    
    <header id="header">
            <div class="row">
                <div class="col-md-10">
                    <h3 id="header-text"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> &nbsp;Dashboard  <small>Manage Your Site</small></h3>
                </div>
            </div>
    </header>

    <section id="breadcrumb">
        <div class="container">
            <ol class="breadcrumb">
                <li class="active">Dashboard</li>
            </ol>
        </div>
    </section>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-6">
                <div class="table-responsive">
                    <table class="table">
                        <caption>
                            <a href="">AUTHENTICATION AND AUTHORIZATION</a>
                        </caption>
                        <tbody>
                        <tr>
                            <th>Users</th>
                            <td  class="text-right">
                                <a href="AddUser.jsp">
                                    <span class="glyphicon glyphicon-plus h4"> Add</span>
                                </a>
                                &nbsp;&nbsp;
                                <a href="ChangeUser.jsp">
                                    <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-responsive">
                        <table class="table">
                            <caption>
                                    <a href="">USER AND DEPARTMENT DATA</a>
                            </caption>
                            <tbody>
                            <tr>
                                <th>Faculty</th>
                                <td  class="text-right">
                                    <a href="AddFaculty.jsp">
                                        <span class="glyphicon glyphicon-plus h4"> Add</span>
                                    </a>
                                    &nbsp;&nbsp;
                                    <a href="ChangeFaculty.jsp">
                                        <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>Students</th>
                                <td  class="text-right">
                                    <a href="AddStudent.jsp">
                                        <span class="glyphicon glyphicon-plus h4"> Add</span>
                                    </a>
                                    &nbsp;&nbsp;
                                    <a href="ChangeStudent.jsp">
                                        <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>Marks</th>
                                <td  class="text-right">
                                    <a href="AddMarks.jsp">
                                        <span class="glyphicon glyphicon-plus h4"> Add</span>
                                    </a>
                                    &nbsp;&nbsp;
                                    <a href="ChangeMarks.jsp">
                                        <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>Subject</th>
                                <td  class="text-right">
                                    <a href="AddSubject.jsp">
                                        <span class="glyphicon glyphicon-plus h4"> Add</span>
                                    </a>
                                    &nbsp;&nbsp;
                                    <a href="ChangeSubject.jsp">
                                        <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                    </a>
                                </td>
                            </tr>
<!--                            <tr>
                                <th>Query</th>
                                <td  class="text-right">
                                     <a href="#">
                                        <span class="glyphicon glyphicon-plus h4"> Add</span>
                                    </a> 
                                    &nbsp;&nbsp;
                                    <a href="#">
                                        <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                    </a>
                                </td>
                            </tr>-->
                          </tbody>
                        </table>
                    </div>

                    <div class="table-responsive">
                            <table class="table">
                                <caption>
                                    <a href="#">FILE UPLOADS</a>
                                </caption>
                                <tbody>
                                <tr>
                                    <th>Notices</th>
                                    <td  class="text-right">
                                        <a href="AddFiles.jsp">
                                            <span class="glyphicon glyphicon-plus h4"> Add</span>
                                        </a>
                                        &nbsp;&nbsp;
                                        <a href="#">
                                            <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Syllabus and Schemes</th>
                                    <td  class="text-right">
                                        <a href="AddFiles.jsp">
                                            <span class="glyphicon glyphicon-plus h4"> Add</span>
                                        </a>
                                        &nbsp;&nbsp;
                                        <a href="#">
                                            <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                        </a>
                                    </td>
                                    </tr>
                                    <tr>
                                        <th>Time Tables</th>
                                        <td  class="text-right">
                                            <a href="AddFiles.jsp">
                                                <span class="glyphicon glyphicon-plus h4"> Add</span>
                                            </a>
                                            &nbsp;&nbsp;
                                            <a href="#">
                                                <span class="glyphicon glyphicon-pencil h4"> Change</span>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        
             </div>
            <div >
            <div class="col-xs-12 col-md-4">
                    <div class="container-fluid" id="recent-actions-box">
                        <h3 class="page-header">
                            Recent Actions
                        </h3>
                        <span id="recent-actions-text">
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        Tempore incidunt omnis ut amet iure cumque ullam nemo quos quod totam ratione eligendi eaque,
                        quo quaerat voluptas, natus aliquid culpa atque.
                        </span> 
                     </div>
            </div>
            </div>
        </div>
    </div>

    <!-- Change Password Modal -->
    <div class="modal" id="cngPassModal" tabindex="-1">
        <div class="modal-dialog modal-sm" >
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" >&times;</button>
                    <h4 class="modal-title">Change Password</h4>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="form-group">
                            <label for="oldPass">Old Password</label>
                            <input class="form-control" type="password" id="oldPass" required/>
                        </div>
                        <div class="form-group">
                            <label for="newPass">New Password</label>
                            <input class="form-control" type="password" id="newPass" required/>
                        </div>
                        <div class="form-group">
                            <label for="confPass">Confirm New Password</label>
                            <input class="form-control" type="password" id="confPass" required/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <span id="passcngresult"></span>
                    <button class="btn btn-primary btn-sm" onclick="changeAdminPassword()">Change</button>
 <button class="btn btn-primary btn-sm" data-dismiss="modal" >Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End of change password modal-->     

    
    
    <!-- Admin profile modal-->
    <div class="modal" id="adminProfile" tabindex="-1">
        <div class="modal-dialog modal-sm" >
            <div class="modal-content">
                <div class="modal-body ">
                    <div class="card">
                        <div class="row">
                            <div class="col-xs-12">
                                 <img class="card-img-top img-fluid" src="img/admin.png"  alt="Card image cap">
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Admin Profile</h4>
                            <form action="">
                                <div class="form-group card-text">
                                    <label for="name">Name</label>
                                    <input class="form-control" type="text" id="name" value="<%out.println(session.getAttribute("adminName"));%>" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input class="form-control" type="email" id="email" value="<%out.println(session.getAttribute("email"));%>" required/>
                                </div>
                                <div class="form-group">
                                    <label for="contact">Contact No</label>
                                    <input class="form-control" type="text" id="contact" value="<%out.println(session.getAttribute("contact"));%>" required/>
                                </div>
                                <div class="form-group">
                                    <label for="add">Address</label>
                                    <input class="form-control" type="text" id="add" value="<%out.println(session.getAttribute("address"));%>"  required/>
                                </div>
                            </form> 
                      </div>
                    
                  </div>
                </div>
                <div class="modal-footer">
                    <span id="saveresult"></span>
                    <button class="btn btn-primary btn-sm" onclick="saveAdminDetails()">Save</button>
                    <button class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<!-- End of admin profile modal-->
        <script src="js/Admin.js"></script>

    <script src="js/jquery3.3.1.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
