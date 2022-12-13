<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<h1><c:out value="${book.bookName}"/></h1>
	
	<h2><c:out value="${book.reader.userName}"/> read <c:out value="${book.bookName}"/> by <c:out value="${book.authorName}"/></h2>
	
	<h2>Here are <c:out value="${book.reader.userName}"/>'s thoughts</h2>
	
	<hr>
	<p> <c:out value="${book.description}"/></p>
	<hr>
	
	<c:if test="${book.reader.id == user_id}">
		<a class="btn btn-dark btn-outline-warning" href="/books/edit/${book.id}">Edit</a>
		<form action="/books/delete/${book.id}" method="post">
			<input type="hidden" value="delete" name="_method"/>
			<input type="submit" value="Delete" class="btn btn-danger"/>
		</form>
	</c:if>
</body>
</html>