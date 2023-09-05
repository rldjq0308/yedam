<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="home.do">
				<img src="usertemplet/img/logohead.png" alt="">
			</a>
			<button class="navbar-toggler ml-auto mr-0" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars tm-nav-icon"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link" href="admin.do">
							<i class="fas fa-tachometer-alt"></i> Main
					</a></li>
					
					<li class="nav-item"><a class="nav-link" href="memberlist.do">
							<i class="far fa-user"></i> Accounts<span class="sr-only">(current)</span>
					</a></li>
					
					<li class="nav-item"><a class="nav-link" href="products.do">
							<i class="fas fa-shopping-cart"></i> Products
					</a></li>

					<li class="nav-item"><a class="nav-link" href="admin.do">
							<i class="fas fa-chart-line"></i> Chart
					</a></li>
					
					<li class="nav-item"><a class="nav-link" href="notification.do">
							<i class="fas fa-bell"></i> Notification
					</a></li>
					
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="logout.do"> Admin, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>

	</nav>

</body>
</html>