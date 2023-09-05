<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/2.jpg">
		<div class="page-info">
			<h2>Community</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / Discussion
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<section class="review-section">
		<div class="container" align="center">
			<div align="center">
				<h1 class="text-white">${message }</h1>
			</div>
		</div>
	</section>
	
	<script type="text/javascript">
		alert("${message }");
		location.href = "postlist.do";
	</script>
</body>
</html>