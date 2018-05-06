

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
                String ui = "";
		if(!request.getParameter("pwd").equals(request.getParameter("cpwd")))
		{
			response.sendRedirect("Registration.html?msg=password_must_be_match");
		}
		else {
			Connection con = Snippet.getConnection();
			String sql = "Select * from faculty where email = ?";
			try {
				PreparedStatement ps1 = con.prepareStatement(sql);
				ps1.setString(1,request.getParameter("mail"));
				ResultSet rs = ps1.executeQuery();
				if(rs.next()) {
					response.sendRedirect("Registration.html?msg=EmailID_already_exist");
				}
				else {				
					sql = "insert into faculty (f_id,photo,password,fname,mname,lname,dob,mob,email,queli,experiance,seq_q_a,special) values (faculty_id.nextval,'photo/'||faculty_id.nextval||'.jpg',?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					
					ps.setString(1,request.getParameter("pwd"));
					ps.setString(2,request.getParameter("fnm"));
					ps.setString(3,request.getParameter("mnm"));
					ps.setString(4,request.getParameter("lnm"));
					String str = request.getParameter("dob");
					str = str.replace(" ","-");
					str = str.replace(",","");
					String array[] = str.split("-");
					str = array[0] +"-"+ array[1].substring(0,3).toUpperCase() +"-"+ array[2];
					ps.setString(5,str);
					
					ps.setString(6,request.getParameter("mob"));
					ps.setString(7,request.getParameter("mail"));
			
					
					/*DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-YYYY");
					LocalDate localDate = LocalDate.now();
					ps.setString(9,dtf.format(localDate).toUpperCase());
					*/
					ps.setString(8,request.getParameter("quali"));
					
					ps.setInt(9,Integer.parseInt(request.getParameter("exp")));
					ps.setString(10,request.getParameter("sq")+"_"+request.getParameter("ans"));
					ps.setString(11,request.getParameter("spec"));
					
					ps.execute();
					
					sql = "Select f_id,photo from faculty where email = ?";
					PreparedStatement ps2 = con.prepareStatement(sql);
					ps2.setString(1,request.getParameter("mail"));
					rs = ps2.executeQuery();
					if(rs.next()) {
                                            str = rs.getString("photo");
                                            ui = rs.getString("f_id");
                                            InputStream is = null;
                                            OutputStream os = null;
                                            try {
                                                is = new FileInputStream(new File("C:/Users/rraiy/Documents/NetBeansProjects/fms/web/photo/default.jpg"));
                                                os = new FileOutputStream(new File("C:/Users/rraiy/Documents/NetBeansProjects/fms/web/photo"+str));
                                                byte[] buffer = new byte[1024];
                                                int length;
                                                while ((length = is.read(buffer)) > 0) {
                                                    os.write(buffer, 0, length);
                                                }
                                            }finally {
                                                
                                            }
                                            
					}
				}	
                                request.setAttribute("msg","Registartion has been done successfully! and your user id is"+ui);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				request.setAttribute("msg","registarion cann't possible");
			}			
		}
		
                getServletContext().getRequestDispatcher("/index.html").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
