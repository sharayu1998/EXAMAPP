<%@page import="com.examination.models.Marks"%>
<%@page import="com.examination.controller.MarksCrud"%>
<%@ page import="com.examination.models.Users" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	body{
	background-color: #E6E6E6;
	}
	
	a.btn, button.btn {
		display:inline-block;
	}
	
</style>
</head>
<body>
	
	<%	Users user = (Users) session.getAttribute("user");
	if (user != null) {
		
		if(user.getRole().equalsIgnoreCase("teacher")) {
			response.sendRedirect("teacher.jsp");
		}else {		
	%>
	<a href="exam.jsp" class="btn btn-primary">Exam</a>
	<form action="" method="post" class="btn">
		<button type="submit" class="btn btn-primary" name="btn-logOut">Log Out</button>
	</form>
	
	<h2>Welcome <%= user.getName() %></h2>
	<%
		
		Marks mark = MarksCrud.getMarksBySid(user.getUserid());
		if(mark.getSid().equals("none")){%>
			
			<h3>Attempt the exam to get your Score</h3>
			
		<%}else{
	%>
	<h3>Your Current Score is <%= mark.getMarks() %></h3>
		<%} %>
		
	<% } %>
	<%}else{
		response.sendRedirect("index.jsp");
	}
	%>
	
	<%
	if(request.getParameter("btn-logOut") != null){
		session.invalidate();
		response.sendRedirect("index.jsp");
		
	}
	%>
	
</body>
</html>