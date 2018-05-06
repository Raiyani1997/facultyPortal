<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

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
        <%             
            if(u.equals("hod")){%>
            <div class="row"></div>
            <div class="row">
		<div class="col s10">
                    <div class="row">			
                        <div class="col s10">
                            <ul class="collapsible popout" data-collapsible="accordion">
                                <li>
                                    <div class="collapsible-header"><i class="material-icons">library_books</i>Leave</div>
                                    <%
                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
                                        String sql = "select l_id,f_id,type,TO_CHAR(startdate,'MON DD, YYYY') as startdate,TO_CHAR(enddate,'MON DD, YYYY') as enddate,totaldays,reason from leave where status = ?";
                                        PreparedStatement ps = con.prepareStatement(sql);
                                        ps.setString(1, "false");
                                        try {
                                            ResultSet rs = ps.executeQuery();
                                            while(rs.next()){%>
                                        
                                                <div class="collapsible-body">
                                                    <div class="row">
                                                        <div class="col s6 left">
                                                            <strong>Faculty Id:</strong>
                                                            <%= rs.getString("f_id") %>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col s6 left">
                                                            <strong>Leave Type:</strong>
                                                            <%= rs.getString("type") %>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col s6 left">
                                                            <strong>Start Date:</strong>
                                                            <%= rs.getString("startdate") %>
                                                        </div>
                                                        <div class="col s6">
                                                            <strong>End Date:</strong>
                                                            <%= rs.getString("enddate") %>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col s6 left">
                                                            <strong>Total Days:</strong>
                                                            <%= rs.getString("totaldays") %>
                                                        </div>
                                                    
                                                        <div class="col s6">
                                                            <strong>Reason:</strong>
                                                            <%= rs.getString("reason") %>
                                                        </div>
                                                    </div>
                                                    <div class="divider"></div>
                                                    <div class="row"></div>
                                                    <div class="row">
                                                        <div class="col s2 left">
                                                            <a class="btn waves-effect grey darken-1" href='gordleave?l_id=<%= rs.getInt("l_id")%>&result=grant'>Grant</a>
                                                        </div>
                                                        <div class="col s6 ">
                                                            <a class="btn waves-effect grey darken-1" href='gordleave?l_id=<%= rs.getInt("l_id")%>&result=decline'>Decline</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            <%}
                                        }
                                        catch(Exception ex){} 			
                                    %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <%}
        %>
        <div class="row">
            <%
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
                String sql = "select * from notice";
                PreparedStatement ps = con.prepareStatement(sql); 
                try{
                    ResultSet rs = ps.executeQuery();
                    if(rs.next()){
                        do{%>
                            <div class="row">
                                <div class="col s10">
                                    <div class="row">			
                                        <div class="col s10">
                                            <ul class="collapsible popout" data-collapsible="accordion">
                                                <li>
                                                    <div class="collapsible-header"><i class="material-icons">note</i><Strong class="">Notice</strong>&nbsp;on <%=rs.getString("title")%></div>
                                                    <div class="collapsible-body">
                                                        <div class="row">
                                                        <div class="col s1"></div>
                                                        <div class="col s10">
                                                            <div class="row center blue-grey-text"><b><%=rs.getString("subject")%></b></div>
                                                            <div class="row"><p><%=rs.getString("data")%></p></div>
                                                            <div class="row">
                                                                <div class="col s5 left">
                                                                    <strong>Send Date:</strong>
                                                                    <%= rs.getString("senddate") %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%}while(rs.next());
                    }
                }
                catch(Exception e){}
            %>
        </div>
</body>
</html>