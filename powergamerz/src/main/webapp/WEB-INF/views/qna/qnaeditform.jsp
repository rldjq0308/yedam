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
				<a href="home.do">Home</a> / <span>Q&A</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<!-- Table Section -->
	<section class="review-section">
		<div class="container">
			<div align="center">
				<div>
					<h2 class="text-white">문의내용 수정</h2>
				</div>
				<br>
				<div>
					<form id="frm" action="qnaedit.do" method="post">
						<div class="card">
							<div class="card-edit">
								<div class="myinfo">
									이름<input type="text" id="qnaWriter" name="qnaWriter"
										value="${q.qnaWriter }" readonly="readonly">
								</div>
								<div class="title">
									제목<input type="text" id="qnaTitle" name="qnaTitle"
										value="${q.qnaTitle }" />
								</div>
								<div class="msg">
									내용
									<textarea id="qnaSubject" name="qnaSubject"
										value="${q.qnaSubject }">
											</textarea>
								</div>
							</div>
						</div>
				</div>
				<br>
				<div>
					<button class="_1h8gH51Art N=a:qna.write" type="submit">
						수정</button>
					&nbsp;&nbsp;&nbsp;
					<button class="_1h8gH51Art _228Dp2q_V1 N=a:qna.ask" type="button"
						onclick="location.href='qnalist.do'">취소</button>
				</div>
				<input type="hidden" id="qnaId" name="qnaId" value="${q.qnaId }" />
				</form>				
			</div>
		</div>
	</section>
</body>
</html>