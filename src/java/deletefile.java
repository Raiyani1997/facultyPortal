

import java.io.File;
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
 * Servlet implementation class deletefile
 */
@WebServlet("/deletefile")
public class deletefile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletefile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			//out.println("first");
				String filenm = "";
				Connection con = Snippet.getConnection();
				String sql = "select dname from document where d_id=?"; 
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,request.getParameter("did"));
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					filenm = rs.getString("dname");
				}
				String path = "C:\\Users\\rraiy\\eclipse-workspace\\fms1\\src\\uploadDoc";
				
				File file = new File("C:\\Users\\rraiy\\eclipse-workspace\\fms1\\src\\uploadDoc"+File.separator+filenm);
				if(file.delete()) {
					sql = "delete from document where d_id=? ";
					ps = con.prepareStatement(sql);
					ps.setString(1,request.getParameter("did"));
					ps.execute();
					con.close();
					request.setAttribute("message","File deleted successfully!");
				}
				else {
					request.setAttribute("message","File can't delete");
				}
			}
		catch(Exception e) {
			//response.getWriter().println(e);
			request.setAttribute("message","File not deleted");
		}
		//response.getWriter().println(request.getParameter("did"));
		
        getServletContext().getRequestDispatcher("/document.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
