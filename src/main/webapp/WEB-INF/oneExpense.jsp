<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>

</head>
<body>
	<h2>Expense Details</h2>
	<p> Expense Name: <c:out value="${expense.expenseName}"/></p>
	<p> Vendor: <c:out value="${expense.vendor}"/></p>
	<p> Amount: <c:out value="${expense.amount}"/></p>
	<p> Description: <c:out value="${expense.description}"/></p>
	<a href="/expenses">Go Back</a>
</body>
</html>