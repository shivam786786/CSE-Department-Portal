/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dao.StudentDAO;
import modulecatalog.dao.ValidateDAO;

/**
 *
 * @author Shivam
 */
public class ForgotControllerServlet extends HttpServlet {

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
                 String email = request.getParameter("email");
                 String newPass = request.getParameter("newPass");
                 RequestDispatcher rd = null;
                 System.out.println("inside forgot servlet : "+email);
                 System.out.println("inside forgot "+newPass);
                 try {
                      String roll_no = StudentDAO.getEnrollmentNo(email);
                      String username;
                      username=email;
                      System.out.println(username);
                 if(roll_no!=null) {
                     username = roll_no;
                     System.out.println(username);
                 }
                 String name = FacultyDAO.getFacultyName(email);
            if(name == null) {
              name = StudentDAO.getStudentName(email);
           
            }
              
            int OTP = 0;
            boolean findUser = false;
            if(newPass == null)
                 findUser = ValidateDAO.findUser(username);
                     System.out.println(findUser);
            if(findUser) {
                     Random rnd = new Random();
            OTP = 100000+rnd.nextInt(1000000-100000);
            String host ="smtp.gmail.com" ;
            String user = "sg5708578@gmail.com";
//            String name = "shivam".toUpperCase();
            String pass = "shivam@123456";
            String to = email;
            System.out.println(username+"mmm"+ email);
            System.out.println("hello");
            String from = "sg5708578@gmail.com";
                System.out.println(from);
            String subject = "OTP";
                System.out.println("subject");
                System.out.println("subject");
                System.out.println("subject");
            String messageText = "HEY ! "+name.toUpperCase()+"  YOUR OTP IS: "+OTP+"\nDO NOT SHARE YOUR OTP WITH ANYONE";
            System.out.println(messageText);
            System.out.println("subject");
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            System.out.println(msg.toString());
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            System.out.println(address.toString());
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");  
            }
             System.out.println(OTP);
            if(newPass!=null) {
                boolean result =ValidateDAO.changePassword(username, newPass);
                request.setAttribute("result", result);
                request.setAttribute("name", name);
                rd = request.getRequestDispatcher("Forgot.jsp");
                
            }
            else { 
                rd=request.getRequestDispatcher("Otp.jsp");
                request.setAttribute("OTP", OTP);
                request.setAttribute("findUser", findUser);
            }
        } catch(SQLException | MessagingException ex) {
             System.out.println("Exception in Forgot servlet " + ex);
            ex.printStackTrace();       
           }
                 finally {
             rd.forward(request, response);
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
