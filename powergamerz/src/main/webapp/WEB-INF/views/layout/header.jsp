<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<body>
	<header class="header-section">
		<div class="header-warp">
			<div class="header-bar-warp d-flex">
				<a href="home.do" class="site-logo"> <img
					src="usertemplet/img/logohead.png" alt="">
				</a>
				<nav class="top-nav-area w-100">
					<div class="user-panel">
						<div class="nk-contacts-top">
							<div class="container">

								<div class="nk-contacts-right">
									<ul class="nk-contacts-icons">

										<li><a href="#" class="search-switch"
											onclick="toggleSearchBox()"><span class="icon_search"></span></a></li>


										 <c:if test="${empty id}">

											<li><a href="logincontroller.do"> <span
													class="fa fa-user"></span>
											</a></li>
										</c:if>
										<c:if test="${not empty id}">
															

											<li><a href="logout.do" class="search-switch"><span class="icon_lock-open"></span></a></li>

										</c:if>

										<li><a href="cart.do"><span class="nk-cart-toggle">
													<span class="fa fa-shopping-cart"></span>
											</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- Menu -->
					<ul class="main-menu primary-menu">
						<li><a href="home.do">Home</a>
							<ul class="sub-menu">
								<li><a href="home.do">the Main Page</a></li>
							</ul></li>
						<li><a href="gamelibrary.do">Games</a>
							<ul class="sub-menu">
								<li><a href="latestgames.do">Latest Games</a></li>
								<li><a href="populargames.do">Popular Games</a></li>
								<li><a href="comingsoon.do">Coming Soon</a></li>
								<li><a href="gamelibrary.do">Games Library</a></li>
							</ul></li>
						<li><a href="promotion.do">Promotion</a>
							<ul class="sub-menu">
								<li><a href="promotion.do">Special Offers</a></li>
							</ul></li>
						
						<li><a href="postlist.do">Community</a>
							<ul class="sub-menu">
								<li><a href="postlist.do">Discussions</a></li>
							</ul></li>
							
						<li><a href="faqlist.do">Support</a>
							<ul class="sub-menu">
								<li><a href="faqlist.do">FAQ</a></li>
								<li><a href="qnalist.do">Q&A</a>
							</ul>
							
						<li><a href="aboutus.do">About</a>
							<ul class="sub-menu">
								<li><a href="aboutus.do">About Gamerz</a>
								
								<c:if test="${author eq 'ADMIN'}">
												<li><a href="admin.do">admin page</a></li>
								</c:if>
								
							</ul>
							</li>
							</ul>
							
				</nav>
			</div>
		</div>
		<div id="search-container" class="search-model" style='display: none;'>
			<div class="h-100 d-flex align-items-center justify-content-center">
				<div class="search-close-switch" onclick="toggleSearchBox()">
					<i class="icon_close"></i>
				</div>
				<form class="search-model-form">
					<input type="text" id="search-input" placeholder="Search here....."
						onkeydown="handleKeyPress(event)">
				</form>
			</div>
		</div>
		<div>
			<form id="gamefrmheader" action="gamesearch.do" method="post">
				<input type="hidden" id="gameName" name="gameName">
			</form>
		</div>
	</header>
	<script type="text/javascript">
		function useLogin() {
			alert('USE in to LOGIN');
			document.getElementById("logincontroller.do");
		}

		function toggleSearchBox() {
			var searchContainer = document.getElementById("search-container");
			if (searchContainer.style.display === "none") {
				searchContainer.style.display = "block";
			} else {
				searchContainer.style.display = "none";
			}
		}

		function handleKeyPress(event) {
			if (event.key === "Enter") {
				event.preventDefault(); // 엔터 키 기본 동작 중지
				var gameName = document.getElementById("search-input").value;
				searchGame(gameName); // 검색 함수 호출에 gameName 전달
			}
		}

		function searchGame(gameName) {
			document.getElementById("gameName").value = gameName;
			document.getElementById("gamefrmheader").submit();
		}
	</script>
</body>
</html>