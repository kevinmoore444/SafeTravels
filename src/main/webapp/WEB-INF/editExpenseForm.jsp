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
	<div class="form">
		<h1>Edit An Expense</h1>
		<a href="/expenses">Go Back</a>
		<form:form action="/expenses/edit/${expense.id}" method="post" modelAttribute="expense">
		<input type="hidden" name="_method" value="PUT"/>
    	<p>
        <form:input style="text-align: center" path="expenseName" placeholder="Expense Name"/>
        <br/>
        <form:errors style="color:red" path="expenseName"/>
    	</p>
    	<p>
        <form:input style="text-align: center" path="vendor" placeholder="Vendor"/>
        <br/>
        <form:errors style="color:red" path="vendor"/>
    	</p>
    	<p>
        <form:input style="text-align: center" type="number" path="amount" placeholder="Amount"/>
        <br/>
        <form:errors style="color:red" path="amount"/>
    	</p>
    	<p>
        <form:textarea style="text-align: center" path="description" placeholder="Description"/>
        <br/>
        <form:errors style="color:red" path="description"/> 
    	</p>    
    	<input class="btn btn-primary" type="submit" value="Submit"/>
		</form:form>    
	</div>	





</body>
</html>