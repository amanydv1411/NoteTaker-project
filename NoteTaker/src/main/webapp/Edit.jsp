<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="css/mystyle.css">
<title>Edit Note</title>
</head>
<body>

<%
	int note_id=Integer.parseInt(request.getParameter("note_id"));
	Session s=FactoryProvider.getFactory().openSession();
	Note note=s.get(Note.class,note_id);
%>
		
 		<div class="container">
 		<%@include file="navbar.jsp" %>
 		<br>
 		<h1 class="text-uppercase">edit notes:</h1>
		<br>
		
 		<form action="Edit_servlet" method="Post">
 		<input value="<%=note_id%>" name="note_id" type="hidden">
		<div class="form-group">
			<label for="exampleInputEmail1"><b>Tittle:<b></b></label> <input type="text"
				class="form-control" id="tittle"
				aria-describedby="emailHelp" name="tittle" placeholder="Enter tittle" required
				value="<%=note.getTittle() %>">

		</div>
		<div class="form-group">
			<label for="content"><b>Note Content:<b></b></label> 
			<textarea rows="5" id="content" name="content" placeholder="Enter the content" class="form-control" required><%=note.getContent() %></textarea>
		</div>
		
		<button type="submit" class="btn btn-primary">SAVE</button>
	</form>
 		</div> 	
 </div>
</body>
</html>