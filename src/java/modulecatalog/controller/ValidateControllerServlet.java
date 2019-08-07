/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dao.StudentDAO;
import modulecatalog.dao.ValidateDAO;
import modulecatalog.dto.UserDTO;

/**
 *
 * @author HP
 */
public class ValidateControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
                       String logout=request.getParameter("logout");
                       if(logout!=null)
            {
                
            HttpSession session=request.getSession();
            String username = (String) session.getAttribute("username");
            boolean lastLogin = ValidateDAO.setLogoutTime(username);
                System.out.println("ssssssssssssss"+lastLogin);
            session.invalidate();
            
            if(logout.equalsIgnoreCase("logout"))
            {
                response.sendRedirect("Homepage.html");
            }
            else if(logout.equalsIgnoreCase("logoutscheme"))
            {
                            response.sendRedirect("scheme.jsp");
            }
            else if(logout.equalsIgnoreCase("logoutsyllabus"))
            {
                            response.sendRedirect("syllabus.jsp");

            }
            else if(logout.equalsIgnoreCase("logoutdeveloper"))
            {
                            response.sendRedirect("developers.html");

            }
            else if(logout.equalsIgnoreCase("logoutglance"))
            {
                            response.sendRedirect("Glance.html");

            }
            else             {
                            response.sendRedirect("Contact Us.html");

            }
            
            return;
               }
            /* TODO output your page here. You may use following sample code. */
           String username=request.getParameter("username");
           String password=request.getParameter("password");
           String pass=request.getParameter("confirm1");
            System.out.println(pass);
                 RequestDispatcher rd=null;
                      String usertype=request.getParameter("usertype");
                      System.out.println("username"+username+"password"+password+"usertype"+usertype);
                 if(pass!=null)
                 {
                     try{
                         
                 if(usertype.equalsIgnoreCase("student"))
                 {
                     System.out.println("inside student chng passwrd,new pswd:"+pass);
                   UserDTO user=new UserDTO();
                          user.setUsername(username);
                          user.setPassword(pass);
                          user.setUsertype(usertype);
                          
                          boolean changed=StudentDAO.changepswd(user);
                          System.out.println("validate user changed:"+changed);
                          request.setAttribute("usertype",usertype);
                request.setAttribute("changed",changed);
                rd=request.getRequestDispatcher("changepswd.jsp");
                 }
                  if(usertype.equalsIgnoreCase("faculty"))
                 {
                   UserDTO user=new UserDTO();
                          user.setUsername(username);
                          user.setPassword(pass);
                          user.setUsertype(usertype);
                        boolean changed=FacultyDAO.changepswd(user);
                         request.setAttribute("usertype",usertype);
                request.setAttribute("changed",changed);
                rd=request.getRequestDispatcher("changepswd.jsp"); 
                 }
                     }
                     catch(Exception e)
                     {
                         System.out.println("Exception is:"+e);
                         e.printStackTrace();
                     }
            finally
            {
            rd.forward(request,response);
            }
                 }
           if(username!=null && password!=null)
               
           {
                 request.setAttribute("username",username);
               System.out.println("creating user");
                               UserDTO user=new UserDTO();
                          user.setUsername(username);
                          System.out.println("usernameijdjds"+user.getUsername());
                          user.setPassword(password);
                          user.setUsertype(usertype);
               try{
                
                boolean result=ValidateDAO.validateUsers(user);
                 String time_stamp = ValidateDAO.getLastLoginTime(username);
                   System.out.println(""+result);
                   request.setAttribute("username",username);
                   request.setAttribute("usertype",usertype);
                   request.setAttribute("password",password);
                   request.setAttribute("result",result);
                   request.setAttribute("time_stamp", time_stamp);
              rd=request.getRequestDispatcher("validate.jsp");
               }
               catch(Exception e)
               {
                   System.out.println(""+e);
                   e.printStackTrace();
               }
                 finally
            {
            rd.forward(request,response);
            }
           }
        }catch(SQLException sq) {
            sq.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
