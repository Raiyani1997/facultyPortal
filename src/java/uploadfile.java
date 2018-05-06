

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DecimalFormat;
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
 * Servlet implementation class uploadfile
 */
@WebServlet("/uploadfile")
public class uploadfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //private static final String SAVE_DIR = "uploadDoc";
    private static DecimalFormat df2 = new DecimalFormat(".####");
    
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String appPath = request.getServletContext().getRealPath("");
        //String savePath = appPath + File.separator + SAVE_DIR;
        String CUR_DIR = request.getContextPath();
        String NEW_DIR = "src\\java";
        String SAVE_DIR = "C:/Users/rraiy/Documents/NetBeansProjects/fms/src/java/uploadDoc";
        String savePath = SAVE_DIR;
		
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
        double bytes = 0.0;
        String[] str = new String[4];
        String[] str1 = new String[4];
        int i = 0;
        //response.getWriter().println(request.getParameter("sq"));
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                    	String name = new File(item.getName()).getName();
                    	File nfile = new File(savePath + "/" + name);
                        item.write( nfile );
                        bytes = nfile.length();
                    }
                    else {
                    	str[i] = item.getString();
                    	str1[i] = item.getFieldName();
                       	i++;
                    }
                }
                
        	} catch (Exception ex) {
            	request.setAttribute("message", "File Upload Failed due to " + ex);
        	}         
        }
        
        Connection con = Snippet.getConnection();
        HttpSession session = request.getSession();
        String f_id = session.getAttribute("uid").toString(); 
        String st = "Insert into document (d_id,dtype,sname,dname,specification,f_id,dexet,dsize) values (document_id.nextval,?,?,?,?,?,?,?)";
        
        PreparedStatement ps;
		try {
			ps = con.prepareStatement(st);
			for(int j=0;j<i;j++) {
	        	ps.setString(j+1,str[j]);
	        	
	        	if(str1[j].equals("filenm")) {
	        		String[] s =  str[j].split("\\.");
					ps.setString(6,s[s.length - 1]);
	        		//response.getWriter().println(s[s.length - 1]+" ");
	        	}
	        }
	        ps.setString(5,f_id);
	        //df2.setRoundingMode(RoundingMode.UP);
			ps.setDouble(7,Double.parseDouble(df2.format(bytes/(1024*1024))));
			ps.execute();
			response.getWriter().println("Upload has been done successfully! "+ (bytes));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//response.getWriter().println(e);
			request.setAttribute("message","File couldn't added");
		}
			
        //request.setAttribute("message","Upload has been done successfully!");
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
