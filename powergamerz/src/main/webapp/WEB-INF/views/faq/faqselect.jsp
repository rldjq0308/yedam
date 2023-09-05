<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/4.jpg">
		<div class="page-info">
			<h2>Support</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / FAQ
			</div>
		</div>
	</section>
	<!-- Page top end-->
		<!-- Table Section -->
	<section class="review-section">
		<div class="container">
<div align="center">
	<div><h2 class="text-white">FAQ</h2></div><br>
	<div>
			<div style="background-color: white;">
				<table class="table table-bordered">
					<tr>
						<th width="100">작성자</th>
						<td align="center">${f.faqWriter }</td>
						<th width="100">작성일자</th>
						<td align="center">${f.faqDate }</td>
						<th width="100">작성자ID</th>
						<td align="center">${f.faqWriterId }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">
							${f.faqTitle }
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">
							<textarea id="faqSubject" name="faqSubject" cols="125" rows="20" readonly="readonly">${f.faqSubject }</textarea>
						</td>
					</tr>
				</table>
			</div><br>
			<div>
			<c:if test="${author eq 'ADMIN' }"> 
			<button type="button" class="btn btn-primary btn-jelly btn-lg" onclick="faqUpdate('E')">수정</button>
			<button type="button" class="btn btn-danger btn-jelly btn-lg" onclick="faqUpdate('D')">삭제</button>			
			</c:if>
			<button type="button" class="btn btn-light btn-jelly btn-lg" onclick="location.href='faqlist.do'">목록</button>
			</div>			
			<div>
				<form id="frm" method="post">
					<input type="hidden" id="faqId" name="faqId" value="${f.faqId }" />
				</form>
			</div>
	</div>
</div>
</div>
</section>
<script type="text/javascript">
	function faqUpdate(str){
		if(str=='E'){
			document.getElementById("frm").action = "faqeditform.do";
		}else{
			document.getElementById("frm").action = "faqdelete.do";
		}
		
		document.getElementById("frm").submit();
	}
</script>
</body>
</html>