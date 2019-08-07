/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modulecatalog.controller;


import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modulecatalog.dao.FacultyDAO;
import modulecatalog.dao.RegistrationDao;
import modulecatalog.dao.StudentDAO;
import modulecatalog.dao.ValidateDAO;
import modulecatalog.dto.FacultyDTO;
import modulecatalog.dto.StudentDTO;
import modulecatalog.dto.UserDTO;

/**
 *
 * @author Shivam
 */
@WebServlet(name = "RegistrationControllerServlet", urlPatterns = {"/RegistrationControllerServlet"})
public class RegistrationControllerServlet extends HttpServlet {

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
        
        String username = request.getParameter("username");
        System.out.println("dfghjkl;'.ds"+username);
        String otp = request.getParameter("otp");
        String pass = request.getParameter("pass");
        String usertype = request.getParameter("usertype");
        String status = request.getParameter("status");
        System.out.println(""+otp);
                System.out.println(""+pass);
        System.out.println(""+usertype);
        System.out.println(""+status);
       

        UserDTO userDetail = new UserDTO();
        String email = username;
        if(!email.contains("com")) {
            try {
                email=RegistrationDao.getEmail(username);
                System.out.println("email recieved is :"+email);
            } 
            catch (Exception ex) {
                System.out.println(""+ex);
                ex.printStackTrace();
            }
            }
        int  OTP = 0;
        RequestDispatcher rd = null;
        try {
            if(pass == null && otp == null){
                
                System.out.println("inside pass null");
            boolean registeredUser = false;
            boolean userFound = false;
          
                System.out.println("inside otp  null");
                registeredUser = RegistrationDao.userAllReadyPresent(username);
                userFound = RegistrationDao.chechkAvailbility(username);
                System.out.println("userfound is"+userFound);
            
//            if(!email.contains("com")) {
//                email=RegistrationDao.getEmail(username);
//            }
            String name = FacultyDAO.getFacultyName(email);
            
            
            if(name == null) {
                
                name = StudentDAO.getStudentName(email);
                System.out.println("name is"+name);
            }
        if(userFound && !registeredUser) {
            System.out.println("inside otp");
            Random rnd = new Random();
            OTP = 100000+rnd.nextInt(1000000-100000);
            String host ="smtp.gmail.com" ;
            String user = "sg5708578@gmail.com";
//            String name = "shivam".toUpperCase();
            String password = "shivam@123456";
            String to = email;
                System.out.println(email);
            String from = "sg5708578@gmail.com";
            String subject = "OTP";
            String messageText = "HEY ! "+name.toUpperCase()+"  YOUR OTP IS:- "+OTP+"\nDO NOT SHARE YOUR OTP WITH ANYONE...!";
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
            System.out.println(""+host+""+user+""+password);
           transport.connect(host, user, password);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
           
            }
            
            
            request.setAttribute("OTP", OTP);
            System.out.println("otp: "+ OTP);
            request.setAttribute("email", email);
            request.setAttribute("registeredUser", registeredUser);
            request.setAttribute("userFound", userFound);
            rd=request.getRequestDispatcher("RegistrationResponse.jsp");
            
            }
            else if(pass != null) {
                userDetail.setUsername(username);
                userDetail.setUsertype(usertype);
                userDetail.setStatus(status);
                userDetail.setPassword(pass);
               
                boolean check = ValidateDAO.registerUser(userDetail);
                System.out.println("vlue of chk :"+check);
                rd=request.getRequestDispatcher("RegisterConfirm.jsp");
                request.setAttribute("check", check);
            }
            else if(otp!=null) {
                System.out.println(email + "email here is");
                FacultyDTO faculty = FacultyDAO.findFaculty(email);
                System.out.println("faculty is"+faculty.getFname());
             if(faculty.getFname()== null) {
                 System.out.println("when faculty is null");
                StudentDTO student = StudentDAO.getStudentDetails(email);
                
                request.setAttribute("student", student);
        
            }else
             {
                             request.setAttribute("faculty", faculty);
}
                
            rd=request.getRequestDispatcher("ShowDetails.jsp");    
            }
            System.out.println("h");
        } catch (Exception ex) {
            System.out.println("Exception in Register servlet " + ex);
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
