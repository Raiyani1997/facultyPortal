

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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addsub
 */
@WebServlet("/addsub")
public class addsub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addsub() {
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
		String sql = "Insert into subject (s_id,scode,sname,alias) values(subject_id.nextval,?,?,?)";
		try {
				PreparedStatement ps = con.prepareStatement(sql);
				
				//System.out.println(""+request.getParameter("scode")+""+request.getParameter("sname")+""+request.getParameter("alias"));
				
				ps.setString(1,request.getParameter("scode").toUpperCase());
				ps.setString(2,request.getParameter("sname"));
				ps.setString(3,request.getParameter("alias").toUpperCase());
				ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg","Subject can't be added");
		}
		request.setAttribute("msg","Subject has been added successfully!");
        getServletContext().getRequestDispatcher("/newsubject.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
