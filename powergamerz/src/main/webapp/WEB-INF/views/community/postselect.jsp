<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.review_edit_text_area {
	width: calc(100% - 20px);
	height: 200px;
	border: 1px solid #233c51;
	border-radius: 3px;
	max-width: 800px;
	background-color: #222b35;
	color: #d6d7d8;
	padding: 10px 11px;
	font-size: 13px;
	font-weight: normal;
	-webkit-box-shadow: inset 0px 0px 7px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: inset 0px 0px 7px rgba(0, 0, 0, 0.5);
	box-shadow: inset 0px 0px 7px rgba(0, 0, 0, 0.5);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/boardview.css" rel="stylesheet" type="text/css">
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

	<!-- Table section -->
	<section class="review-section">
		<div class="container">

			<div class="card">
				<div class="card-view">
					<div class="title">
						<h3>${p.postTitle }</h3>
					</div>
					<div class="myinfo">
						<dl>
							<dt>작성자</dt>
							<dd>${p.postWriter }</dd>
						</dl>
						<dl>
							<dt>날짜</dt>
							<dd>${p.postCreateDate }</dd>
						</dl>
						<dl>
							<dt>조회수</dt>
							<dd>${p.postHit }</dd>
						</dl>
					</div>
					<div class="cont">
						<c:if test="${not empty p.postAttach }">
							<img src="attach/post/${p.postAttach }"
								style="width: 500px; height: 300px;">
						</c:if>
						${p.postSubject }
					</div>
				</div>
			</div>
			<div align="center">
				<c:if test="${id eq p.postWriterId || author eq 'ADMIN' }">
					<button type="button" class="btn btn-primary btn-jelly btn-lg"
						onclick="postUpdate('E')">수정</button>
					<button type="button" class="btn btn-danger btn-jelly btn-lg"
						onclick="postUpdate('D')">삭제</button>
				</c:if>
				<button type="button" class="btn btn-light btn-jelly btn-lg"
					onclick="location.href='postlist.do'">목록</button>
			</div>
			<div>
				<form id="frm" method="post">
					<input type="hidden" id="postId" name="postId" value="${p.postId }" />
				</form>
			</div>

		</div>
	</section>
	<!-- End Table section -->

	<!-- review section -->
	<section class="game-author-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>

						<c:forEach items="${reviewlist }" var="r">
							<c:if test="${r.reviewLocation eq p.postReview }">
								<input type="hidden" id="reviewId" name="reviewId"
									value="${r.reviewId }">
								<div class="anime__review__item">
									<div class="anime__review__item__pic">
										<img src="usertemplet/img/review/1.jpg" alt="">
									</div>
									<div class="anime__review__item__text">
										<h6>
											${r.memberName } - <span>${r.reviewDate }</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
											<c:if test="${id eq r.memberId || author eq 'ADMIN'}">
												<a class="general_btn panel_btn" href="#"
													onclick="toggleEditForm('${r.reviewId}')"> <img
													class="toolsIcon"
													src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_edit.png">
													Edit
												</a>

												<a class="general_btn panel_btn" href="#"
													onclick="reviewDelete('${r.reviewId}')"> <img class="toolsIcon"
													src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_delete.png">
													Delete
												</a>
												<form action="reviewdelete.do" method="post" id="deleteform">
													<input type="hidden" name="reviewId" value="${r.reviewId}">
													<input type="hidden" name="reviewPage"
														value="${p.postPage }"> <input type="hidden"
														name="reviewPageId" value="${p.postId }"> <input
														type="hidden" name="reviewPagePath" value="postId">
												</form>

											</c:if>
										</h6>
										<div id="editForm_${r.reviewId}" style="display: none;">
											<form action="reviewedit.do" method="post">
												<input type="hidden" name="reviewId" value="${r.reviewId}">
												<textarea placeholder="Your Comment" name="reviewComment"
													class="review_edit_text_area" maxlength="400" rows="2"
													cols="30" autofocus>${r.reviewComment}</textarea>
												<button type="submit" class="button condensed save">저장</button>
												<button type="button" class="button condensed cancel"
													onclick="cancelEdit('${r.reviewId}')">취소</button>
												<input type="hidden" name="reviewPage"
													value="${p.postPage }"> <input type="hidden"
													name="reviewPageId" value="${p.postId }"> <input
													type="hidden" name="reviewPagePath" value="postId">
											</form>
										</div>
										<p id="reviewText_${r.reviewId}">${r.reviewComment }</p>
									</div>

								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="anime__details__form">
				<div class="section-title">
					<h5>Your Comment</h5>
				</div>
				<c:if test="${not empty id }">
					<form action="reviewinsert.do">
						<input type="hidden" name="reviewWriter" id="reviewWriter"
							value="${name }"> <input type="hidden"
							name="reviewLocation" id="reviewLocation"
							value="${p.postReview }">
						<textarea placeholder="Your Comment" id="reviewComment"
							name="reviewComment"></textarea>
						<button type="submit" onclick="location.href='reviewinsert.do'">
							<i class="fa fa-location-arrow"></i> Review
						</button>
						<input type="hidden" name="reviewPage" value="${p.postPage }">
						<input type="hidden" name="reviewPageId" value="${p.postId }">

						<input type="hidden" name="reviewPagePath" value="postId">
					</form>
				</c:if>
				<c:if test="${empty id }">
					<form action="logincontroller.do" method="post">
						<input type="hidden" name="reviewWriter" id="reviewWriter"
							value="${name }"> <input type="hidden"
							name="reviewLocation" id="reviewLocation"
							value="${p.postReview }">
						<textarea placeholder="Your Comment" id="reviewComment"
							name="reviewComment" readonly>로그인 후 이용하세요</textarea>
						<button type="submit" onclick="location.href='reviewinsert.do'">
							<i class="fa fa-location-arrow"></i> Login
						</button>
					</form>
				</c:if>
			</div>
		</div>
	</section>
	<!-- End review section -->

	<script type="text/javascript">
		function postUpdate(str) {
			if (str == 'E') {
				document.getElementById("frm").action = "posteditform.do";
			} else {
				document.getElementById("frm").action = "postdelete.do";
			}

			document.getElementById("frm").submit();
		}

		function toggleEditForm(reviewId) {
			var editForm = document.getElementById('editForm_' + reviewId);
			var reviewText = document.getElementById('reviewText_' + reviewId);

			if (editForm.style.display === 'none') {
				editForm.style.display = 'block';
				reviewText.style.display = 'none';
			} else {
				editForm.style.display = 'none';
				reviewText.style.display = 'block';

			}
		}

		function cancelEdit(reviewId) {
			var editForm = document.getElementById('editForm_' + reviewId);
			var reviewText = document.getElementById('reviewText_' + reviewId);

			editForm.style.display = 'none';
			reviewText.style.display = 'block';
		}


		function reviewDelete(reviewId) {
			if (confirm("정말로 이 리뷰를 삭제할까요? 되돌릴 수 없습니다.")) {
				var deleteForm = document.getElementById('deleteform');
				// reviewId 값을 설정한 input 요소의 value 변경
				deleteForm.querySelector('[name="reviewId"]').value = reviewId;
				deleteForm.submit();
			}
		}
	</script>

</body>
</html>