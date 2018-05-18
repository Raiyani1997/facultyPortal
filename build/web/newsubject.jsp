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
	<%@include file="hodnavbar.html"%>
        <%}
    else if(u.equals("admprof")){%>
        <%@include file="adminnavbar.html"%>
        <%}
    else{%>
        <%@include file="facultynavbar.html"%>
        <%}%>
	
		<div class="row">
			<div class="col s7 center" style="padding-left:50px;"><a style="color:red" href="">${requestScope.msg}</a></div> 
		</div>
		<div class="row"></div>
		<form action="addsub" method="post" id="addblog">
	    <div class="container z-depth-2 white center" style="width: 500px">
			<div class="row"></div>
			<div class="row"></div>
			<div class="row">
				<div class="col s12 center">
		            <h5><b>Subject</b></h5>
		        </div>
			</div>
			
			<div class="row"></div>
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s6">
					<i class="material-icons prefix">local_library</i>
					<input id="scode" name="scode" type="text" class="validate">
					<label for="scode">subject code</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s10">
					<i class="material-icons prefix">book</i>
					<input id="sname" name="sname" type="text" class="validate">
					<label for="sname">subject name</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s6">
					<i class="material-icons prefix">announcement</i>
					<input id="alias" name="alias" type="text" class="validate">
					<label for="alias">Alias</label>
				</div>
			</div>
			
			<button class="btn waves-effect grey darken-3 center" id="submit" type="submit" name="action">Add
				<i class="material-icons right">send</i>
			</button>
			<div class="row"></div>
			<div class="row"></div>
			<div class="row"></div>
		</div>
		</form>
	
</body>
</html>