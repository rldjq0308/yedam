<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/1.jpg">
		<div class="page-info">
			<h2>Games Library</h2>
			<div class="site-breadcrumb">

				<a href="home.do">Home</a> / <a>Games</a> / <a href="gamelibrary.do"><span>Games
						Library</span></a>

			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!-- Games section -->
	<section class="games-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-7 col-lg-8 col-md-7">
					<div class="row" id="gen">
						<c:forEach items="${games }" var="g">
							<div class="col-lg-4 col-md-6">
								<div class="game-item">
									<img src="${g.gameIllustMini}" alt="#">
									<h5>${g.gameName}</h5>
									<a href="javascript:selectGame(${g.gameId})" class="read-more">Read
										More <img src="usertemplet/img/icons/double-arrow.png" alt="#">
									</a>
								</div>
							</div>
						</c:forEach>
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