<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    <div class="row"><div class="col s7 center" style="padding-left:50px;"><a style="color:red" href="">${requestScope.message}</a></div> </div>
    <form action="sendMail" method="post">   
        <div class="container center" style="width: 1000px;">
            <div class="row"></div>
            
            <div class="row">
                <div class="row">
                    <div class="col s12 center">
                        <h5><b>Notice</b></h5>
                    </div>
                </div>
            </div>
            
            
            
            <div class="row">
                <div class="col s1"></div>
                <div class="input-field col s5">
                    <i class="material-icons prefix"><b>T</b></i>
                    <input id="title" name="title" type="text" class="validate">
                    <label for="title">Title</label>
                </div>
            </div>
            
            <div class="row">
                <div class="col s1"></div>
                <div class="input-field col s5">
                    <i class="material-icons prefix">import_contacts</i>
                    <input id="sub" name="sub" type="text" class="validate">
                    <label for="sub">Subject</label>
                </div>
            </div>
            
            <div class="row">
                <div class="col s1"></div>
                <div class="input-field col s10">
                    <i class="material-icons prefix">description</i>
                    <textarea id="desc" name="desc" class="materialize-textarea"></textarea>
                    <label for="desc">Description</label>
                </div>
            </div>
            <div class="row"></div>
            <div class="row"></div>
            <div class="row"></div>
            <div class="row">
                <button class="btn waves-effect waves-light grey darken-3" id="submit" type="submit" name="action">Send
                    <i class="material-icons right">send</i>
                </button>
            </div>
            <div class="row"></div>
            <div class="row"></div>
            <div class="row"></div>
        </div>
    </form>
</body>
</html>