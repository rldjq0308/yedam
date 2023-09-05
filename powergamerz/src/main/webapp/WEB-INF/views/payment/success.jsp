<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.parser.ParseException"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.io.Reader"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
// 결제 승인 API 호출하기 

String orderId = request.getParameter("orderId");
String paymentKey = request.getParameter("paymentKey");
String amount = request.getParameter("amount");
String customerName = request.getParameter("customerName");
String secretKey = "test_sk_zXLkKEypNArWmo50nX3lmeaxYG5R:";


Encoder encoder = Base64.getEncoder();
byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

HttpURLConnection connection = (HttpURLConnection) url.openConnection();
connection.setRequestProperty("Authorization", authorizations);
connection.setRequestProperty("Content-Type", "application/json");
connection.setRequestMethod("POST");
connection.setDoOutput(true);
JSONObject obj = new JSONObject();

OutputStream outputStream = connection.getOutputStream();
outputStream.write(obj.toString().getBytes("UTF-8"));

int code = connection.getResponseCode();
boolean isSuccess = code == 200 ? true : false;

InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
JSONParser parser = new JSONParser();
JSONObject jsonObject = (JSONObject) parser.parse(reader);
responseStream.close();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
span {
	display: block;
	margin: 10px;
	color: #888;
	margin-bottom: 10px;
}

p {
	display: block;
	color: #888;
	margin-bottom: 10px;
}

button {
	background: #0a3afa;
	color: #fffadb;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	box-shadow: 0 1px 1px 0 rbga(0, 0, 0, 0.1);
}

button:hover {
	background-color: #353191;
}
</style>
</head>
<body>
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/images/bg-top-4.png">
		<div class="page-info">
			<h2>Cart</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Cart</span>
			</div>
		</div>
	</section>
	<section class="contact-page">
		<div class="container">
			<div class="nk-store nk-store-cart">

				<%
				if (isSuccess) {
				%>
				<h1>결제 실패</h1>
				<p><%=jsonObject.get("message")%></p>
				<span>에러코드: <%=jsonObject.get("code")%></span>
				<form id="backC" method="post" onsubmit="return backCart();">
					<button type="submit">돌아가기</button>
				</form>

				<%
				} else {
				%>
				
				<table class="table nk-store-cart-products">
					<tbody>
						<tr>
							<td>구매 완료되었습니다.</td>
						</tr>
						<tr>
							<td>이용해주셔서 감사합니다.</td>
						</tr>
					</tbody>
				</table>
				<form action="cartitemdelete2.do" method="post">
					<button type="submit" onclick="location.href='home.do'">홈으로</button>
					<input type="hidden" name="cartPersonal" id="cartPerosnal" value="${name }">					
				</form>
				<%
				}
				%>
			</div>
		</div>

	</section>

</body>
<script>
	function backHome() {
		return window.location.href = "home.do";
	}
	function backCart() {
		return window.location.href = "cart.do";
	}
</script>
</html>