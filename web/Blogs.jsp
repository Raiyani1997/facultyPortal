<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession" %>

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
			$('.modal').modal();
			$('#modal1').modal('close');
			$('#blg').click(function(){
				$('#modal1').modal('open');	
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
	<div class="row">
		<div class="col s1"></div>
		<button class="btn waves-effect  #757575 grey darken-1 center" id="blg" type="button" >Add Blogs
			<i class="material-icons right">burst_mode</i>
		</button>
	</div>
	
	<div id="modal1" class="modal modal-fixed-footer" style="width: 600px;height: 495px; padding-top: 20px; ">
		<form action="addblogs" method="post" id="addblog" enctype="multipart/form-data">
	    <div class="modal-content">
			<div class="row"></div>
			<div class="row">
				<div class="col s12 center">
		            <h5><b>Blog</b></h5>
		        </div>
			</div>
			
			<div class="row"></div>

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
							<input name="filenm" class="file-path validate " type="text" placeholder="select photo">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s1"></div>
		        	<div class="input-field col s10">
		          		<i class="material-icons prefix">mode_edit</i>
		          		<textarea id="detail" name="detail" class="materialize-textarea"></textarea>
		          		<label for="detail">Details</label>
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
	</div>
	<%
            //HttpSession ession1 = request.getSession();
            //String uid = ession1.getAttribute("uid").toString(); 
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
            String sql = "select b_id,f_id,subject,details,TO_CHAR(postdate,'MON DD, YYYY') as postdate,photo,liked,unliked from blogs";
            PreparedStatement ps = con.prepareStatement(sql);

            try {
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {%>
                    <div class="row"></div>
                    <div class="container z-depth-2 white " style="width:1000px">
                        <div class="row">
                        <div class="col s1"></div>
                        <div class="col s8">
                            <div class="row"></div>
                            <div class="row"></div>

                            
                            <div class="row">
                                <div class="col s3"><strong class="left"><b>Subject:</b></strong></div><div class="col s1"><%=rs.getString("subject")%></div>
                            </div>
                            <div class="row">
                                <div class="col s3"><strong class="left"><b>Posted By:</b></strong></div><div class="col s1"><%=rs.getString("f_id")%></div>
                                <div class="col s1"></div>
                                <div class="col s3"><strong class="left"><b>Posted date:</b></strong></div><div class="col s3"><%=rs.getString("postdate")%></div>
                            </div>
                            <div class="row">
                                <div class="col s3"><strong class="left"><b>Details:</b></strong></div><%=rs.getString("details")%>
                            </div>
                            <div class="row">
                                <div class="col s2"><a href='likeblog?bid=<%=rs.getInt("b_id")%>&like=true'><i class="material-icons left green-text">thumb_up</i></a><%=rs.getInt("liked")%></div>
                                <div class="col s1"></div>
                                <div class="col s2"><a href='likeblog?bid=<%=rs.getInt("b_id")%>&like=false'><i class="material-icons left red-text">thumb_down</i></a><%=rs.getInt("unliked")%></div>
                            </div>
                        </div>
                        <div class="col s2">
                                <div class="row"></div>
                                <img src='<%=rs.getString("photo")%>' style="width: 200px;height: 200px;border-radius: 50%;" />
                                <div class="row"></div>
                        </div>
                        </div>
                    </div>
                <%}
            }
            catch(Exception e){}%>
</body>
</html>