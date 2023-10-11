<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<h2>도서 조회/수정</h2>
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>표지</th>
				<th>출판일자</th>
				<th>금액</th>
				<th>출판사</th>
				<th>도서소개</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${bookList }">
				<tr>
					<td>${book.bookNo }</td>
					<td>${book.bookName }</td>
					<c:choose>
						<c:when test="${not empty book.bookCoverimg }">
							<td><img style="width: 20px; height: 20px;"
								src="<c:url value="/resources/images/${book.bookCoverimg }"/>"></td>
						</c:when>
						<c:otherwise>
							<td>${book.bookCoverimg }</td>
						</c:otherwise>
					</c:choose>
					<td><fmt:formatDate value="${book.bookDate }"
							pattern="yyyy/MM/dd" /></td>
					<td><fmt:formatNumber value="${book.bookPrice }" pattern = "#,###"/> </td>
					<td>${book.bookPublisher }</td>
					<td>${book.bookInfo }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>