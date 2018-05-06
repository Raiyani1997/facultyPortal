


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/storre")
public class storre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public storre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PreparedStatement ps;
		Connection con=null;
                String day=request.getParameter("day");
		try
		{
			con=Snippet.getConnection();
			
			int row=1,col=0,error=0,srno=99;
			String stime[]= {"8:30","9:30","10:45","11:45","13:30","14:30","15:30","16:30"};
			String etime[]= {"9:30","10:30","11:45","12:45","14:30","15:30","16:30","17:30"};
			String index="99";
			String sem="",div="",semdiv="";
			
			ResultSet rs;
                        
                        String delete = "";
                        String n = "Select srno from timetable where day=?";
                        ps = con.prepareStatement(n);
                        ps.setString(1,day);//day
			rs= ps.executeQuery();
                        while(rs.next()){
                            delete = "delete from lecture where srno=?";
                            ps = con.prepareStatement(delete);
                            ps.setInt(1,rs.getInt("SrNo"));
                            ps.executeUpdate();

                            delete = "delete from lab where srno=?";
                            ps = con.prepareStatement(delete);
                            ps.setInt(1,rs.getInt("SrNo"));
                            ps.executeUpdate();
                                
                        }
                        
                        
			String sql1;
			while(row<2) {
				col=0;
				srno = 0;
				index=""+row+col;
				semdiv=request.getParameter(index);
				String sd[]=semdiv.split("-");
				if(sd.length==2)
				{
					sem=sd[0];
					div=sd[1];
                                        
				}
				sql1="select srno from timetable where day=? and  semester=? and division=?" ;
				ps = con.prepareStatement(sql1);
				ps.setString(1,day);//day
				ps.setString(2,sem);//semester
				ps.setString(3,div);//division
				rs= ps.executeQuery();
				if(rs.next())
				{
					srno=rs.getInt("SrNo");
                                        System.out.println(srno);
                                        
				}
				
				col++;
				
				while(col<9)
				{		
					index=""+row+col;
					String data=request.getParameter(index);
					
					String da[]=data.split(" ");
					
					if(da.length==2)
					{
						String s = "select f_id from faculty where SUBSTR(fname,0,1) || SUBSTR(mname,0,1) ||  SUBSTR(lname,0,1) = ? ";
						ps = con.prepareStatement(s);
						ps.setString(1,da[0]);
						rs= ps.executeQuery();
						String fid="";
						if(rs.next()) {
							fid = rs.getString("f_id");
						}
						
						s = "select s_id from subject where alias = ? ";
						ps = con.prepareStatement(s);
						ps.setString(1,da[1]);
						rs= ps.executeQuery();
						String sid="";
						if(rs.next()) {
							sid = rs.getString("s_id");
						}
						
						String lecsql = "insert into lecture values (lecture_id.nextval,?,?,?,?,?)";
						ps = con.prepareStatement(lecsql);
						ps.setInt(1,srno);
						ps.setString(2,fid);//Faculty
                                                
						ps.setString(3,sid);//Subject
						
                                                ps.setString(4,stime[col-1]);//StatTime
                                                
						ps.setString(5,etime[col-1]);//EndTime
                                                
                                                
						ps.execute();
                                                
					}
					else if(da.length==4)
					{
						 String labsql = "insert into lab values (lab_id.nextval,?,?,?,?,?,?,?)";
						 PreparedStatement  ps1 = con.prepareStatement(labsql);
						 
						 for(int i=0;i<4;i++)
						 {
							String da2[]=da[i].split("-");
							String s = "select f_id from faculty where SUBSTR(fname,0,1) || SUBSTR(mname,0,1) ||  SUBSTR(lname,0,1) = ? ";
							ps = con.prepareStatement(s);
							ps.setString(1,da2[1]);
							rs= ps.executeQuery();
							String fid="";
							if(rs.next()) {
								fid = rs.getString("f_id");
							}
							
							s = "select s_id from subject where alias = ? ";
							ps = con.prepareStatement(s);
							ps.setString(1,da2[2]);
							rs= ps.executeQuery();
							String sid="";
							if(rs.next()) {
								sid = rs.getString("s_id");
							}
							
							ps1.setInt(1,srno);
							ps1.setString(4,sid);//Subject2
							ps1.setString(2,da2[0]);//Batch1
							ps1.setString(5,da2[3]);//Location4
							ps1.setString(6,stime[col-1]);//StatTime
							ps1.setString(7,etime[col]);//EndTime
							ps1.setString(3,fid);//Faculty3
							ps1.execute();
							 
						 }
						 col+=1;	 
					}
					col+=1;
				}
				row++;
			}
                        //request.setAttribute("msg",day);
		}
		catch(Exception e) {
			request.setAttribute("msg1","Schedule for "+day+" is couse the error.");
		}
				
                getServletContext().getRequestDispatcher("/schedule.jsp?msg="+day).forward(request, response);
                //response.sendRedirect("schedule.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
