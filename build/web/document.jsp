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
			$(".button-collapse").sideNav();
			$('.button-collapse').sideNav({
					menuWidth: 300, // Default is 300
					edge: 'right', // Choose the horizontal origin
					closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
					draggable: true, // Choose whether you can drag to open on touch screens,
					onOpen: function(el) { /* Do Stuff */ }, // A function to be called when sideNav is opened
					onClose: function(el) { /* Do Stuff*/ }, // A function to be called when sideNav is closed
			});
			$('select').material_select();
			$('#spec').trigger('autoresize');
                        
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
	<div class="row">
		<div class="col s7 center" style="padding-left:50px;"><a style="color:red" href="">${requestScope.message}</a></div> 
	</div>
	<div class="row">
		<ul id="slide-out" class="side-nav" style="width: 500px;">
			<div class="row"></div>
			<div class="row"></div>
			
			<form action="uploadfile" method="post" id="uploadform" enctype="multipart/form-data">
				<div class="row"></div>
				<div class="row"></div>
				<div class="container z-depth-2 white" style="width: 400px">
					<div class="row"></div>
					<div class="row">
						<div class="col s12 center">
				            <h5>Upload</h5>
				        </div>
					</div>
					
					<div class="row">
						<div class="col s1"></div>
						<div class="input-field col s10">
							<select id="sq" name="sq">
								<option value="" disabled selected>Document Type</option>
								<option value="Notebooks">Notebooks</option>
								<option value="Theses">Theses</option>
								<option value="Notes">Notes</option>
								<option value="File">File</option>
								<option value="Directory">Directory</option>
							</select>
						</div>
					</div>
					
					<div class="row">
						<div class="col s1"></div>
				        <div class="input-field col s10">
				        	<i class="material-icons prefix">import_contacts</i>
				        	<input id="sub" name="sub" type="text" class="validate">
				     	    <label for="sub">Subject</label>
				        </div>
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
						<div class="col s1"></div>
			        	<div class="input-field col s10">
			          		<i class="material-icons prefix">mode_edit</i>
			          		<textarea id="spec" name="spec" class="materialize-textarea"></textarea>
			          		<label for="spec">Specification</label>
			        	</div>
					</div>
					<div class="row">
						<div class="col s4"></div>
						<button class="btn waves-effect waves-light #757575 grey darken-1" id="submit" type="submit" name="action">Upload
							<i class="material-icons right">publish</i>
						</button>
					</div>
					<div class="row"></div>
				
				</div>
			</form>
		</ul>
		<div class="row" style="padding-left: 60px;">
    		<a href="#" title="Add new Document" data-activates="slide-out" class="button-collapse btn-floating black"><i class="material-icons">menu</i></a>
    	</div>
	</div>
	<div class="row">
		<div class="col s10">
			<div class="row">			
				<div class="col s10">
					<ul class="collapsible popout" data-collapsible="accordion">
						<%
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
							String sql = "select * from Document";
							PreparedStatement ps = con.prepareStatement(sql);
							
							try {
								ResultSet rs = ps.executeQuery();
								while(rs.next()){%>
                                                                    <li>
								      	<div class="collapsible-header"><i class="material-icons">book</i><%= rs.getString("dname") %></div>
								      	<div class="collapsible-body">
								      		<div class="row">
								      			<div class="col s11">
								      				
								      				<div class="row">
								      					<div class="col s6 left">
								      						<strong>Document type:</strong>
								      						<%= rs.getString("dtype") %>
								      					</div>
								      					<div class="col s6">
								      						<strong>Subject:</strong>
								      						<%= rs.getString("sname") %>
								      					</div>
								      				</div>
								      				<div class="row">
								      					<div class="col s6 left">
								      						<strong>Uploaded By:</strong>
								      						<%= rs.getString("f_id") %>
								      					</div>
								      				</div>
								      				<div class="row">
								      					<div class="col s6 left">
								      						<strong>Document size:</strong>
								      						<%= rs.getDouble("dsize") %>MB
								      					</div>
								      				</div>				      				
								      			</div>
								      			<div class="col s1">
									      			<% if(uid.equals(rs.getString("f_id"))){%>
									      				<a href='deletefile?did=<%= rs.getString("d_id") %>' class="btn-floating white" title="Delete file"><i class="material-icons black">delete</i></a>
								      				<%} %>
								      			</div>
						      				</div>
						      				<div class="divider"></div>
						      				<div class="row"></div>
						      					<form action="downloadfile" method="post">
						      						<input type="hidden" name="fnm" value='<%= rs.getString("dname") %>'/>
						      						<button class="btn  grey darken-3" id="submit" type="submit" name="action">Download
														<i class="material-icons right">get_app</i>
													</button>
						      					</form>
								      	</div>
								    </li>
								<%}
							}
							catch(Exception ex){} 
							
						%>
					</ul>
		  		</div>
			</div>
		</div>
	</div>
</body>
</html>