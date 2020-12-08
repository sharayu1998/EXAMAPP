<%@ page import="com.examination.models.Users" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "custom" uri = "/WEB-INF/custom.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Portal</title>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	.nav-links{
		display:inline-block;
	}
	
	body{
	background-color: #E6E6E6;
	}
	.question-card{
		margin: 10px;
		padding:20px;
		background-color:white;
		border-radius:5px;
	}
	#insert-form,#update-form{	
		display:none;	
	}
	
	#insert-form input,#update-form input{
		display:block;
		margin:auto;
	}
	
	.insert-form-container, .update-form-container{
		margin:auto;
		padding:20px;
		background-color:white;
		border-radius:5px;
		max-width:350px;
		text-align:center;
	}
	.marks-container{
		margin:auto;
		padding:20px;
		background-color:white;
		border-radius:5px;
		max-width:550px;
		text-align:center;
	}
	}
	table{
		text-align:left;
	}
	
	table tr th, table tr td{
		padding:2px 100px;
	}
	
	.srno{
		padding:5px;
	}
	
	
	

</style>
</head>
<body>
	<%	Users user = (Users) session.getAttribute("user");	
		if(user != null){
		
			if(user.getRole().equalsIgnoreCase("teacher")) {
				
	%>
	
	<h2>Welcome <%= user.getName() %> teacher</h2>
		
		
	<form action="" method="post" class="nav-links">
		<button type="submit" class="btn btn-primary" name="btn-display-questions">Show All Questions</button>
	</form>
	<form action="" method="post" class="nav-links">
		<button type="submit" class="btn btn-primary" name="btn-display-student-marks">Show Student Marks</button>
	</form>
	<button class="nav-links btn btn-primary"   id="btn-insert-questions">Insert</button>
	<button class="nav-links btn btn-primary"   id="btn-update-questions">Update</button>
	<form action="" method="post" class="nav-links">
		<button type="submit" class="btn btn-primary" name="btn-logOut">Log Out</button>
	</form>
	<section id="insert-form">
		<div class="container insert-form-container">
			<button class="btn btn-secondary" id="close-insert-form" style="float:right; margin-right:5px;">X</button><br>
				<h3>Insert Form:</h3><br>
				<form action="teacherServlet" method="post">
					<input type="text" name="txtQid" placeholder="QuestionID:"><br>
					<input type="text" name="txtQuestion" placeholder="Question:"><br>
					<input type="text" name="txtOption1" placeholder="Option 1:"><br>
					<input type="text" name="txtOption2" placeholder="Option 2:"><br>
					<input type="text" name="txtOption3" placeholder="Option 3:"><br>
					<input type="text" name="txtOption4" placeholder="Option 4:"><br>
					<input type="text" name="txtCorrectAnswer" placeholder="Correct Answer:"><br>
					<button class="btn btn-primary" type="submit" name="btn-insert-submit">Submit</button>
				</form>
			</div>
	</section>
	
	<section id="update-form">
		<div class="container update-form-container">
			<button class="btn btn-secondary" id="close-update-form" style="float:right; margin-right:5px;">X</button><br>
				<h3>Update Form:</h3><br>
				<form action="teacherServlet" method="post">
					<input type="text" name="txtQid" placeholder="QuestionID:"><br>
					<input type="text" name="txtQuestion" placeholder="Question:"><br>
					<input type="text" name="txtOption1" placeholder="Option 1:"><br>
					<input type="text" name="txtOption2" placeholder="Option 2:"><br>
					<input type="text" name="txtOption3" placeholder="Option 3:"><br>
					<input type="text" name="txtOption4" placeholder="Option 4:"><br>
					<input type="text" name="txtCorrectAnswer" placeholder="Correct Answer:"><br>
					<button class="btn btn-primary" type="submit" name="btn-update-submit">Submit</button>
				</form>
			</div>
	</section>
	
	
		<%
		if(request.getParameter("btn-display-questions") != null){
		%>	
			<custom:dispQuestions/>
		<%}else if(request.getParameter("btn-display-student-marks") != null){%>
			<custom:dispStudentMarks/>
		<%}else if(request.getParameter("btn-logOut") != null){
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
			%>
		
	
	<%}else{
		response.sendRedirect("student.jsp");
	}%>
	
<%} else {
	response.sendRedirect("index.jsp");
}
	%>

	
	
</body>
</html>