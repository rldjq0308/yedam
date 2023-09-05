<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-12 tm-block-col">
			<div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
				<h2 class="tm-block-title">User Shipping List</h2>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">CHASE NO.</th>
							<th scope="col">CHASE USER NAME</th>
							<th scope="col">CHASE GAME ID</th>
							<th scope="col">CHASE GAME PRICE</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${shippings }" var="s">
						<tr>
							<th scope="row"><b>${autoNumber }</b></th>
							<td><div class="tm-status-circle moving"></div>${s.chaseName }</td>
							<td><div class="tm-status-circle moving"></div>${s.chaseId }</td>
							<td><div class="tm-status-circle moving"></div>${s.chasePrice } 원</td>
						</tr>
						<c:set var="autoNumber" value="${autoNumber + 1}" />
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>