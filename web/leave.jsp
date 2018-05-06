<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Faculty Portal</title>
    <link rel="icon" href="photo/download.jpg" type="image/jpg"/>
	<script src="js/jquery.js"></script>
        <script>
            $(document).ready(function(){
                <%
                    HttpSession ession1 = request.getSession();
                    String uid = ession1.getAttribute("uid").toString();
                %>
                $('.tag').html('<%=uid%><i class="material-icons right">arrow_drop_down</i>');
            });
        </script>
</head>
<body>
	<%
        
        String u = ession1.getAttribute("role").toString();
        
        if(u.equals("hod")){
    %>
	<%@include file="hodnavbar.html"%>
        <%}
    else if(u.equals("admprof")){%>
        <%@include file="adminnavbar.html"%>
        <%}
    else{%>
        <%@include file="facultynavbar.html"%>
        <%}%>
	<div class="row">
		
		<div class="col s5">
			<%@include file="leave.html"%>
		</div>
		
		<div class="col offset-s3">
                    <form id="leaveform">
                        <div class="row"></div>
                        <div class="container z-depth-2 white" style="width: 400px">
                            <div class="row"></div>
                            <div class="row">
                                    <div class="col s12 center">
                                <h5>Leave Record</h5>
                            </div>
                            </div>
                            <div class="divider"></div>
                            <div class="row"></div>
                            <div class="row">
                                    <div class="col s1"></div>
                            <div class="col s5"><strong>Total Leave</strong></div>
                            <div class="col s5 tleave">0</div>
                            </div>
                            <div class="row">
                                    <div class="col s1"></div>
                            <div class="col s5"><strong>Sick Leave</strong></div>
                            <%
                                
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
                                
                                String sql = "select count(l_id) as c from leave where f_id = ? and type = ? and status = ?"; 
                                PreparedStatement ps  = con.prepareStatement(sql);
                                ps.setString(1, uid);
                                ps.setString(2, "Sick_Leave");
                                ps.setString(3, "grant");
                                
                                try{
                                    ResultSet rs = ps.executeQuery();
                                    if(rs.next()){%>
                                        <div class="col s5 sleave"><%=rs.getInt("c")%></div>
                                    <%}
                                    else{%>
                                        <div class="col s5 sleave">0</div>
                                    <%}
                                }
                                catch(Exception e){}
                            %>
                            
                            </div>
                            <div class="row">
                                    <div class="col s1"></div>
                            <div class="col s5"><strong>Casual Leave</strong></div>
                            <%
                                
                                sql = "select count(l_id) as c from leave where f_id = ? and type = ? and status = ?"; 
                                ps  = con.prepareStatement(sql);
                                ps.setString(1, uid);
                                ps.setString(2, "Casual_Leave");
                                ps.setString(3, "grant");
                                
                                try{
                                    ResultSet rs = ps.executeQuery();
                                    if(rs.next()){%>
                                        <div class="col s5 cleave"><%=rs.getInt("c")%></div>
                                    <%}
                                    else{%>
                                        <div class="col s5 cleave">0</div>
                                    <%}
                                }
                                catch(Exception e){}
                            %>
                            </div>
                            <div class="row">
                                    <div class="col s1"></div>
                            <div class="col s5"><strong>Earned Leave</strong></div>
                            <%
                                
                                sql = "select count(l_id) as c from leave where f_id = ? and type = ? and status = ?"; 
                                ps  = con.prepareStatement(sql);
                                ps.setString(1, uid);
                                ps.setString(2, "Earned_Leave");
                                ps.setString(3, "grant");
                                
                                try{
                                    ResultSet rs = ps.executeQuery();
                                    if(rs.next()){%>
                                        <div class="col s5 eleave"><%=rs.getInt("c")%></div>
                                    <%}
                                    else{%>
                                        <div class="col s5 eleave">0</div>
                                    <%}
                                }
                                catch(Exception e){}
                            %>
                            </div>
                            <div class="row">
                                    <div class="col s1"></div>
                            <div class="col s5"><strong>Pending Leave</strong></div>
                            <%
                                
                                sql = "select count(l_id) as c from leave where f_id = ? and status = ?"; 
                                ps  = con.prepareStatement(sql);
                                ps.setString(1, uid);
                                ps.setString(2, "false");
                                
                                try{
                                    ResultSet rs = ps.executeQuery();
                                    if(rs.next()){%>
                                        <div class="col s5 pleave"><%=rs.getInt("c")%></div>
                                    <%}
                                    else{%>
                                        <div class="col s5 pleave">0</div>
                                    <%}
                                }
                                catch(Exception e){}
                            %>
                            </div>
                            <div class="divider"></div>
                            <div class="row"></div>
                            <div class="row">
                                    <div class="col s1"></div>
                            <div class="col s5"><strong>Remain Leave</strong></div>
                            <%
                                
                                sql = "select count(l_id) as c from leave where f_id = ? and status = ?"; 
                                ps  = con.prepareStatement(sql);
                                ps.setString(1, uid);
                                ps.setString(2, "grant");
                                
                                try{
                                    ResultSet rs = ps.executeQuery();
                                    if(rs.next()){%>
                                        <div class="col s5 cleave"><%=(10 - rs.getInt("c"))%></div>
                                    <%}
                                    else{%>
                                        <div class="col s5 cleave">0</div>
                                    <%}
                                }
                                catch(Exception e){}
                            %>
                            </div>
                            <div class="divider"></div>
                            <div class="row"></div>

                        </div>
                    </form>
		</div>
		
		<script>
			$(document).ready(function(){
				$(".tleave").text(10);
			});
		</script>
	</div>

        <%
            sql = "select * from leave where f_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, uid);
            try{
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){%>
                <div class="container center white" style="width:900px;" >
                    <div class="row">
                        <div class="col s1"></div>
                        <div class="col s10">
                            <div class="row">
                                <div class="col s6 left">
                                    <strong>Faculty Id:</strong>
                                    <%= rs.getString("f_id") %>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6 left">
                                    <strong>Leave Type:</strong>
                                    <%= rs.getString("type") %>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6 left">
                                    <strong>Start Date:</strong>
                                    <%= rs.getString("startdate") %>
                                </div>
                                <div class="col s6">
                                    <strong>End Date:</strong>
                                    <%= rs.getString("enddate") %>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6 left">
                                    <strong>Total Days:</strong>
                                    <%= rs.getString("totaldays") %>
                                </div>

                                <div class="col s6">
                                    <strong>Reason:</strong>
                                    <%= rs.getString("reason") %>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6 left">
                                    <strong class="green-text">Status:</strong>
                                    <%= rs.getString("status") %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
            }
            catch(Exception e){}
        %>
        <div class="row"></div>
        
</body>
</html>