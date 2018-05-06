

import java.io.File;
import java.io.IOException;
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
 * Servlet implementation class uploadphoto
 */
@WebServlet("/uploadphoto")
public class uploadphoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadphoto() {
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
        String fnm = uid+".jpg";
        //response.getWriter().println(request.getParameter("sq"));
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                    
                    	File nfile = new File(savePath + "/" + fnm);
                        item.write( nfile );
                        
                    }
                    
                }
        	} catch (Exception ex) {
            	
        	}         
        }
        //System.out.println(savePath + File.separator + fnm);
        response.sendRedirect("editprofile.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
