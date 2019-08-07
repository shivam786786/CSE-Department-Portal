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
public class EditMarksServlet extends HttpServlet {

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
           String midsem=request.getParameter("midsem");
           String sem=request.getParameter("sem");
           String subject=request.getParameter("subject");
           int s=Integer.parseInt(sem);
           int mid=Integer.parseInt(midsem);
             ArrayList<MarksUpdate> marks=new ArrayList<>();

           if(mid==1){
             String json1=request.getParameter("dat");
               System.out.println(""+json1);
       
        
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
               System.out.println(""+label);
               int mark1=rec.getInt("value");
               m.setMidsem1(mark1);
               System.out.println("midsem1"+mark1);
              
               System.out.println("qwertyuiokjhgghjiuytfghnjmnb");
System.out.println(""+m.getSubject()+""+m.getSem()+""+m.getRoll_no()+""+m.getMidsem1());
               marks.add(m);
           }
             boolean ans=FacultyDAO.editMid1Marks(marks,subject);
           session.setAttribute("ans", ans);
              request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule.jsp");
           }
             if(mid==2){
             String json1=request.getParameter("dat");
               System.out.println(""+json1);
       
        
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
               System.out.println(""+label);
               int mark2=rec.getInt("value");
               m.setMidsem2(mark2);
               System.out.println("midsem1"+mark2);
              
               System.out.println("qwertyuiokjhgghjiuytfghnjmnb");
System.out.println(""+m.getSubject()+""+m.getSem()+""+m.getRoll_no()+""+m.getMidsem2());
               marks.add(m);
           }
             boolean ans=FacultyDAO.editMid2Marks(marks,subject);
           session.setAttribute("ans", ans);
              request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule.jsp");
           }
             if(mid==3){
             String json1=request.getParameter("dat");
               System.out.println(""+json1);
       
        
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
               System.out.println(""+label);
               int mark1=rec.getInt("value");
               m.setMidsem3(mark1);
               System.out.println("midsem1"+mark1);
              
               System.out.println("qwertyuiokjhgghjiuytfghnjmnb");
System.out.println(""+m.getSubject()+""+m.getSem()+""+m.getRoll_no()+""+m.getMidsem3());
               marks.add(m);
           }
             boolean ans=FacultyDAO.editMid3Marks(marks,subject);
           session.setAttribute("ans", ans);
              request.setAttribute("ans", ans);
               rd=request.getRequestDispatcher("addmodule.jsp");
           }
           
       }
       catch(Exception e)
       {
           System.out.println("Exception is:+"+e);
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
