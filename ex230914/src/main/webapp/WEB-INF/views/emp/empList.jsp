<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 사원 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Check</th>
				<th>employee_id</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>email</th>
				<th>hire_date</th>
				<th>job_id</th>
				<th>salary</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="emp" items="${empList }">
				<tr>
					<td><input type="checkbox"></td>
					<td>${emp.employeeId }</td>
					<td>${emp.firstName }</td>
					<td>${emp.lastName }</td>
					<td>${emp.email }</td>
					<td><fmt:formatDate value="${emp.hireDate }" pattern="yyyy-MM-dd"/></td>
					<td>${emp.jobId }</td>
					<td>${emp.salary }</td>
					<td><button type="button">Del</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		//컴파일 순서 : jsp -> servlet -> java => html => html -> css -> javascript
			
 		let message = [ 
					  	<c:forEach begin="1" end="5">
							`${result}`,
						</c:forEach>
					  ];
		
		if(message.length > 0) alert(message.toString());  
	
		$('tbody > tr').on('click',function(e){
			if(e.target.tagName != 'TD') return;

			//let empId = e.currentTarget.firstElementChild.nextElementSibling.textContent;
			let empId = $(e.currentTarget).find('td:nth-of-type(2)').text(); // eq(1)
			location.href= 'empInfo?employeeId='+ empId;
		})
	</script>
</body>
</html>