/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dto.FacultyDTO;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author HP
 */
@WebServlet(name = "ProfileFacultyData", urlPatterns = {"/ProfileFacultyData"})
public class ProfileFacultyData extends HttpServlet {

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
           
              HttpSession session=request.getSession();
            String username=(String)session.getAttribute("username"); 
            System.out.println("reached update faculty servlet");
            System.out.println("uname:"+username);
            if(username==null)
     {
         
     session.invalidate();
     response.sendRedirect("Accessedenied.html");
     return;
     }    
        RequestDispatcher rd=null;
        try {
        ServletFileUpload sfu=new ServletFileUpload(new DiskFileItemFactory());
        List<FileItem> multiparts = sfu.parseRequest(new ServletRequestContext(request));
            System.out.println("multiparts:"+multiparts);
	System.out.println("Size is :"+multiparts.size());	
        ArrayList<String> objValues=new ArrayList<>();
         for(FileItem item : multiparts){
		
		if (item.isFormField()) {
               
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                                    System.out.println("inside if");
                    System.out.println(fieldName+":"+fieldValue);
                    objValues.add(fieldValue);
                
            } else {
                
                String fieldName = item.getFieldName();
                //String fileName = new File(item.getName()).getName();
                String fileName=item.getName();
                    System.out.println("filenm:"+fileName);
                    if(fileName=="")
                {
                    try{
         String getphoto=FacultyDAO.getPhoto(username);
                        System.out.println("photo="+getphoto);
                    
                                        objValues.add(getphoto);

                        continue;
                    }catch(Exception e)
                    {
                        System.out.println(""+e);
                    }
                }
               
                objValues.add(fileName);
                    System.out.println("inside else");
                    System.out.println("above");
                System.out.println(fieldName+":"+fileName);
                InputStream fileContent = item.getInputStream();
                System.out.println("content:"+fileContent);
                
                String imagePath="F:\\Minor\\web\\images"; 
                System.out.println("path is:"+imagePath);
                File myFile=new File(imagePath+"/"+fileName);
                 System.out.println("File will be saved at:"+myFile.getAbsolutePath());
                    System.out.println("File created:"+myFile.createNewFile());
                item.write(myFile);
                System.out.println("File saved at:"+myFile.getAbsolutePath());
                
            }
                    
                    
		} 
         FacultyDTO obj=new FacultyDTO();
         
         obj.setPhoto(objValues.get(0));
         obj.setFname(objValues.get(1));
         int sem=Integer.parseInt(objValues.get(2));
         obj.setSem(sem);
         obj.setEmail(objValues.get(3));
         obj.setMob(objValues.get(4));
         obj.setAddress(objValues.get(5));
         
         boolean ans=FacultyDAO.updateFaculty(obj);
         request.setAttribute("ans", ans);
         rd=request.getRequestDispatcher("addmodule.jsp");
               }
        
	catch (Exception ex) {
                rd=request.getRequestDispatcher("showexception");
                request.setAttribute("ex", ex);
                System.out.println("Exception:"+ex);
                ex.printStackTrace();
            }
        finally
        {
            rd.forward(request, response);
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
