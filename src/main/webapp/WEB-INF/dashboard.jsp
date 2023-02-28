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
	<!-- View Expenses Table -->
	<div class="content">
		<h1>Save Travels</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachExpense" items="${expenseList}">
					<tr>
						<td style="vertical-align: middle"><a href="/expenses/${eachExpense.id}"><c:out value="${eachExpense.expenseName}"/></a></td>
						<td style="vertical-align: middle"><c:out value="${eachExpense.vendor}"/></td>
						<td style="vertical-align: middle">$<c:out value="${eachExpense.amount}"/></td>
						<td style="display: flex; vertical-align: middle"><a href="/expenses/edit/${eachExpense.id}"><button style="margin-right: 10px; font-size:8px" class="btn btn-warning">edit</button></a> 
							<form action="/expenses/${eachExpense.id}" method="post">
	    						<input type="hidden" name="_method" value="delete">
	    						<button style="font-size:8px" class="btn btn-danger">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!--Create New Expense Form  -->
	<div class="form">
		<h1>Add An Expense</h1>
		<form:form action="/expenses" method="post" modelAttribute="expense">
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