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
				<div>
					<h2 class="text-white">게시글 수정</h2>
				</div><br>
				<div>
					<form id="frm" action="faqedit.do" method="post">
						<div style="background-color: white;">
							<table class="table table-bordered">
								<tr>
									<th width="100">작성자</th>
									<td><input type="text" id="faqWriter" name="faqWriter"
										value="${f.faqWriter }" readonly="readonly" /></td>
									<th width="100">작성일자</th>
									<td><input type="date" id="faqDate" name="faqDate"
										value="${f.faqDate }" /></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input size="125" type="text" id="faqTitle"
										name="faqTitle" value="${f.faqTitle }" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><textarea id="faqSubject"
											name="faqSubject" cols="125" rows="20">${f.faqSubject }</textarea>
									</td>
								</tr>
							</table>
						</div>
						<br>
						<div>
							<button class="btn btn-primary btn-jelly btn-lg" type="submit">
								수정
							</button>
							<button class="btn btn-danger btn-jelly btn-lg" type="button"
								onclick="location.href='faqlist.do'">
								취소
							</button>
						</div>
						<input type="hidden" id="faqId" name="faqId" value="${f.faqId }" />
					</form>
					<div></div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>