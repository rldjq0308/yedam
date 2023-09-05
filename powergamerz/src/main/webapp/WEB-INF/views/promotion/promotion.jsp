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
		data-setbg="usertemplet/img/page-top-bg/2.jpg">
		<div class="page-info">
			<h2>Promotion</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Promotion</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!--  Sale start -->
	<div class="section trending">
		<div class="container" id="genpa">
			<ul class="trending-filter" id="key">
				<li><a class="is_active" href="promotion.do" data-filter=".adv">Show
						All</a></li>
				<li><a class="is_active" href="promotion.do?key=어드벤처"
					data-filter=".adv">adventure</a></li>
				<li><a class="is_active" href="promotion.do?key=전략"
					data-filter=".str">strategy</a></li>
				<li><a class="is_active" href="promotion.do?key=스포츠"
					data-filter=".rac">sports</a></li>
				<li><a class="is_active" href="promotion.do?key=롤플레잉"
					data-filter=".rac">role-playing</a></li>
				<li><a class="is_active" href="promotion.do?key=액션"
					data-filter=".rac">Action</a></li>
			</ul>
			<div class="row trending-box" id="gen">
				<c:forEach items="${gamepages }" var="g">
					<c:if test="${not empty gamepages && g.gamePriceDiscount ne 0}">
						<div
							class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
							<div class="item">
								<div class="thumb">
									<a href="javascript:selectGame(${g.gameId })"><img
										src="${g.gameIllustMini }" alt=""></a> <span class="price"><em>${g.gamePrice }원</em>${g.gamePriceDiscount }원</span>
								</div>
								<div class="down-content">
									<span class="category">${g.gameGenre }</span>
									<h4>${g.gameName }</h4>
									<a href="javascript:selectGame(${g.gameId })"><i
										class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- ============= 페이징 ===============  -->
			<div class="site-pagination" id="pagination">
				<c:if test="${pagingVO.prev }">
					<c:set var="prevPageLink"
						value="promotion.do?pageNum=${pagingVO.pageNum - 1 }&amount=${pagingVO.amount}" />
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
						value="promotion.do?pageNum=${num}&amount=${pagingVO.amount}" />
					<c:choose>
						<c:when test="${not empty param.key}">
							<c:set var="pageLink" value="${pageLink}&key=${param.key}" />
						</c:when>
					</c:choose>
					<a href="${pageLink}"
						class="${pagingVO.pageNum eq num ? 'active' : ''}">${num}</a>
				</c:forEach>
				<c:if test="${pagingVO.next}">
					<c:set var="nextPageLink"
						value="promotion.do?pageNum=${pagingVO.endPage + 1}&amount=${pagingVO.amount}" />
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
	</div>
	<div>
		<form id="gamefrm" action="gameinfo.do" method="post">
			<input type="hidden" id="gameId" name="gameId">
		</form>
	</div>
	<!--  Sale End -->
	<script type="text/javascript">
		function selectGame(n) {
			document.getElementById("gameId").value = n;
			document.getElementById("gamefrm").submit();
		}
	</script>
</body>

</html>