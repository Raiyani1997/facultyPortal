<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
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
                    $('#faculty').hide();
                    $('#subject').hide();
                    $('#r1').change(function () {
                        if ($(this).is(':checked')) {
                            $('#faculty').show();
                            $('#subject').hide();
                        }
                    });
                            $('#r2').change(function () {
                        if ($(this).is(':checked')) {
                            $('#faculty').hide();
                            $('#subject').show();
                        }
                    });
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
	<div class="row"></div>
	<div class="row"></div>
	<div class="center container z-depth-2 white" style="width:1000px;height:60px;">		
		<div class="row"></div>
		<div class="row">
			<div class="col s2"></div>
			<div class="col s4 center">
		    	<input name="grp1" type="radio" id="r1">
				<label for="r1" >Faculty-wise</label>
      		</div>
      		
      		<div class="col s4 center">
		      	<input name="grp1" type="radio" id="r2">
				<label for="r2">Subject-wise</label>
			</div>
		</div>
	</div>
	<div class="row"></div>
	<div class="center container z-depth-2 white" style="width:1000px;">
		
		<div class="col s1"></div>
		<div class="col s10">
		<% 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
		String sql = "select (SUBSTR(fname,0,1) || SUBSTR(mname,0,1) ||  SUBSTR(lname,0,1)) as fac,f_id  from faculty";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet r1,r2;
		int flec=0,flab=0,slec=0,slab=0;
		try {
			ResultSet rs = ps.executeQuery();
			%> 
                <table class="centered striped" id="faculty">
	        <thead>
	          <tr>
	              <th class="blue-grey-text">Faculty Name</th>
	              <th class="blue-grey-text">Lecture</th>
	              <th class="blue-grey-text">Laboratory</th>
	          </tr>
	        </thead>
	        <tbody>
	        
			<%while(rs.next()){%>
				<tr >
					<th class="center"><%=rs.getString("fac") %></th>
					<%
						sql = "select count(le_id) as l from lecture where f_id = ?";
						ps = con.prepareStatement(sql);
						ps.setString(1,rs.getString("f_id"));
						r1 = ps.executeQuery();
						if(r1.next()){%>
							<th class="center"><%=r1.getInt("l") %></th>
						<%
						flec+=r1.getInt("l");
						}
					%>
					
					<%
						sql = "select count(la_id) as la from lab where f_id = ?";
						ps = con.prepareStatement(sql);
						ps.setString(1,rs.getString("f_id"));
						r1 = ps.executeQuery();
						if(r1.next()){%>
							<th class="center"><%=r1.getInt("la") %></th>
						<%
						flab+=r1.getInt("la");
						}
					%>
				</tr>
			<%}%>
			<thead>
	          <tr>
	              <th class="blue-grey-text">COUNT</th>
	              <th class="blue-grey-text"><%=flec %></th>
	              <th class="blue-grey-text"><%=flab %></th>
	          </tr>
	        </thead>
			</tbody>
      		</table>
		<%}
		catch(Exception ex){} 						
		%>
		
		<%
		sql = "select alias,s_id  from subject";
		ps = con.prepareStatement(sql);
		
		try {
			ResultSet rs = ps.executeQuery();
			%> 
			<table class="centered striped" id="subject">
	        <thead>
	          <tr>
	              <th class="blue-grey-text">Subject Name</th>
	              <th class="blue-grey-text">Lecture</th>
	              <th class="blue-grey-text">Laboratory</th>
	          </tr>
	        </thead>
	        <tbody>
	        
			<%while(rs.next()){%>
				<tr >
					<th class="center"><%=rs.getString("alias") %></th>
					<%
						sql = "select count(le_id) as le from lecture where s_id = ?";
						ps = con.prepareStatement(sql);
						ps.setString(1,rs.getString("s_id"));
						r1 = ps.executeQuery();
						if(r1.next()){%>
							<th class="center"><%=r1.getInt("le") %></th>
						<%
						slec+=r1.getInt("le");
						}
					%>
					
					<%
						sql = "select count(la_id) as la from lab where s_id = ?";
						ps = con.prepareStatement(sql);
						ps.setString(1,rs.getString("s_id"));
						r1 = ps.executeQuery();
						if(r1.next()){%>
							<th class="center"><%=r1.getInt("la") %></th>
						<%
						slab+=r1.getInt("la");
						}
					%>
				</tr>
			<%}%>
			<thead>
	          <tr>
                      <th class="blue-grey-text">COUNT</th>
	              <th class="blue-grey-text"><%=slec %></th>
	              <th class="blue-grey-text"><%=slab %></th>
	          </tr>
	        </thead>
			</tbody>
      		</table>
		<%}
		catch(Exception ex){} 						
		%>
		</div>
		</div>
	</div>
</body>
</html>