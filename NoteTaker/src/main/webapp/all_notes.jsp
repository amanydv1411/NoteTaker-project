<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">all notes:</h1>

		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				String query = "from Note";
				Query q = s.createQuery(query);
				List<Note> al = q.list();
				for (Note nt : al) {
				%>
				<div class="card border-primary mb-3 mt-3">
					<img class="card-img-top" src="img/pencil.png" alt="Card image cap" style="max-width:60px" >
					<div class="card-body">
						<h5 class="card-title"><%=nt.getTittle() %></h5>
						<p class="card-text"> <%=nt.getContent() %></p>
						<a href="Delete_servlet?note_id=<%=nt.getId() %>" class="btn btn-danger">Delete</a>
						<a href="Edit.jsp?note_id=<%=nt.getId() %>" class="btn btn-primary">Edit</a>
					</div>
				</div>
				<%
				}
				s.close(); 
				%>
			</div>
		</div>

	</div>
</body>
</html>