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
                $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15, // Creates a dropdown of 15 years to control year,
                today: 'Today',
                clear: 'Clear',
                close: 'Ok',
                closeOnSelect: false // Close upon selecting a date,
                });
                $('select').material_select();
                <%
                    HttpSession ession1 = request.getSession();
                    String uid1 = ession1.getAttribute("uid").toString();
                %>
                $('.tag').html('<%=uid1%><i class="material-icons right">arrow_drop_down</i>');
            });
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body class="#f5f5f5 grey lighten-4">
	
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
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
		String sql = "select * from faculty where f_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,uid);
		try {
			ResultSet rs = ps.executeQuery();
			while(rs.next()){%>
				<div class="row center" style="width:1200px">
					<div class="row center"></div>
					<div class="row center"><h4>Edit Profile</h4></div>
					<div class="divider grey darken-6"></div>
					<div class="row"></div>
					<div class="row"></div>
								
					<div class="col s8">
						<form action="uploadphoto" id="registartiform" method="post">
							<div class="container form1" style="width:100%;">
								<div class="row">
									
									<div class="input-field col s4">
										<i class="material-icons prefix">account_circle</i>
										<input id="fnm" name="fnm" type="text" value='<%= rs.getString("fname") %>' class="validate">
										<label for="fnm">First Name</label>
									</div>
									
									<div class="input-field col s4">
										<input id="mnm" name="mnm" type="text" value='<%= rs.getString("mname") %>' class="validate">
										<label for="mnm">Middle Name</label>
									</div>
									<div class="input-field col s4">
										<input id="lnm" name="lnm" type="text" value='<%= rs.getString("lname") %>' class="validate">
										<label for="lnm">Last Name</label>
									</div>
								</div>
								
								<div class="row">
									<div class="col s6">
										<div class="input-field col s12">
											<i class="material-icons prefix">contact_phone</i>
											<input id="mob" name="mob" type="text" value='<%= rs.getString("mob") %>' class="validate">
											<label for="mob">Contact No.</label>
										</div>
									</div>
									<div class="col s6">
										<div class="input-field col s12">
											<i class="material-icons prefix">email</i>
											<input id="mail" name="mail" type="text" value='<%= rs.getString("email") %>' class="validate">
											<label for="mail">Email</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s6">
										<i class="material-icons prefix">date_range</i>
										<input id="dob" name="dob" type="text" value='<%= rs.getDate("dob") %>' class="datepicker">
										<label for="dob">Birth Date</label>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s12">
										<i class="material-icons prefix">store</i>
										<input id="quali" name="quali" type="text" value='<%= rs.getString("queli") %>' class="validate">
										<label for="quali">Qualification</label>
									</div>
								</div>
			
								<div class="row">
									<div class="input-field col s12">
										<i class="material-icons prefix">subject</i>
										<input id="spec" name="spec" type="text" value='<%= rs.getString("special") %>' class="validate">
										<label for="spec">Specialization</label>
									</div>
								</div>
			
								<div class="row">
									<div class="input-field col s12">
										<i class="material-icons prefix">view_week</i>
										<input id="exp" name="exp" type="text" value='<%= rs.getInt("experiance") %>' class="validate">
										<label for="exp">Experiance</label>
									</div>
								</div>
								<div class="row"></div>
								<div class="row">
									<div class="col s5"></div>
									<button class="btn waves-effect waves-light grey darken-3" id="submit" type="submit" name="action">Update
										<i class="material-icons right">send</i>
									</button>
								</div>
								<div class="row"></div>
								<div class="row"></div>
							</div>
						</form>
					</div>
			
			        <div class="col s4 ">
			        	<div class="row"></div>
			        	<div class="row"></div>
						<form action="uploadphoto" method="post" id="uploadphoto" enctype="multipart/form-data">
							<div class="row center">
								<img src='<%= rs.getString("photo") %>' style="width:45%" />		
							</div>
							
							<div class="row">
								<div class="col s1"></div>
								<div class="file-field input-field s10 col">
									<div>
										<input type="file" name="file" size="60" multiple>
									</div>
									<div class="file-path-wrapper">
										<input name="filenm" class="file-path validate " type="text" placeholder="select file">
									</div>
								</div>
							</div>
							<div class="row">
								<button class="btn waves-effect waves-light grey darken-3" id="submit" type="submit" name="action">Upload
									<i class="material-icons right">publish</i>
								</button>			
							</div>
						</form>
					</div>
				</div>
			<%}
		}
		catch(Exception ex){} 						
	%>
</body>	
</html>