<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<form:form action="/books/edit/${book.id}" method="post" modelAttribute="book">
	    <input type="hidden" name="_method" value="put">
	    <p>
	        <form:label path="bookName">Title</form:label>
	        <form:errors path="bookName"/>
	        <form:input path="bookName"/>
	    </p>
	    <p>
	        <form:label path="authorName">Author</form:label>
	        <form:errors path="authorName"/>
	        <form:textarea path="authorName"/>
	    </p>
	    <p>
	        <form:label path="description">My thoughts</form:label>
	        <form:errors path="description"/>
	        <form:input path="description"/>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form>

</body>
</html>