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
			$('.datepicker').pickadate({
			selectMonths: true, // Creates a dropdown to control month
			selectYears: 15, // Creates a dropdown of 15 years to control year,
			today: 'Today',
			clear: 'Clear',
			close: 'Ok',
			closeOnSelect: false // Close upon selecting a date,
			});
			$('select').material_select();
        });
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body class="#f5f5f5 grey lighten-4">
	<%@include file="nevbar.html"%>
	<div class="row"></div>
	
	<% 
		HttpSession ession1 = request.getSession();
        String uid = "hod111"; 
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
								
			
			
			        <div class="col s4 ">
			        	<div class="row"></div>
			        	<div class="row"></div>
						<form action="first" method="post" id="uploadphoto" enctype="multipart/form-data">
							<input type="text" name="uid"/>
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