<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("${message }");
	    window.history.back(); // 이전 페이지로 이동
	    location.reload(); // 페이지 새로고침
	</script>
</body>
</html>