/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class DownloadCalendar extends HttpServlet {

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
        try{
            /* TODO output your page here. You may use following sample code. */
            String file=request.getParameter("file");
            int f=Integer.parseInt(file);
            if(f==1)
            {
            String filepath="F:\\Minor\\web\\files"+"\\"+"acal1.pdf";
             
            /* TODO output your page here. You may use following sample code. */
            

        
        

        FileInputStream filetodownload = new FileInputStream(filepath);
        ServletOutputStream out=response.getOutputStream();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename = "+"acal1.pdf");
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
            else if(f==2)
            {
                String filepath="C:\\Users\\HP\\Documents\\NetBeansProject\\Minor\\web\\files"+"\\"+"acal2.pdf";
             
            /* TODO output your page here. You may use following sample code. */
            

        
        

        FileInputStream filetodownload = new FileInputStream(filepath);
        ServletOutputStream out=response.getOutputStream();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename = "+"acal2.pdf");
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
            else if(f==3)
            {
                String filepath="C:\\Users\\HP\\Documents\\NetBeansProject\\Minor\\web\\files"+"\\"+"acal3.pdf";
             
            /* TODO output your page here. You may use following sample code. */
            

        
        

        FileInputStream filetodownload = new FileInputStream(filepath);
        ServletOutputStream out=response.getOutputStream();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename = "+"acal3.pdf");
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
            else
            {
            String filepath="C:\\Users\\HP\\Documents\\NetBeansProject\\Minor\\web\\files"+"\\"+"acal4.pdf";
             
            /* TODO output your page here. You may use following sample code. */
            

        
        

        FileInputStream filetodownload = new FileInputStream(filepath);
        ServletOutputStream out=response.getOutputStream();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename = "+"acal4.pdf");
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
        }
        catch(Exception e)
        {
            System.out.println(""+e);
        e.printStackTrace();}
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
