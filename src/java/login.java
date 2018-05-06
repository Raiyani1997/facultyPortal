

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//out.println("first");
			Connection con = Snippet.getConnection();
			String sql = "select * from faculty where f_id=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,request.getParameter("uid"));
			ResultSet rs = ps.executeQuery();
			boolean flag = false;
			while(rs.next()) {
				if(request.getParameter("pwd").equals(rs.getString("password"))) {
					if("false".equals(rs.getString("status"))) {
						response.sendRedirect("index.html?error='not allowed to login'");
					}else {
						HttpSession session = request.getSession();
						session.setAttribute("uid",rs.getString("f_id"));
                                                session.setAttribute("role",rs.getString("role"));
						response.sendRedirect("home.jsp");
						
					}
					flag = true;
				}
			}
			
			if(!flag) {
				request.setAttribute("message","Upload has been done successfully!");
		        getServletContext().getRequestDispatcher("/index.html").forward(request, response);
			}
			con.close();
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("index.html?error="+e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
