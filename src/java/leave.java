

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class leave
 */
@WebServlet("/leave")
public class leave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public leave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection con = Snippet.getConnection();
			HttpSession session = request.getSession();
			String uid = session.getAttribute("uid").toString();
			String sql = "insert into leave (l_id,f_id,startdate,enddate,totaldays,type,reason,status) values (leave_id.nextval,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,uid);
			
			String str = request.getParameter("sdate");
			str = str.replace(" ","-");
			str = str.replace(",","");
			String array[] = str.split("-");
			str = array[0] +"-"+ array[1].substring(0,3).toUpperCase() +"-"+ array[2];
			ps.setString(2,str);
			
			str = request.getParameter("edate");
			str = str.replace(" ","-");
			str = str.replace(",","");
			String array1[] = str.split("-");
			str = array1[0] +"-"+ array1[1].substring(0,3).toUpperCase() +"-"+ array1[2];
			ps.setString(3,str);
			ps.setInt(4,Integer.parseInt(request.getParameter("tdays")));
			ps.setString(5,request.getParameter("sq"));
			ps.setString(6,request.getParameter("reason"));
			ps.setString(7,"false");
			ps.execute();
			response.sendRedirect("leave.jsp");
		}
		catch(Exception e) {
			response.sendRedirect("leave.jsp?msg="+e);
		}
		//response.getWriter().print("hello "+request.getParameter("sq"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
