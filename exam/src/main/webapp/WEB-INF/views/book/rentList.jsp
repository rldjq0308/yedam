<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>대여총계</th>
				<th>대여횟수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rent" items="${rentList }">
				<tr>
					<td style="text-align:center">${rent.bookNo }</td>
					<td>${rent.bookName }</td>
					<td align="right">${rent.price }</td>
					<td align="right">${rent.tot }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>