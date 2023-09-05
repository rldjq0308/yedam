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
		var page = "${reviewPage}";
		var pageId = "${reviewPageId}";

		var pagePath = "${reviewPagePath}";
		
		alert("${message }");
		if(page != null && pageId != null){
		location.href = page+"?"+pagePath+"="+pageId;
		}
	</script>
</body>
</html>