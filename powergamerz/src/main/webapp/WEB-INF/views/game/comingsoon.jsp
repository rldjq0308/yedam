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
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/1.jpg">
		<div class="page-info">
			<h2>Coming Soon</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <a>Games</a> / <a href="comingsoon.do"><span>Coming Soon</span></a>
			</div>
		</div>
	</section>
	<section class="games-section">
		<div class="container">

			<div class="row">
				<div class="col-xl-7 col-lg-8 col-md-7">
					<div class="row" id="gen">
						<c:forEach items="${gamepages }" var="g">
							<c:if test="${g.gameClassfication == 'Coming Soon' }">
								<div class="col-lg-4 col-md-6">
									<div class="game-item">
									<a href="javascript:selectGame(${g.gameId })">
										<img src="${g.gameIllustMini }" alt="#">
									</a>
										<h5>${g.gameName }</h5>
										<a href="javascript:selectGame(${g.gameId })"
											class="read-more">Read More <img
											src="usertemplet/img/icons/double-arrow.png" alt="#" /></a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<!-- ============= 페이징 ===============  -->
					<div class="site-pagination" id="pagination">
						<c:if test="${pagingVO.prev }">
							<c:set var="prevPageLink"
								value="comingsoon.do?pageNum=${pagingVO.pageNum - 1 }&amount=${pagingVO.amount}" />
							<c:choose>
								<c:when test="${not empty param.key}">
									<c:set var="prevPageLink"
										value="${prevPageLink}&key=${param.key}" />
								</c:when>
								<c:when test="${not empty param.val}">
									<c:set var="prevPageLink"
										value="${prevPageLink}&val=${param.val}" />
								</c:when>
							</c:choose>
							<a href="${prevPageLink}">이전</a>
						</c:if>
						<c:forEach var="num" begin="${pagingVO.startPage}"
							end="${pagingVO.endPage}">
							<c:set var="pageLink"
								value="comingsoon.do?pageNum=${num}&amount=${pagingVO.amount}" />
							<c:choose>
								<c:when test="${not empty param.key}">
									<c:set var="pageLink" value="${pageLink}&key=${param.key}" />
								</c:when>
								<c:when test="${not empty param.val}">
									<c:set var="pageLink" value="${pageLink}&val=${param.val}" />
								</c:when>
							</c:choose>
							<a href="${pageLink}"
								class="${pagingVO.pageNum eq num ? 'active' : ''}">${num}</a>
						</c:forEach>
						<c:if test="${pagingVO.next}">
							<c:set var="nextPageLink"
								value="comingsoon.do?pageNum=${pagingVO.endPage + 1}&amount=${pagingVO.amount}" />
							<c:choose>
								<c:when test="${not empty param.key}">
									<c:set var="nextPageLink"
										value="${nextPageLink}&key=${param.key}" />
								</c:when>
								<c:when test="${not empty param.val}">
									<c:set var="nextPageLink"
										value="${nextPageLink}&val=${param.val}" />
								</c:when>
							</c:choose>
							<li><a href="${nextPageLink}">다음</a></li>
						</c:if>
					</div>
					<!-- ============= 페이징 끝 ===============  -->
				</div>
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title">Genre</h4>
								<ul id="key">
									<li><a href="comingsoon.do?key=액션">액션</a></li>
									<li><a href="comingsoon.do?key=어드벤처">어드벤처</a></li>
									<li><a href="comingsoon.do?key=롤플레잉">롤플레잉</a></li>
									<li><a href="comingsoon.do?key=스포츠">스포츠</a></li>
									<li><a href="comingsoon.do?key=전략">전략</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title">platform</h4>
								<ul id="val">
									<li><a href="comingsoon.do?val=PC">PC</a></li>
									<li><a href="comingsoon.do?val=Xbox">Xbox</a></li>
									<li><a href="comingsoon.do?val=Play Station">Play
											Station</a></li>
									<li><a href="comingsoon.do?val=Nintendo Switch">Nintendo
											Switch</a></li>
									<li><a href="comingsoon.do?val=VR">VR</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<form id="gamefrm" action="gameinfo.do" method="post">
				<input type="hidden" id="gameId" name="gameId">
			</form>
		</div>
	</section>
	<script type="text/javascript">
		function selectGame(n) {
			document.getElementById("gameId").value = n;
			document.getElementById("gamefrm").submit();
		}
	</script>
</body>
</html>