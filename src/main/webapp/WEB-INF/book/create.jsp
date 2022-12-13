<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
	<form:form action="/books/new" method="post" modelAttribute="book">
		<form:input type="hidden" path="reader" value="${user_id}"/>
	    <p>
	        <form:label path="bookName">Title</form:label>
	        <form:errors path="bookName" class="text-danger"/>
	        <form:input path="bookName"/>
	    </p>
	    <p>
	        <form:label path="authorName">Author</form:label>
	        <form:textarea path="authorName"/>
	        <form:errors path="authorName" class="text-danger"/>
	    </p>
	    <p>
	        <form:label path="description">My thoughts</form:label>
	        <form:input path="description"/>
	        <form:errors path="description" class="text-danger"/>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form>   
</body>
</html>