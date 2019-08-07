/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;


import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modulecatalog.dao.StudentDAO;
import modulecatalog.dto.FileDTO;

/**
 *
 * @author HP
 */
@WebServlet(name = "FileDownloadServlet", urlPatterns = {"/FileDownloadServlet"})
public class FileDownloadServlet extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
        String id=(String)request.getParameter("id");
            System.out.println("id is:"+id);
        
        FileDTO f=StudentDAO.getFiles(id);
        String filename=f.getFilename();
        String filepath=f.getFilepath()+"\\"+filename;
            System.out.println("filename"+filename);
            System.out.println("filepath"+filepath);

        FileInputStream filetodownload = new FileInputStream(filepath);
        ServletOutputStream out=response.getOutputStream();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename = "+filename);
        response.setContentLength(filetodownload.available());
        int c;
                    System.out.println("filepath"+filepath);

        while((c=filetodownload.read()) !=-1)
        {
                        

        out.write(c);
        } 
        out.flush();
        out.close();
        filetodownload.close();
        }
   
        
        catch(Exception e)
        {
            System.out.println("exception:"+e);
            e.printStackTrace();
        }
        finally
        {
            }     
            /* TODO output your page here. You may use following sample code. */
    
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
