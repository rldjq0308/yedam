<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/qna.css" />
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
				<a href="home.do">Home</a> / Contact Us
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<!-- Table Section -->
	<section class="review-section">
		<div class="container">
			<div align="center">
				<div>
					<h2 class="text-white">문의 작성</h2>
				</div>
				<br>
				<div>
					<form id="qnafrm" action="qnainsert.do" method="post">
						<div class="card">
							<div class="card-write">
								<div class="myinfo">
									이름<input type="text" id="qnaWriter" name="qnaWriter"
										value="${name }" readonly="readonly">
								</div>
								<div class="title">
									제목<input type="text" id="qnaTitle" name="qnaTitle"
										required="required">
								</div>
								<div class="msg">
									내용
									<textarea id="qnaSubject" name="qnaSubject"></textarea>
								</div>
							</div>
						</div>

						<br> <input type="hidden" id="qnaWriterId" name="qnaWriterId"
							value="${id }">
						<div>
							<button class="_1h8gH51Art N=a:qna.write" type="submit">
								작성</button>
							&nbsp;&nbsp;&nbsp;
							<button class="_1h8gH51Art _228Dp2q_V1 N=a:qna.ask" type="button"
								onclick="location.href='qnalist.do'">취소</button>
						</div>
						<br>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		document.getElementById('qnaDate').value = new Date().toISOString()
				.substring(0, 10);
		;
	</script>
</body>
</html>