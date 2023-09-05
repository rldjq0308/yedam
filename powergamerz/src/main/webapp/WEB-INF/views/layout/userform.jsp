<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<meta charset="UTF-8">
<meta name="description" content="EndGam Gaming Magazine Template">
<meta name="keywords" content="endGam,gGaming, magazine, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="usertemplet/img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link href="css/button.css" rel="stylesheet" type="text/css">

<!-- Stylesheets -->
<link rel="stylesheet" href="usertemplet/css/bootstrap.min.css" />
<link rel="stylesheet" href="usertemplet/css/font-awesome.min.css" />
<link rel="stylesheet" href="usertemplet/css/slicknav.min.css" />
<link rel="stylesheet" href="usertemplet/css/owl.carousel.min.css" />
<link rel="stylesheet" href="usertemplet/css/magnific-popup.css" />
<link rel="stylesheet" href="usertemplet/css/animate.css" />
<link rel="stylesheet" href="usertemplet/css/elegant-icons.css" />
<!-- Main Stylesheets -->
<link rel="stylesheet" href="usertemplet/css/style.css" />

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<section class="hero-section overflow-hidden">
		<div class="hero-slider owl-carousel"></div>
	</section>
	<!-- Header section -->
	<tiles:insertAttribute name="header" />
	<!-- Header section end -->

	<!-- Body section -->
	<tiles:insertAttribute name="body" />
	<!-- Body section end -->

	<!-- Footer section -->
	<tiles:insertAttribute name="footer" />
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="usertemplet/js/jquery-3.2.1.min.js"></script>
	<script src="usertemplet/js/bootstrap.min.js"></script>
	<script src="usertemplet/js/jquery.slicknav.min.js"></script>
	<script src="usertemplet/js/owl.carousel.min.js"></script>
	<script src="usertemplet/js/jquery.sticky-sidebar.min.js"></script>
	<script src="usertemplet/js/jquery.magnific-popup.min.js"></script>
	<script src="usertemplet/js/main.js"></script>

</body>
</html>