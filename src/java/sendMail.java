/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rraiy
 */
public class sendMail extends HttpServlet {

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
        String title = request.getParameter("title");
        String subject = request.getParameter("sub");
        String data = request.getParameter("desc");
        
        Connection con = Snippet.getConnection();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-YYYY");
        LocalDate localDate = LocalDate.now();
        String date  = dtf.format(localDate).toUpperCase();
        
        String str = "insert into notice(ni_id,title,subject,data,senddate) values(notice_id.nextval,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(str);
            ps.setString(1, title);
            ps.setString(2, subject);
            ps.setString(3, data);
            ps.setString(4, date);
            ps.executeUpdate();
        } catch (SQLException ex) {}
        
        
        String to = "rcbraiyani@gmail.com";
        String from = "facportal@gmail.com";
        Session session;
        Properties props;

        props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.required", "true");

        java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        session = Session.getDefaultInstance(props, null);
        session.setDebug(false);

        try {
            String sql = "select email from faculty where f_id!=?";
            PreparedStatement ps1;
            ps1 = con.prepareStatement(sql);
            ps1.setString(1,request.getParameter("mail"));
            ResultSet rs = ps1.executeQuery();
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            message.setText(title.toUpperCase()+"\n"+data);
            
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com","facportal@gmail.com","fms@1234");
            while(rs.next()){
                to = rs.getString("email");    
                InternetAddress[] add = {new InternetAddress(to)};
                message.addRecipients(Message.RecipientType.TO, add);               

                // Send message  
                transport.sendMessage(message, message.getAllRecipients());
            }
               
                InternetAddress[] add = {new InternetAddress("rcbraiyani@gmail.com")};
                message.addRecipients(Message.RecipientType.TO, add);               

                // Send message  
                transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {}
        response.sendRedirect("notice.jsp");
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
