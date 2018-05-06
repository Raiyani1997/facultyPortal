<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Faculty Portal</title>
    <link rel="icon" href="photo/download.jpg" type="image/jpg"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<script src="materialize/js/materialize.js"></script>
	<script src="materialize/js/materialize.min.js"></script>
	<link rel="stylesheet" href="materialize/css/materialize.min.css"/>
	<link rel="stylesheet" href="materialize/css/materialize.css"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
	<script src="js/jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#sact").hide();
			$('select').material_select();
			
                        <%
                            HttpSession ession1 = request.getSession();
                            String uid1 = ession1.getAttribute("uid").toString();
                        %>
                        $('.tag').html('<%=uid1%><i class="material-icons right">arrow_drop_down</i>');
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
	<div class="row"></div>
	<div class="row"></div>
        <form action="studentdetails.jsp" method="post">
            <div class="center container z-depth-2 white" style="width:1000px;height:100px;">		
		<div class="row"></div>
		<div class="row">
                    <div class="col s1"></div>
                    
                    <%
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
                        String uid = ession1.getAttribute("uid").toString();
                        
                        String sql = "select DISTINCT(semester) from timetable where srno in (select DISTINCT(srno) from lecture where f_id = ?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1, uid);
                        try{
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                        
                    %>
                                <div class="col s2">
                                    <select id="s1" name="s1" class="s3">
                                    <option value="" disabled selected>Semester</option>
                                    <%do{%>
                                        <option value='<%=rs.getString("semester")%>'><%=rs.getString("semester")%></option>
                                    <%}while(rs.next());%>
                                </select>
                                </div>
                                <div class="col s1"></div>
                                <div class="col s3">
                                    <select id="s2" name="s2" class="s3">
                                        <option value="" disabled selected>Subject</option>
                                        <%
                                            sql = "select DISTINCT(alias) from subject where s_id in (select DISTINCT(s_id) from lecture where f_id = ?)";
                                            ps = con.prepareStatement(sql);
                                            ps.setString(1, uid);
                                            try{
                                                rs = ps.executeQuery();
                                                while(rs.next()){%>
                                                    <option value='<%=rs.getString("alias")%>'><%=rs.getString("alias")%></option>
                                                <%}
                                            }
                                            catch(Exception e){}
                                        %>
                                    </select>
                                </div>
                                <div class="col s1"></div>
                                <div class="col s2">
                                    <select id="s3" name="s3" class="s3">
                                        <option value="" disabled selected>Division</option>
                                        <%
                                            sql = "select DISTINCT(division) from timetable where srno in (select DISTINCT(srno) from lecture where f_id = ?)";
                                            ps = con.prepareStatement(sql);
                                            ps.setString(1, uid);
                                            try{
                                                rs = ps.executeQuery();
                                                while(rs.next()){%>
                                                    <option value='<%=rs.getString("division")%>'><%=rs.getString("division")%></option>
                                                <%}
                                            }
                                            catch(Exception e){}
                                        %>
                                    </select>
                                </div>
                                
                                <div class="col s2">
                                    <button class="button-collapse btn-floating grey darken-1" type="submit" id="toggle">
                                            <i class="material-icons right">file_download</i>
                                    </button>
                                </div>
                            <%}
                        }
                        catch(Exception e){}%>
                </div>
            </div>
        </form>
	<div class="row"></div>
        
        <form action="storestact" method="post">
	<div class="center container z-depth-2 white" style="width:1000px;">
            <%
                String semester = request.getParameter("s1");
                String subject =  request.getParameter("s2");
                String division = request.getParameter("s3");
                
                sql = "select * from semdetails where sem = ? and SUBSTR(batch,0,1) = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, semester);
                ps.setString(2, division);
                try{
                    ResultSet rs = ps.executeQuery();
                    int i = 0;
                    if(rs.next()){%>
                        
                       <div class="center container z-depth-2 white" style="width:1000px;">		
                            <div class="row"></div>
                            <div class="row"> 
                                <div class="col s2"></div>
                                <input type="hidden" name="subject" value='<%=subject%>'>
                                <div class="col s3 blue-grey-text" style="padding-top: 20px;"><b><%=subject%></b></div>
                                <div class="col s2"></div>
                                <div class="col s3">
                                    <select id="s4" name="exam" class="s3">
                                        <option value="" disabled selected>Type</option>
                                        <option value="Sessional1">Sessional1</option>
                                        <option value="Sessional2">Sessional2</option>
                                        <option value="Sessional3">Sessional3</option>
                                        <option value="External">External</option>
                                    </select>
                                </div>
                                
                            </div>
                            <div class="row"></div>
                            
                       </div>
                                <div class="row"></div>
                            
                       <div class="center container z-depth-2 white" style="width:1000px">
                            <div class="row">
                                <div class="col s1"></div>
                                <div class="col s10">
                                    <table class="centered striped" id="faculty">    
                                        <thead>
                                          <tr>
                                              <th class="blue-grey-text">Roll No</th>
                                              <th class="blue-grey-text">Total Lectures</th>
                                              <th class="blue-grey-text">Attained Lectures</th>
                                              <th class="blue-grey-text">Total Lab</th>
                                              <th class="blue-grey-text">Attained Lab</th>
                                              <th class="blue-grey-text">Marks</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                            <%do{%>
                                            <tr>
                                                <th><%=rs.getString("rollno")%></th>
                                                <input type="hidden" name='<%=((i*10))%>'/>
                                                <th><input name='<%=((i*10)+1)%>' type="text" class="validate"></th>
                                                <th><input name='<%=((i*10)+2)%>' type="text" class="validate"></th>
                                                <th><input name='<%=((i*10)+3)%>' type="text" class="validate"></th>
                                                <th><input name='<%=((i*10)+4)%>' type="text" class="validate"></th>
                                                <th><input name='<%=((i*10)+5)%>' type="text" class="validate"></th>
                                            </tr> 
                                            <%}while(rs.next());%>
                                        </thead>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <button class="btn waves-effect waves-light grey darken-1" type="submit" id="toggle">Store
                                        <i class="material-icons right">store</i>
                                </button>
                            </div>
                                        <div class="row"></div>
                       </div>
                    <%}
                }
                catch(Exception e){}
            %>
            
	</div>
        </form>
</body>
</html>