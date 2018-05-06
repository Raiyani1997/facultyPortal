<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
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
                $('select').material_select();
                <%
                    HttpSession ession1 = request.getSession();
                    String uid = ession1.getAttribute("uid").toString();
                %>
                $('.tag').html('<%=uid%><i class="material-icons right">arrow_drop_down</i>');
            });
	</script>
</head>
<body class="grey lighten-4">
	
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
		<div class="row">
			<div class="col s7 center" style="padding-left:50px;"><a style="color:red" href="">${requestScope.msg}</a></div> 
		</div>
		<div class="row"></div>
		<form action="changepwd" method="post" id="addblog" enctype="multipart/form-data">
	    <div class="container z-depth-2 white center" style="width: 500px">
			<div class="row"></div>
			<div class="row">
				<div class="col s12 center">
		            <h5><b>Change Password</b></h5>
		        </div>
			</div>
			
			

			
			<div class="row"></div>
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s10">
					<i class="material-icons prefix">vpn_key</i>
					<input id="cpwd" name="cpwd" type="password" class="validate">
					<label for="cpwd">Current Password</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s5">
					<select id="sq" name="sq">
						<option value="" disabled selected>Security Question</option>
						<option value="1">Your_Birth_Place</option>
						<option value="2">Favorite_Color</option>
						<option value="3">Favorite_Book</option>
					</select>
				</div>
				<div class="input-field col s5">
					<i class="material-icons prefix">date_range</i>
					<input id="ans" name="ans" type="text" class="validate">
					<label for="ans">Answer</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s6">
					<i class="material-icons prefix">vpn_key</i>
					<input id="npwd" name="npwd" type="password" class="validate">
					<label for="npwd">New Password</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s6">
					<i class="material-icons prefix">vpn_key</i>
					<input id="vpwd" name="vpwd" type="password" class="validate">
					<label for="vpwd">Conform Password</label>
				</div>
			</div>
			
			<button class="btn waves-effect waves-light grey darken-3 center" id="submit" type="submit" name="action">Change Password
				<i class="material-icons right">sync</i>
			</button>
			<div class="row"></div>
			<div class="row"></div>
			<div class="row"></div>
		</div>
		</form>
	
</body>
</html>