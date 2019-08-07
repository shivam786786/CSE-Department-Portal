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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dto.MarksUpdate;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author HP
 */
public class ViewResultServlet extends HttpServlet {

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
       try
       {
           String uname=(String)request.getParameter("emailforresult");
           String seme=(String)request.getParameter("sem");
           String result=(String)request.getParameter("result");
           String subject=(String)request.getParameter("subject");
           int sem=Integer.parseInt(seme);
           if(uname!=null)
           {
           String subjectforresult=FacultyDAO.getSubject(username, sem);
              session.setAttribute("semforresult",seme);
              session.setAttribute("subjectforresult",subjectforresult); 
              session.setAttribute("nameforresult",uname);
            
           }
           if(result!=null)
           {
            System.out.println("inside the result");
          String json1=request.getParameter("dat");
               System.out.println(""+json1);
        ArrayList<MarksUpdate> marks=new ArrayList<>();
        
           JSONArray jsonobj=new JSONArray(json1);
           System.out.println(""+jsonobj.length());
           for(int i=0; i< jsonobj.length();i++)
           {
               MarksUpdate m=new MarksUpdate();
               m.setSubject(subject);
               m.setSem(sem);
           JSONObject rec=jsonobj.getJSONObject(i);
          String label=rec.getString("label");
          m.setRoll_no(label);
               System.out.println(""+label);
               int mark1=rec.getInt("value1");
               m.setMidsem1(mark1);
               System.out.println("midsem1"+mark1);
                int mark2=rec.getInt("value2");
               m.setMidsem2(mark2);
               System.out.println("midsem2"+mark2);
                int mark3=rec.getInt("value3");
               m.setMidsem3(mark3);
               System.out.println("midsem3"+mark3);
               System.out.println("qwertyuiokjhgghjiuytfghnjmnb");
           System.out.println(""+m.getSubject()+""+m.getSem()+""+m.getRoll_no()+""+m.getMidsem1()+""+m.getMidsem2()+""+m.getMidsem3());
               marks.add(m);
           }
             
           boolean ans=FacultyDAO.editMarks(marks,subject);
           session.setAttribute("ans", ans);
              request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule.jsp");
           }
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
            System.out.println("recieved");
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
