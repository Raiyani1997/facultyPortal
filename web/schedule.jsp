<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
    <title>Faculty Portal</title>
    <link rel="icon" href="photo/download.jpg" type="image/jpg"/>
	<link rel="stylesheet" href="materialize/css/materialize.min.css">
	<link rel="stylesheet" href="materialize/css/materialize.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="js/jquery.js"></script>
	<script src="materialize/js/materialize.js"></script>
	<script src="materialize/js/materialize.min.js"></script>
	
        <%
            HttpSession ession1 = request.getSession();
            String u = ession1.getAttribute("role").toString();
            if(u.equals("admprof")){%>
            <script src="js/timetable.js"></script>
            <script src="js/test.js"></script>
	<%}%>
	<script type="text/javascript">
		var c = "";
		$(document).ready(function(){
                    $(".dropdown-button").dropdown();
                    $(".dropdown-button2").dropdown();
                    $('.modal').modal();
                    $('#modal1').modal('close');
                    $('#modal2').modal('close');    		
                    $('input.batch').autocomplete({
                        data:{
                            "C1":null,
                            "C2":null,
                            "C3":null,
                            "C4":null,
                            "D1":null,
                            "D2":null,
                            "D3":null,
                            "D4":null,
                        }
                    });
                    <%              
                        String uid = ession1.getAttribute("uid").toString();
                    %>
                        $('.tag').html('<%=uid%><i class="material-icons right">arrow_drop_down</i>');
  		});
	</script>
	
	<style>
		.col{
			height:15%;
			text-align:center;
		}
		.form1{
			display:none;
		}
		.form2{
			display:none;
		}
		#submit{
			display:none;
		}
	</style>
</head>
<body>

	<%
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
	<div class="row" style="padding-right:100px;">
	<div class="center container z-depth-2 grey lighten-3" style="width:1000px;height:50px;padding-top:10px;">
            <div class="day1 blue-grey-text"><b><%=request.getParameter("msg")%></b></div>
	</div>
	</div>
	<div class="row"></div>
	
	<div id="modal1" class="modal modal-fixed-footer" style="width: 600px;height: 495px; padding-top: 20px; ">
	    <div class="modal-content">
			<div class="row"></div>
			<div class="row">
				<div class="col s12 center">
		            <h5><b>Lecture</b></h5>
		        </div>
			</div>
			
			<div class="row"></div>

			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s10">
					<i class="material-icons prefix">perm_identity</i>
					<input id="facname" list="facultynm" type="text" value="" class="validate faculty">
					<label for="facname">Faculty Name</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>
				<div class="input-field col s10">
					<i class="material-icons prefix">book</i>
					<input id="theorysub" list="subjectnm" type="text" value="" class="validate subject">
					<label for="theorysub">Subject Name</label>
				</div>
			</div>
			<div class="row center">
				<button class="btn waves-light" type="submit" id="action1" >Submit
					<i class="material-icons right">send</i>
				</button>
			</div>
			<div class="row"></div>
		</div>
	</div>

	<div id="modal2" class="modal " style="width: 900px;padding-top: 30px;">
	    <div class="modal-content">
		
			
			<div class="row">
				<div class="col s12 center">
		            <h5><b>Laboratory</b></h5>
		        </div>
			</div>
			<div class="row"></div>
			<div class="row">
				<div class="col s1"></div>	
				<div class="input-field col s2">
					<i class="material-icons prefix">featured_play_list</i>
					<input id="labbat1"  type="text" class="validate batch">
					<label for="labbat1">Batch1</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">book</i>
					<input id="labsub1" list="subjectnm" type="text" class="validate">
					<label for="labsub1">Subject1</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">perm_identity</i>
					<input id="facname1" type="text" list="facultynm" class="validate">
					<label for="facname1">Faculty1</label>
				</div>
				<div class="input-field col s2">
					<i class="material-icons prefix">location_on</i>
					<input id="labloc1" type="text" list="labnm" class="validate lab">
					<label for="labloc1">Location1</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>	
				<div class="input-field col s2">
					<i class="material-icons prefix">featured_play_list</i>
					<input id="labbat2"  type="text" class="validate batch">
					<label for="labbat2">Batch2</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">book</i>
					<input id="labsub2" type="text" list="subjectnm" class="validate">
					<label for="labsub2">Subject2</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">perm_identity</i>
					<input id="facname2" type="text" list="facultynm" class="validate">
					<label for="facname2">Faculty2</label>
				</div>
				<div class="input-field col s2">
					<i class="material-icons prefix">location_on</i>
					<input id="labloc2" type="text" list="labnm" class="validate lab">
					<label for="labloc2">Location2</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>	
				<div class="input-field col s2">
					<i class="material-icons prefix">featured_play_list</i>
					<input id="labbat3"  type="text" class="validate batch">
					<label for="labbat3">Batch3</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">book</i>
					<input id="labsub3" type="text" list="subjectnm" class="validate">
					<label for="labsub3">Subject3</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">perm_identity</i>
					<input id="facname3" type="text" list="facultynm" class="validate">
					<label for="facname3">Faculty3</label>
				</div>
				<div class="input-field col s2">
					<i class="material-icons prefix">location_on</i>
					<input id="labloc3" type="text" list="labnm" class="validate lab">
					<label for="labloc3">Location3</label>
				</div>
			</div>
			<div class="row">
				<div class="col s1"></div>	
				<div class="input-field col s2">
					<i class="material-icons prefix">featured_play_list</i>
					<input id="labbat4" type="text"  class="validate batch">
					<label for="labbat4">Batch4</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">book</i>
					<input id="labsub4" type="text" list="subjectnm" class="validate">
					<label for="labsub4">Subject4</label>
				</div>
				<div class="input-field col s3">
					<i class="material-icons prefix">perm_identity</i>
					<input id="facname4" type="text" list="facultynm" class="validate">
					<label for="facname4">Faculty4</label>
				</div>
				<div class="input-field col s2">
					<i class="material-icons prefix">location_on</i>
					<input id="labloc4" type="text" list="labnm" class="validate lab">
					<label for="labloc4">Location4</label>
				</div>
			</div>
			<div class="row center">
				<button class="btn waves-light" type="submit" id="action2">Submit
					<i class="material-icons right">send</i>
				</button>
			</div>
		</div>
	</div>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
            PreparedStatement ps;
            ResultSet rs,rs1,rs2;
            String s1="",s2="",s3="",s4[] = new String[4],days=request.getParameter("msg");
            String d[][][] = {{{"III","C"},{"III","D"},{"V","C"},{"V","D"},{"VII","C"},{"VII","D"}},{{"II","C"},{"II","D"},{"IV","C"},{"IV","D"},{"VI","C"},{"VI","D"}}};
            int q = 0,srno = 0,t;
            String color[] = {"sd white-text red","teal","cyan","amber","lime","teal","cyan","amber","lime"};
            String stime[]= {"","8:30","9:30","10:45","11:45","13:30","14:30","15:30","16:30"};
        %>
        <form action="storre" method="post">
            <div class="container center" style="margin-top:30px;width:1200px;">
                <input type="hidden" name="day" value='<%=request.getParameter("msg")%>'/> 
		<div class="row">
			<div class="col aa flow-text white-text red s3" id="0"><b>TIME/SEMESTER</b></div>
			<div class="col teal flow-text s1" id="1"><b>08.30-09.30</b></div>
			<div class="col cyan flow-text s1" id="2"><b>09.30-10.30</b></div>
			<div class="col amber flow-text s1" id="3"><b>10.45-11.45</b></b></div>
			<div class="col lime flow-text s1" id="4"><b>11.45-12.45</b></div>
			<div class="col teal flow-text s1" id="5"><b>01.30-02.30</b></div>
			<div class="col cyan flow-text s1" id="6"><b>02.30-03.30</b></div>
			<div class="col amber flow-text s1" id="7"><b>03.30-04.30</b></div>
			<div class="col lime flow-text s1" id="8"><b>04.30-05.30</b></div>
		</div>
		
                <%
                    int i,j,k;
                    for(i = 1;i<7;i++){
                %>
                    <div class="row">
                    <div class='col <%=color[0]%> s3' id='<%=(i*10)%>'><%=d[q][i-1][0]%>-<%=d[q][i-1][1]%></div>
                    <input type="hidden" class='<%=(i*10)%>' name='<%=(i*10)%>' value='<%=d[q][i-1][0]%>-<%=d[q][i-1][1]%>'/>
                    
                    <%
                        s1 = "select srno from timetable where day=? and semester=? and division=?";
                        ps = con.prepareStatement(s1);
                        ps.setString(1, days);
                        ps.setString(2, d[q][i-1][0]);
                        ps.setString(3, d[q][i-1][1]);
                        
                        try {
                                rs = ps.executeQuery();
                                while(rs.next()){
                                    srno = rs.getInt("srno");
                                }
                        }
                        catch(Exception e){}
                        for(j=1;j<9;j++){
                            s1 = "select * from lecture where srno = ? and stime = ?";
                            ps = con.prepareStatement(s1);
                            ps.setInt(1, srno);
                            ps.setString(2, stime[j]);
                            try{
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    s1 = "select (SUBSTR(fname,0,1) || SUBSTR(mname,0,1) ||  SUBSTR(lname,0,1)) as fname from faculty where f_id = ?";
                                    ps = con.prepareStatement(s1);
                                    ps.setString(1, rs.getString("f_id"));
                                    try{
                                        rs1 = ps.executeQuery();
                                        if(rs1.next()){
                                            s2 = rs1.getString("fname");
                                        }
                                    }
                                    catch(Exception e){}
                                    s1 = "select alias from subject where s_id = ?";
                                    ps = con.prepareStatement(s1);
                                    ps.setString(1, rs.getString("s_id"));
                                    try{
                                        rs1 = ps.executeQuery();
                                        if(rs1.next()){
                                            s3 = rs1.getString("alias");
                                        }
                                    }catch(Exception e){}
                                    %>
                                    <div class='col <%=color[j]%> s1' id='<%=((i*10)+j)%>'><%=s2%><div class="divider" style="visibility:hidden"></div><%=s3%></div>
                                    <input type="hidden" class='<%=((i*10)+j)%>' name='<%=((i*10)+j)%>' value='<%=s2%> <%=s3%>'/>
                                    <%
                                }else{

                                    s1 = "select * from lab where srno = ? and stime = ?";
                                    ps = con.prepareStatement(s1);
                                    ps.setInt(1, srno);
                                    ps.setString(2, stime[j]);
                                    try{
                                        rs = ps.executeQuery();
                                        t = 0;
                                        if(rs.next()){
                                            do{
                                                s4[t]= rs.getString("batch");
                                                s1 = "select (SUBSTR(fname,0,1) || SUBSTR(mname,0,1) ||  SUBSTR(lname,0,1)) as fname from faculty where f_id = ?";
                                                ps = con.prepareStatement(s1);
                                                ps.setString(1, rs.getString("f_id"));
                                                try{
                                                    rs1 = ps.executeQuery();
                                                    if(rs1.next()){
                                                        s4[t] += "-"+rs1.getString("fname");

                                                    }
                                                }
                                                catch(Exception e){}
                                                s1 = "select alias from subject where s_id = ?";
                                                ps = con.prepareStatement(s1);
                                                ps.setString(1, rs.getString("s_id"));
                                                try{
                                                    rs1 = ps.executeQuery();
                                                    if(rs1.next()){
                                                        s4[t] += "-"+rs1.getString("alias");
                                                    }
                                                }catch(Exception e){}
                                                s4[t]+="-"+rs.getString("location")+" ";
                                                t+=1;
                                            }while(rs.next());
                                            %>
                                            <div class='col <%=color[j]%> s2' id='<%=((i*10)+j)%>'><%=s4[0]%><div class="divider"></div><%=s4[1]%><div class="divider"></div><%=s4[2]%><div class="divider"></div><%=s4[3]%></div>
                                            <input type="hidden" class='<%=((i*10)+j)%>' name='<%=((i*10)+j)%>' value='<%=s4[0]%><%=s4[1]%><%=s4[2]%><%=s4[3]%>'/>
                                            <%
                                            j+=1;
                                            %>
                                            <div class='col <%=color[j]%> s1' id='<%=((i*10)+j)%>'><%=s4[0]%><div class="divider"></div><%=s4[1]%><div class="divider"></div><%=s4[2]%><div class="divider"></div><%=s4[3]%></div>
                                            <input type="hidden" class='<%=((i*10)+j)%>' name='<%=((i*10)+j)%>' value='<%=s4[0]%><%=s4[1]%><%=s4[2]%><%=s4[3]%>'/>
                                            <script>
                                                $(document).ready(function(){
                                                    $('#<%=((i*10)+j)%>').hide();
                                                });
                                            </script>
                                            <%
                                        }
                                        else{
                                            %>
                                                <div class='col <%=color[j]%> s1' id='<%=((i*10)+j)%>'></div>
                                                <input type="hidden" class='<%=((i*10)+j)%>' name='<%=((i*10)+j)%>'/>
                                        <%}
                                    }catch(Exception e){}
                                }
                            }catch(Exception e){}
                        }%>
                    </div>
                <%}
                %>
            </div>
            <%
                String u1 = ession1.getAttribute("role").toString();
                if(u.equals("admprof")){
            %>
            <div class="container center">
                    <button class="btn waves-light" type="button" id="toggle">Toggle
                            <i class="material-icons right">loop</i>
                    </button>
                    <button class="btn waves-light" type="button" id="test">Test
                            <i class="material-icons right">verified_user</i>
                    </button>
                    <button class="btn waves-light" type="submit" id="submit">Update
                            <i class="material-icons right">update</i>
                    </button>
            </div>
            <%}%>
	</form>

        <datalist id="subjectnm">
            <% 
            String sql = "select alias from subject";
            ps = con.prepareStatement(sql);

            try {
                    rs = ps.executeQuery();
                    while(rs.next()){%>
                            <option value='<%= rs.getString("alias") %>'/>		
                    <%}
            }
            catch(Exception e){}
            %>

        </datalist>
        <datalist id="facultynm">
            <%sql = "select (SUBSTR(fname,0,1) || SUBSTR(mname,0,1) ||  SUBSTR(lname,0,1)) as fac from faculty";
            ps = con.prepareStatement(sql);

            try {
                    rs = ps.executeQuery();
                    while(rs.next()){%>
                            <option value='<%= rs.getString("fac") %>'/>		
                    <%}
            }
            catch(Exception e){}
            %>
        </datalist>
        <datalist id="labnm">
            <option value="Lab1"/>
            <option value="Lab2"/>
            <option value="Lab3"/>
            <option value="Lab4"/>
            <option value="Lab5"/>
            <option value="Lab7"/>
            <option value="Lab8"/>
        </datalist>

        <% if("<script>document.writeln(c)</script>".contains("C")){%>
            <datalist id="batchnm">
                    <option value="C1"/>
                    <option value="C2"/>
                    <option value="C3"/>
                    <option value="C4"/>
            </datalist>
        <%}
        else{ %>
            <datalist id="batchnm">
                    <option value="D1"/>
                    <option value="D2"/>
                    <option value="D3"/>
                    <option value="D4"/>
            </datalist>
        <%} %>
</body>
</html>