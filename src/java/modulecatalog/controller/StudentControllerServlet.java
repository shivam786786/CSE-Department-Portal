/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modulecatalog.dao.StudentDAO;
import modulecatalog.dto.FileDTO;
import modulecatalog.dto.QueryDTO;
import modulecatalog.dto.StudentDTO;
import modulecatalog.dto.SubjectsDTO;

/**
 *
 * @author HP
 */
@WebServlet(name = "StudentControllerServlet", urlPatterns = {"/StudentControllerServlet"})
public class StudentControllerServlet extends HttpServlet {

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
     return;
     } 
      else
            {        
                RequestDispatcher rd=null;
                System.out.println("hereeee");
                       long ms=session.getLastAccessedTime();
                       Date dt=new Date(ms);
                       System.out.println("in sudent controller servlet the last accesd tym"+dt);
                       

      try{ 
          String replyModal = request.getParameter("replyModal");
          String answer = request.getParameter("id");
          String querysubject = request.getParameter("querysubject");
          System.out.println(replyModal);
          String topic = request.getParameter("topic");
           String question = request.getParameter("question");    
           String subject1=(String)request.getParameter("subject1");
           String name=(String)request.getParameter("name");
           
                   
                   String subject=(String)request.getParameter("subject");
                   System.out.println("subject:"+subject);
                   System.out.println("before else");
                   if(answer != null) {
                     String sname = StudentDAO.getStudentNameByUsername(username);
                       QueryDTO query = StudentDAO.getQueryDetails(answer);
                       if(query.getQuestion() != null) {
                           request.setAttribute("query", query);
                           rd=request.getRequestDispatcher("showQueryDetails.jsp");
                       }
                   }
                   else if(replyModal!= null && querysubject!=null) {
                       
                       ArrayList<QueryDTO> query=StudentDAO.getQueryTopic(replyModal,querysubject);
                       request.setAttribute("query", query);
                                                  rd = request.getRequestDispatcher("QueryTable.jsp");

                   }
                   else if(subject!=null)
                   {
                  ArrayList<FileDTO> file=StudentDAO.getSubjectFiles(subject);
                    request.setAttribute("file",file);
                     rd = request.getRequestDispatcher("ArrayListpdf.jsp");
                   }
                              else if(topic!= null) {
                                  System.out.println("");
                       boolean result = StudentDAO.askQuery(topic, name, question, subject1);
                       if(result) {
                           rd = request.getRequestDispatcher("Query.jsp");
                           request.setAttribute("result", result);
                       }
                   }
                
             

                   else{
                   StudentDTO student=StudentDAO.findStudent(username);
                   int sem=student.getSem();
                   SubjectsDTO subjects=StudentDAO.getSubjects(sem);
                   request.setAttribute("student",student);
                   request.setAttribute("subjects",subjects);
                   request.setAttribute("dt", dt);
                   System.out.println("in else");
                    rd = request.getRequestDispatcher("StudentPanel.jsp");
                   }
                  
                   System.out.println("yes");      
           }
               catch(Exception e)
           {
               System.out.println(""+e);
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
