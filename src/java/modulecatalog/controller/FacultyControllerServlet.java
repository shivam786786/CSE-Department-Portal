/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dto.FacultyDTO;
import modulecatalog.dto.QueryDTO;

/**
 *
 * @author HP
 */
@WebServlet(name = "FacultyControllerServlet", urlPatterns = {"/FacultyControllerServlet"})
public class FacultyControllerServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession session=request.getSession();
            String username=(String)session.getAttribute("username");   
            System.out.println("uname:"+username);
       if(username==null)
     {
         System.out.println("here");
     session.invalidate();
     response.sendRedirect("Accessedenied.html");
     } 
     else
            {        
                RequestDispatcher rd=null;
 
      try{ 
          System.out.println("above sem");
          String queryReply=request.getParameter("queryReply");
          String reply = request.getParameter("reply");
          System.out.println("+++++"+reply);
          System.out.println("queryReply"+queryReply);
          String sem=request.getParameter("sem");
//          System.out.println("below"+sem);
          String question = request.getParameter("question");
          String email=(String)request.getParameter("email");
          String id = (String) request.getParameter("id");
          System.out.println("below eamil:"+email);
          if(id != null) {
              QueryDTO query = FacultyDAO.fetchQueryById(id);
              if(query != null) {
                  request.setAttribute("query", query);
                  rd = request.getRequestDispatcher("QueryReplyModal.jsp");
              }
          }
          else if(reply != null && question != null) {
              String name = FacultyDAO.getFacultyName(username);
              System.out.println("nameeeeeeeeeeeeeeeeeeeee: " + name);
              boolean result = FacultyDAO.insertReply(reply, name, question);
//              System.out.println(result+ "--------");
              rd = request.getRequestDispatcher("ReplyAnswer.jsp");
              request.setAttribute("result",result);
          }
          else if(queryReply!=null)
          {
              
          ArrayList<String> sub=FacultyDAO.getsubjectonusername(username);
             
                  if(!sub.isEmpty()) {
                      System.out.println("inside sub size");
                      ArrayList<QueryDTO> queryData = FacultyDAO.getQueries(sub);
                      System.out.println(queryData);
                       request.setAttribute("queryData", queryData);
                       rd=request.getRequestDispatcher("QueryReply.jsp");
                  }
          
          }
          else if(sem!=null && email!=null)
          {
              int semester=Integer.parseInt(sem);
              System.out.println("here reached");
           String subject=FacultyDAO.getSubject(email,semester);
           request.setAttribute("subject",subject);  
            rd = request.getRequestDispatcher("ArrayListpdf.jsp");

          }
          else{
                    System.out.println("reached");
                   FacultyDTO faculty=FacultyDAO.findFaculty(username);
                   ArrayList<Integer> semester = FacultyDAO.getSem(username);
                   request.setAttribute("faculty",faculty);
                   request.setAttribute("semester", semester);
                   System.out.println("qwertyuio;");
                                 

                   rd = request.getRequestDispatcher("FacultyPanel.jsp");
          }       
           }
               catch(Exception e)
           {
               e.printStackTrace();
           request.setAttribute("exception",e);
           rd=request.getRequestDispatcher("showexception.jsp");
           }
           finally
        {
           rd.forward(request,response);
        }
        }               
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
