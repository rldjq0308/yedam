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
			<h2>Indie Games</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <a>Games</a>  / <a href="indiegames.do"><span>Indie Games</span></a>
			</div>
		</div>
	</section>
	<!-- Games section -->
	<section class="games-section">
		<div class="container">

			<div class="row">
				<div class="col-xl-7 col-lg-8 col-md-7">
					<div class="row"  id="gen">
						<c:forEach items="${games }" var="g">
							<c:if test="${g.gameClassfication == 'Indie Games' }">

								<div class="col-lg-4 col-md-6">
									<div class="game-item">
										<img src="${g.gameIllustMini }" alt="#">
										<h5>${g.gameName }</h5>
										<a href="javascript:selectGame(${g.gameId })"
											class="read-more">Read More <img
											src="usertemplet/img/icons/double-arrow.png" alt="#" /></a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="site-pagination">
						<a href="#" class="active">01.</a> <a href="#">02.</a> <a href="#">03.</a>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title">Genre</h4>
								<ul id="key">
									<li><a href="javascript:genreList('액션')">액션</a></li>
									<li><a href="javascript:genreList('어드벤처')">어드벤처</a></li>
									<li><a href="javascript:genreList('롤플레잉')">롤플레잉</a></li>
									<li><a href="javascript:genreList('스포츠')">스포츠</a></li>
									<li><a href="javascript:genreList('전략')">전략</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title">platform</h4>
								<ul id="val">
									<li><a href="javascript:platformList('PC')">PC</a></li>
									<li><a href="javascript:platformList('Xbox')">Xbox</a></li>
									<li><a href="javascript:platformList('Play Station')">Play Station</a></li>
									<li><a href="javascript:platformList('Nintendo Switch')">Nintendo Switch</a></li>
									<li><a href="javascript:platformList('VR')">VR</a></li>
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
	<!-- Games end-->
	<script type="text/javascript">
		function selectGame(n) {
			document.getElementById("gameId").value = n;
			document.getElementById("gamefrm").submit();
		}

	    function genreList(selectedGenre) {//genre
	        let key = selectedGenre;
	        let payload = "key=" + key;
	        let url = "ajaxgenre.do";

	        fetch(url, {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/x-www-form-urlencoded",
	            },
	            body: payload,
	        })
	        .then(response => response.json())
	        .then(json => updateGenreSection(json));
	    }
	    function updateGenreSection(datas) {
	        const genreSection = document.querySelector('#gen');
	        const existingItems = genreSection.querySelectorAll('.game-item');
	        existingItems.forEach(item => item.remove());

	        datas.forEach(data => {
	            const newGameItem = createGameItem(data);
	            genreSection.appendChild(newGameItem);
	        });
	    }
	    
	    function platformList(selectedPlatform) {//platform
	        let val = selectedPlatform;
	        let payload = "val=" + val;
	        let url = "ajaxplatform.do";

	        fetch(url, {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/x-www-form-urlencoded",
	            },
	            body: payload,
	        })
	        .then(response => response.json())
	        .then(json => updatePlatformSection(json));
	    }
	    function updatePlatformSection(datas) {
	        const platformSection = document.querySelector('#gen');
	        const existingItems = platformSection.querySelectorAll('.game-item');
	        existingItems.forEach(item => item.remove());

	        datas.forEach(data => {
	            const newGameItem = createGameItem(data);
	            platformSection.appendChild(newGameItem);
	        });
	    }

	    function createGameItem(data) {
	        const gameItem = document.createElement('div');
	        gameItem.className = 'col-lg-4 col-md-6 game-item';
	        gameItem.innerHTML = `
	            <img src="\${data.gameIllustMini}" alt="#">
	            <h5>\${data.gameName}</h5>
	            <a href="javascript:selectGame(\${data.gameId})"
	                class="read-more">Read More <img src="usertemplet/img/icons/double-arrow.png" alt="#">
	            </a>
	        `;
	        return gameItem;
	    }
	</script>
</body>
</html>