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
</head>
<body>
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/1.jpg">
		<div class="page-info">
			<h2>Games</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <a>${g.gameGenre }</a> / <span>${g.gameName  }</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->


	<!-- Games section -->
	<section class="games-single-page">
		<div class="container">
			<div class="game-single-preview">
				<img src="${g.gameIllustMain }" alt="">
			</div>
			<div class="row">
				<div class="col-xl-9 col-lg-8 col-md-7 game-single-content">
					<div class="gs-meta">
						11.11.18 / in <a href="gamelibrary.do">Games</a>
					</div>
					<h2 class="gs-title">${g.gameName }</h2>
					<h4>게임설명(그림, 영상)</h4>
					<p>${g.gameVideo }</p>
					<h4>게임설명</h4>
					<p>${g.gameDetailAbout }</p>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="rating-widget">
								<h4 class="widget-title">info</h4>
								<ul>
									<c:if test="${g.gamePriceDiscount == 0}">
										<li>가격<span>${g.gamePrice }원</span></li>
									</c:if>
									<c:if test="${g.gamePriceDiscount != 0}">
										<li>가격<span>${g.gamePriceDiscount }원</span></li>
									</c:if>

									<li>출시일<span>${g.gameReleaseDate }</span></li>
									<li>장르<span>${g.gameGenre }</span></li>
									<li>개발사<span>${g.gameDeveloper }</span></li>
									<li>플랫폼<span>${g.gamePlatform }</span></li>
								</ul>
								<c:if test="${not empty id }">
									<form id="qty" action="cartadd.do" method="post">
										<input type="hidden" id="itemId" name="itemId"
											value="${g.gameId }">
										<c:if test="${g.gamePriceDiscount == 0 }">
											<input type="hidden" id="cartTotal" name="cartTotal"
												value="${g.gamePrice }">
										</c:if>
										<c:if test="${g.gamePriceDiscount != 0 }">
											<input type="hidden" id="cartTotal" name="cartTotal"
												value="${g.gamePriceDiscount }">
										</c:if>

										<input type="hidden" id="cartPersonal" name="cartPersonal"
											value="${ name}">
										<button type="submit">
											<i class="fa fa-shopping-bag"></i> ADD TO CART
										</button>
									</form>
								</c:if>
								<c:if test="${empty id }">
									<form id="qty" action="logincontroller.do" method="post">
										<input type="hidden" id="itemId" name="itemId"
											value="${g.gameId }"> <input type="hidden"
											id="cartTotal" name="cartTotal" value="${g.gamePrice }">
										<button type="submit">
											<i class="fa fa-shopping-bag"></i> LOGIN TO USE
										</button>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Games end-->

	<section class="game-author-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>

						<c:forEach items="${reviewlist }" var="r">
							<c:if test="${r.reviewLocation eq g.gameName }">
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
													onclick="reviewDelete('${r.reviewId}')"> <img
													class="toolsIcon"
													src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_delete.png">
													Delete
												</a>

												<form action="reviewdelete.do" method="post" id="deleteform">
													<input type="hidden" name="reviewId" value="${r.reviewId}">
													<input type="hidden" name="reviewPage"
														value="${g.gamePage }"> <input type="hidden"
														name="reviewPageId" value="${g.gameId }"> <input
														type="hidden" name="reviewPagePath" value="gameId">
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
													value="${g.gamePage }"> <input type="hidden"
													name="reviewPageId" value="${g.gameId }"> <input
													type="hidden" name="reviewPagePath" value="gameId">
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
							name="reviewLocation" id="reviewLocation" value="${g.gameName }">
						<textarea placeholder="Your Comment" id="reviewComment"
							name="reviewComment"></textarea>
						<button type="submit" onclick="location.href='reviewinsert.do'">
							<i class="fa fa-location-arrow"></i> Review
						</button>
						<input type="hidden" name="reviewPage" value="${g.gamePage }">
						<input type="hidden" name="reviewPageId" value="${g.gameId }">
						<input type="hidden" name="reviewPagePath" value="gameId">
					</form>
				</c:if>
				<c:if test="${empty id }">
					<form action="logincontroller.do" method="post">
						<input type="hidden" name="reviewWriter" id="reviewWriter"
							value="${name }"> <input type="hidden"
							name="reviewLocation" id="reviewLocation" value="${g.gameName }">
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
	<script type="text/javascript">
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
