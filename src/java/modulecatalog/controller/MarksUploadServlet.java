/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dto.MarksUpdate;
import org.json.JSONObject;
import org.json.JSONArray;


/**
 *
 * @author HP
 */
public class MarksUploadServlet extends HttpServlet {

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
     } else{
                        RequestDispatcher rd=null;

       
       try{  
      
            String sem=(String)request.getParameter("sem");
            System.out.println("sem of upload servlet"+sem);
            String emailformarks=(String)request.getParameter("emailformarks");
            System.out.println("emailformarks:"+emailformarks);
           String email=(String)request.getParameter("email");
           String subject=(String)request.getParameter("subject");
           System.out.println("subject is:"+subject);
       String result=(String)request.getParameter("result");
           System.out.println("Values of result is:"+result);
       if(result!=null)
       {
           System.out.println("inside the result");
          String json1=request.getParameter("dat");
          String midsem=request.getParameter("midsem1");
        int mid=Integer.parseInt(midsem);
        int s=Integer.parseInt(sem);
        ArrayList<MarksUpdate> marks=new ArrayList<>();
        ArrayList<String> rollno=new ArrayList<>();
           JSONArray jsonobj=new JSONArray(json1);
           System.out.println(""+jsonobj.length());
           for(int i=0; i< jsonobj.length();i++)
           {
               MarksUpdate m=new MarksUpdate();
               m.setSubject(subject);
               m.setSem(s);
           JSONObject rec=jsonobj.getJSONObject(i);
          String label=rec.getString("label");
           m.setRoll_no(label);
           rollno.add("label");
               System.out.println(""+label);
               int mark=rec.getInt("value");
               if(mid==1)
               {
               m.setMidsem1(mark);
               }
               else if(mid==2)
               {
               m.setMidsem2(mark);
               }
               else
               {
               m.setMidsem3(mark);
               }
               System.out.println(""+marks);
               marks.add(m);
           }
           if(mid==1)
           {
               boolean ans=FacultyDAO.setMidsem1Marks(marks,mid,subject);
               System.out.println("the answer value is"+ans);
               request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule1.jsp");
           }
           else if(mid==2)
           {
               boolean ans=FacultyDAO.setMidsem2Marks(marks,mid,subject);
                request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule.jsp");
           }
           else
           {
               boolean ans=FacultyDAO.setMidsem3Marks(marks,mid,subject);
                request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule.jsp");
           }

         }
           System.out.println("down first if");
           if(sem!=null && emailformarks!=null)
           {
            int semester=Integer.parseInt(sem);
               System.out.println("here reached");
               System.out.println("email is:"+emailformarks);
               System.out.println("sem is:"+sem);
           String subjectformarks=FacultyDAO.getSubject(emailformarks,semester);
           ArrayList<String> roll_no=FacultyDAO.getRoll_no(semester);
               System.out.println("arrayList is:"+roll_no);
               System.out.println("in servlet subject:"+subjectformarks);
                      session.setAttribute("sem",sem);
                      session.setAttribute("roll_no",roll_no);         
           session.setAttribute("subjectformarks",subjectformarks);  
                   

           }      
                     
           
                 
           System.out.println("end");             
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