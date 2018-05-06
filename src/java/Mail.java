
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rraiy
 */
public class Mail {
    public static void main(String[] args){
        String msg="";
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
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            InternetAddress[] add = {new InternetAddress(to)};
            message.addRecipients(Message.RecipientType.TO, add);
            message.setSubject("fogot password");
            message.setText("your password  for Faculty Management System is.....\n"+"hod111");

            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com","facportal@gmail.com","fms@1234");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            // Send message  
            //Transport.send(message);
            //EmailUtil.sendEmail(session, to,"TLSEmail Testing Subject", "TLSEmail Testing Body");
            System.out.println("message sent successfully....");

        } catch (Exception e) {
            System.out.println("message can't be sended"+e);
        }
    }
}
