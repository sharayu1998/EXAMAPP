<%@ page import="com.examination.models.Users" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "custom" uri = "/WEB-INF/custom.tld"%>
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
	.question-card{
		margin: 10px;
		padding:20px;
		background-color:white;
		border-radius:5px;
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
		<form action="" method="post">
			<button type="submit" class="btn btn-primary" name="startExam" id="btn-start-exam">Attempt Exam</button>
		</form>
	
		<%
			if(request.getParameter("startExam") != null){%>
			<custom:dispExam/>	
		<%}
		%>
	
	<%}}else{
		response.sendRedirect("authenticate.jsp");
	}	
	%>
	
</body>
</html>