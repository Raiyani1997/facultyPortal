

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class addblogs
 */
@WebServlet("/addblogs")
public class addblogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addblogs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
            
            String CUR_DIR = request.getContextPath();
            String NEW_DIR = "web";
            String SAVE_DIR = CUR_DIR+"/"+NEW_DIR;
            String savePath = "C:/Users/rraiy/Documents/NetBeansProjects/fms/web/photo";

            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            
            HttpSession ession1 = request.getSession();
            String uid = ession1.getAttribute("uid").toString(); 
        
            Connection con = Snippet.getConnection();
        
            String sql = "select blog_id.nextval as n from dual";
            String file = "",date="01-MAR-2018";
            int id = 0,n = 0; 
            String data[] = new String[3];
            
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    file = rs.getInt("n")+".jpg";
                    id = rs.getInt("n");
                    //response.getWriter().println("id+"+id);
                }
                
                if(ServletFileUpload.isMultipartContent(request)){
                    try{
                        List<FileItem> multiparts = new ServletFileUpload(
                                                 new DiskFileItemFactory()).parseRequest(request);
                        for(FileItem item : multiparts){
                            if(!item.isFormField()){
                                File nfile = new File(savePath + "/" + file);
                                item.write( nfile );
                            }
                            else{
                                data[n]=item.getString();
                                n++;
                            }
                        }
                    }
                    catch(Exception e){}
                }
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-YYYY");
                LocalDate localDate = LocalDate.now();
                date  = dtf.format(localDate).toUpperCase();
                
                sql = "insert into blogs(b_id,f_id,photo,details,subject,postdate) values(?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1,id);
                ps.setString(2, uid);
                ps.setString(3,"photo/"+file);
                ps.setString(4, data[2]);
                ps.setString(5, data[0]);
                ps.setString(6, date);
                
                ps.execute();
                request.setAttribute("msg","blog uploaded successfully");
            } catch (SQLException e) {
                request.setAttribute("msg","blog can't be uploaded");
            }
            
            getServletContext().getRequestDispatcher("/Blogs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
