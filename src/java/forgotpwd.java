

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class forgotpwd
 */
@WebServlet("/forgotpwd")
public class forgotpwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotpwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con = Snippet.getConnection();
		String sql = "Select * from faculty where email = ?";
		PreparedStatement ps1;
		try {
			ps1 = con.prepareStatement(sql);
			ps1.setString(1,request.getParameter("mail"));
			ResultSet rs = ps1.executeQuery();
			if(rs.next()) {
                            if(rs.getString("seq_q_a").equals(request.getParameter("sq")+"_"+request.getParameter("ans"))) {
                                String to = request.getParameter("mail");
                                //String to = "rcbraiyani@gmail.com";
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
                                    message.setText("your password for Faculty Management System is....."+rs.getString("password"));

			            // Send message  
                                    Transport transport = session.getTransport("smtp");
                                    transport.connect("smtp.gmail.com","facportal@gmail.com","fms@1234");
                                    transport.sendMessage(message, message.getAllRecipients());
                                    transport.close();

			        } catch (Exception e) {
			            System.out.println(e);
			        }

				}
			}
                        else{
                            System.out.println("can't send");
                        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/fpwd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
