

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class changepwd
 */
@WebServlet("/changepwd")
public class changepwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changepwd() {
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
        HttpSession session = request.getSession();
        String f_id = session.getAttribute("uid").toString();
        String cpwd = request.getParameter("cpwd");
        String npwd = request.getParameter("npwd");
        String vpwd = request.getParameter("vpwd");
        String seq = request.getParameter("sq")+"_"+request.getParameter("ans");
        
        String sql = "select password,seq_q_a from faculty where f_id = ?";
        try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cpwd);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(cpwd) && seq.equals(rs.getString("seq_q_a"))) {
					if(npwd.equals(vpwd)) {
						sql = "update table faculty set password = ? where f_id = ?";
						ps = con.prepareStatement(sql);
						ps.setString(1, npwd);
						ps.setString(2, f_id);
						ps.executeUpdate();
					}
					else {
						request.setAttribute("msg","Password must be match!");
					}
				}
				else {
					request.setAttribute("msg","current password or sequerty question_answer doesn't match!");
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg","Password can't be change!");
		}
        request.setAttribute("msg","Password has been changed successfully!");
        getServletContext().getRequestDispatcher("/resetpwd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
