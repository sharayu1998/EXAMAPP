<%@ page import="com.examination.models.Users" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Authenticate</title>
</head>
<body>
	<%
		Users user = (Users) session.getAttribute("user");
		if (session.getId() != null && user != null) {
			
			if(user.getRole().equalsIgnoreCase("teacher")) {	
				response.sendRedirect("teacher.jsp");
			}else {
				response.sendRedirect("student.jsp");
			}
		}else {%>
	
	<div style="padding-top:100px; padding-left:400px; padding-right:400px;">
		<div style="float:left; ">
			<h3>Login</h3>
			<% if(request.getAttribute("msg") != null){ %>
			<p><%= request.getAttribute("msg") %></p>
			<%} %>
			<form action="authenticatorServlet" method="post">
				<input type="text" name="txtUsername" placeholder="Username:"><br><br>
				<input type="password" name="txtPassword" placeholder="Password:"><br><br>
				<button type ="submit" name="loginSubmit">Submit</button>
			</form>
		</div>
		<div style="float:  right;">
			<h3>Register:</h3>
			<% if(request.getAttribute("rmsg") != null){ %>
			<p><%= request.getAttribute("rmsg") %></p>
			<%} %>
			<form action="authenticatorServlet" method="post">
				<input type="text" name="txtName" placeholder="Username:"><br><br>
				<input type="text" name="txtUsername" placeholder="Username:"><br><br>
				<input type="password" name="txtPassword" placeholder="Password:"><br><br>
				<label for="drpRole">Role:<br></label>
				
				<select name="drpRole" style="width:100%">
				    <option value="select" selected>--Select--</option>
				    <option value="teacher">Teacher</option>
				    <option value="student">Student</option>
			 	</select><br><br>
			 	
				<button type ="submit" name="regSubmit">Submit</button>
			</form>
		</div>
	</div>
	
	<%		
		}
	%>
</body>
</html>