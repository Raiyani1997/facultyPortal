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
	<link rel="stylesheet" href="materialize/css/materialize.min.css"/>
	<link rel="stylesheet" href="materialize/css/materialize.css"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
	<script src="js/jquery.js"></script>
	<script src="materialize/js/materialize.js"></script>
	<script src="materialize/js/materialize.min.js"></script>
	<script>
            $(document).ready(function(){
                $(".dropdown-button").dropdown();
                $(".dropdown-button2").dropdown();
                <%
                    HttpSession ession1 = request.getSession();
                    String uid1 = ession1.getAttribute("uid").toString();
                %>
                $('.tag').html('<%=uid1%><i class="material-icons right">arrow_drop_down</i>');
            });
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body class="grey lighten-3">
	<%
        String u = ession1.getAttribute("role").toString();
        if(u.equals("hod")){
    %>
	<nav>
	    <div class="nav-wrapper grey darken-3">
	    	
	    	<ul id="dropdown1" class="dropdown-content">
				<li><a class="black-text" href="Profile.jsp">View Profile</a></li>
				<li><a class="black-text" href="editprofile.jsp">Edit Profile</a></li>
				<li><a class="black-text" href="resetpwd.jsp">change password</a></li>
				<li class="divider"></li>
				<li><a class="black-text" href="logout">Logout</a></li>
			</ul>
			<ul id="dropdown2" class="dropdown-content">
				<li><a class="black-text" href="schedule.jsp?msg=Monday">Monday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Tuesday">Tuesday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Wednesday">Wednesday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Thursday">Thursday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Friday">Friday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Saturday">Saturday</a></li>
			</ul>
	      	<ul id="nav-mobile" class="left hide-on-med-and-down">
	        	<li><a class="white-text active" href="home.jsp" ><i class="material-icons left">home</i>Home</a></li>
                        <li><a class="white-text" href="newsubject.jsp">Add_Subject</a></li>
                        <li><a class="white-text" href="notice.jsp">Notice</a></li>
	        	<li><a class="white-text" href="document.jsp">Document</a></li>
	        	<li><a class="white-text" href="studentdetails.jsp">Student_details</a></li>
	        	<li><a class="white-text" href="workload.jsp">WorkLoad</a></li>
	        	<li><a class="white-text" href="Blogs.jsp">Blogs</a></li>
	        	<li><a class="white-text dropdown-button2" style="width: 120px;" href="#" data-activates="dropdown2">Schedule</a></li>
	      	</ul>
	      	<a class="dropdown-button right" style="width:170px;" href="#!" data-activates="dropdown1"><div id="dmenu" class="right tag">Account<i class="material-icons right">arrow_drop_down</i></div></a>
    	</div>
  	</nav>
        <%}
    else if(u.equals("admprof")){%>
        <nav>
	    <div class="nav-wrapper grey darken-3">
	    	
	    	<ul id="dropdown1" class="dropdown-content">
				<li><a class="black-text" href="Profile.jsp">View Profile</a></li>
				<li><a class="black-text" href="editprofile.jsp">Edit Profile</a></li>
				<li><a class="black-text" href="resetpwd.jsp">change password</a></li>
				<li class="divider"></li>
				<li><a class="black-text" href="logout">Logout</a></li>
			</ul>
			<ul id="dropdown2" class="dropdown-content">
				<li><a class="black-text" href="schedule.jsp?msg=Monday">Monday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Tuesday">Tuesday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Wednesday">Wednesday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Thursday">Thursday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Friday">Friday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Saturday">Saturday</a></li>
			</ul>
	      	<ul id="nav-mobile" class="left hide-on-med-and-down">
	        	<li><a class="white-text active" href="home.jsp" ><i class="material-icons left">home</i>Home</a></li>
                        <li><a class="white-text" href="document.jsp">Document</a></li>
	        	<li><a class="white-text" href="leave.jsp">Leave</a></li>
	        	<li><a class="white-text" href="studentdetails.jsp">Student_details</a></li>
	        	<li><a class="white-text" href="workload.jsp">WorkLoad</a></li>
	        	<li><a class="white-text" href="Blogs.jsp">Blogs</a></li>
	        	<li><a class="white-text dropdown-button2" style="width: 120px;" href="#" data-activates="dropdown2">Schedule</a></li>
	      	</ul>
	      	<a class="dropdown-button right" style="width:170px;" href="#!" data-activates="dropdown1"><div id="dmenu" class="right tag">Account<i class="material-icons right">arrow_drop_down</i></div></a>
    	</div>
  	</nav>
        <%}
    else{%>
        <nav>
	    <div class="nav-wrapper grey darken-3">
	    	
	    	<ul id="dropdown1" class="dropdown-content">
				<li><a class="black-text" href="Profile.jsp">View Profile</a></li>
				<li><a class="black-text" href="editprofile.jsp">Edit Profile</a></li>
				<li><a class="black-text" href="resetpwd.jsp">change password</a></li>
				<li class="divider"></li>
				<li><a class="black-text" href="logout">Logout</a></li>
			</ul>
			<ul id="dropdown2" class="dropdown-content">
				<li><a class="black-text" href="schedule.jsp?msg=Monday">Monday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Tuesday">Tuesday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Wednesday">Wednesday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Thursday">Thursday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Friday">Friday</a></li>
				<li><a class="black-text" href="schedule.jsp?msg=Saturday">Saturday</a></li>
			</ul>
	      	<ul id="nav-mobile" class="left hide-on-med-and-down">
	        	<li><a class="white-text active" href="home.jsp" ><i class="material-icons left">home</i>Home</a></li>
                        <li><a class="white-text" href="document.jsp">Document</a></li>
	        	<li><a class="white-text" href="leave.jsp">Leave</a></li>
	        	<li><a class="white-text" href="studentdetails.jsp">Student_details</a></li>
	        	<li><a class="white-text" href="workload.jsp">WorkLoad</a></li>
	        	<li><a class="white-text" href="Blogs.jsp">Blogs</a></li>
	        	<li><a class="white-text dropdown-button2" style="width: 120px;" href="#" data-activates="dropdown2">Schedule</a></li>
	      	</ul>
	      	<a class="dropdown-button right" style="width:170px;" href="#!" data-activates="dropdown1"><div id="dmenu" class="right tag">Account<i class="material-icons right">arrow_drop_down</i></div></a>
    	</div>
  	</nav>
        <%}%>
        <div class="row"></div>
	<% 
		
                String uid = ession1.getAttribute("uid").toString(); 
                if(request.getParameter("user") != null){
                    uid  = request.getParameter("user");
                }
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
		String sql = "select fname,mname,lname,TO_CHAR(dob,'MON DD, YYYY') as dob,mob,email,queli,experiance,photo,TO_CHAR(joindate,'MON DD, YYYY') as joindate,role,special,status from faculty where f_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,uid);
		try {
			ResultSet rs = ps.executeQuery();
			while(rs.next()){%>
	
	<div class="container center white" style="width:900px;">
		<div class="row"></div>
		<div class="row"></div>
		<div class="row">
			<div class="col s1"></div>
			<div class="col s2">
				<img src='<%= rs.getString("photo") %>' style="width: 120px;height: 120px;border-radius: 50%;" />
			</div>
			<div class="col s9">
				<div class="row" style="padding-left: 20px;">
					<h4 class="left"><%= rs.getString("fname").toUpperCase() %> <%= rs.getString("mname").toUpperCase() %> <%= rs.getString("lname").toUpperCase() %></h4><br/>
					<% if( rs.getString("role").equals("hod")) {%>
						<h5 class="left">HEAD OF DEPARTMENT</h5>
					<%}
					else if( rs.getString("role").equals("assoprof")) {%>
						<h5 class="left">ASSOCIATE PROFESSOR</h5>
					<%}
					else{%>
					<h5 class="left">ASSISTANT PROFESSOR</h5>
					<%} %>
				</div>
			</div>
		</div>
		<div class="row"><div class="col s1"></div><div class="divider col s10"></div></div>
		
		<div class="row">
			<div class="col s1"></div>
			<div class="row">
				<h5 class="left"><i class="material-icons prefix">person</i><strong> Profile</strong></h5>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
                                    <strong class="left">User ID:</strong><div class="green-text "><b><%= uid %></b></div>
				</div>
				<div class="col s5">
					<strong class="left">First Name:</strong><%= rs.getString("fname") %>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">Middle Name:</strong><%= rs.getString("mname") %>
				</div>
				<div class="col s5">
					<strong class="left">Last Name:</strong><%= rs.getString("lname") %>
				</div>
			</div>

			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">Email id:</strong><%= rs.getString("email") %>
				</div>
				<div class="col s5">
					<strong class="left">Contact no:</strong><%= rs.getString("mob") %>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">DOB:</strong><%= rs.getString("dob") %>
				</div>
				
			</div>
		</div>

		<div class="row"><div class="col s1"></div><div class="divider col s10"></div></div>
		
		<div class="row">
			<div class="col s1"></div>
			<div class="row">
				<h5 class="left"><i class="material-icons prefix">school</i><strong> Education</strong></h5>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">Quelification:</strong><%= rs.getString("queli") %>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">Specialization in:</strong> <%= rs.getString("special") %>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left"><%= rs.getString("experiance") %> years Experiance</strong>
				</div>
			</div>
		</div>
		<div class="row"><div class="col s1"></div><div class="divider col s10"></div></div>
		
		<div class="row">
			<div class="col s1"></div>
			<div class="row">
				<h5 class="left"><i class="material-icons prefix">public</i><strong> Activity</strong></h5>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">Work as:</strong>
					<% if( rs.getString("role").equals("hod")) {%>
						Head of Department</h5>
					<%}
					else if( rs.getString("role").equals("assoprof")) {%>
						Associate Professor
					<%}
					else{%>
					Assistant Professor
					<%} %>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
					<strong class="left">Since</strong><%= rs.getString("joindate") %>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="col s5">
                                    <strong class="left">Status:</strong> <div class="green-text"><b><% if(rs.getString("status").toLowerCase().equals("true"))%>Active<%else{%>Deactive<% }%></b></div>
				</div>
			</div>
		</div>
		
		<div class="row"></div>
	</div>
	<%}
		}
		catch(Exception ex){} 						
	%>
</body>
</html>