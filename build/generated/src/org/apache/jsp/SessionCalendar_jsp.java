package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modulecatalog.dto.FileDTO;
import modulecatalog.dao.ValidateDAO;
import modulecatalog.controller.ValidateControllerServlet;
import java.util.ArrayList;

public final class SessionCalendar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> <span id=\"homename\"></span>\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("    <!--<script src=\"js/editprofile.js\"></script>-->\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/customstyle.css\">\n");
      out.write("\t\n");
      out.write("    <title>Document</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("     <div class=\"container-fluid padding\">\n");
      out.write("         <div class=\"row text-center text-light jumbotron bg-dark\">\n");
      out.write("                <div class=\"col-12\">\n");
      out.write("                    <h1 class=\"\">UNIVERSITY INSTITUE OF TECHNOLOGY, RGPV</h1>\n");
      out.write("                    <p  class=\"lead text-center\" >Narshingarh Bypass Road Near Gandhi Nagar,Bhopal(M.P.)</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        <nav class =\"navbar navbar-expand-lg navbar-light bg-light sticky-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <a class = \"navbar-brand\"><img src=\"images/logo.jpg\" style=\"width: 60px; height: 60px\"><strong class=\"text-wrap\" style=\"width: 6rem\">Department of Computer Science & Engineering</strong></a>\n");
      out.write("                <button class = \"navbar-toggler\" type = \"button\" data-toggle=\"collapse\" data-target=\"#navbarResp\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id = \"navbarResp\">\n");
      out.write("                    <ul class=\"navbar-nav ml-auto\">\n");
      out.write("                        <li class=\"nav-item active\">\n");
      out.write("                            <a class=\"nav-link text-primary mr-2 d-inline\" href=\"Homepage.html\" role=\"button\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link text-warning mr-2 d-inline dropdown-toggle\" href=\"#\" role=\"button\" data-toggle=\"dropdown\">About</a>\n");
      out.write("                            <div class=\"dropdown-menu\">\n");
      out.write("                                <a href=\"Glance.html\" class=\"dropdown-item\">At A Glance</a>\n");
      out.write("                                <a href=\"developers.html\" class=\"dropdown-item\">Developers</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link text-danger mr-2 d-inline dropdown-toggle\" href=\"#\" role=\"button\" data-toggle=\"dropdown\">Community</a>\n");
      out.write("                            <div class=\"dropdown-menu\">\n");
      out.write("                                    <a href=\"http://uitrgpv.ac.in/Index.aspx\" class=\"dropdown-item\">UIT_RGPV</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link text-info mr-2 d-inline dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\">Time Table</a>\n");
      out.write("                            <div class=\"dropdown-menu\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-1</a>\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-2</a>\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-3</a>                       \n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-4</a>\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-5</a>\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-6</a>\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-7</a>\n");
      out.write("                                <a href=\"#\" class=\"dropdown-item\">SEMESTER-8</a>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link text-dark mr-2  d-inline dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\">Syllabus & Scheme</a>\n");
      out.write("                            <div class=\"dropdown-menu\">\n");
      out.write("                                <a href=\"scheme.jsp\" class=\"dropdown-item\">Syllabus</a>\n");
      out.write("                                <a href=\"syllabus.jsp\" class=\"dropdown-item\">Schemes</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link text-success d-inline text-wrap\" href=\"Contact Us.html\" role=\"button\">Contact Us</a>\n");
      out.write("                        </li>\n");
      out.write("                       <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link text-danger d-inline text-wrap\" href=\"Registration.html\" role=\"button\">New User?</a>\n");
      out.write("                        </li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("           \n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("            \n");
      out.write("                <div class=\"col-12\">\n");
      out.write("                    <h1 class=\"\">Academic Calendar</h1>\n");
      out.write("                         \n");
      out.write("            </div>\n");
      out.write("                    \t\t\t<form method=\"get\">\n");
      out.write("\t\t\t\n");
      out.write("\t<table  class=\"table table-bordered table-striped table-hover \" >\n");
      out.write("\t<thead class=\"thead-dark\">\n");
      out.write("           \n");
      out.write(" <br>\n");
      out.write(" \n");
      out.write(" <div class=\"text-center\">\n");
      out.write("<div class=\"col-xs-2\">\n");
      out.write("    \n");
      out.write("</div></div>\n");
      out.write(" \t\t\t\t\n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write(" \n");
      out.write("        </tbody>\n");
      out.write("<div class=\"col-md-8 text-center\">\n");
      out.write("\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("    <td>1</td><td><a href=\"DownloadCalendar?file=1\">Academic Calendar for Odd Semester of Academic Session 2017-2018</td>\n");
      out.write(" </tr>   \n");
      out.write("<tr>\n");
      out.write("    <td>2</td><td><a href=\"DownloadCalendar?file=2\">Academic Calendar for Even Semester of Academic Session 2017-2018</td>\n");
      out.write(" </tr>   \n");
      out.write("      <tr>\n");
      out.write("    <td>3</td><td><a href=\"DownloadCalendar?file=3\">Academic Calendar for Odd Semester of Academic Session 2018-2019</td>\n");
      out.write(" </tr>   \n");
      out.write("      <tr>\n");
      out.write("    <td>4</td><td><a href=\"DownloadCalendar?file=4\">Academic Calendar for Even Semester of Academic Session 2018-2019</td>\n");
      out.write(" </tr>   \n");
      out.write("            \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("   \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</table>\n");
      out.write("</form>\n");
      out.write("     </div>      \n");
      out.write("      \n");
      out.write("        \n");
      out.write("    <!--Using card for notice-->\n");
      out.write("    <script src=\"js/jquery3.3.1.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script> \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
