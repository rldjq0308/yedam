<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="google-signin-client_id"
	content="779704502037-d6iar8c2cu644l1ll1rra6rv0geljq3s.apps.googleusercontent.com">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/review-bg.png">
		<div class="page-info">
			<h2>Games</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Sign up</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="usertemplet/img/review-bg-2.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Sign Up</h2>
						<p>Welcome to Gamerz.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Signup Section Begin -->
	<section class="signup spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>Sign Up</h3>
						<form action="signup.do" method="post"
							onsubmit="return formCheck()" enctype="multipart/form-data">
							<div class="input__img">
								<input type="file" id="memberImg" name="memberImg"
									accept="image/*"> <span class="icon_upload"></span>
							</div>

							<div class="input__item">
								<input type="text" id="memberId" name="memberId"
									placeholder="Your Id*" required="required"> <span
									class="icon_info"></span>
								<button type="button" id="btn" value="NoCheck"
									onclick="idCheck()" class="btn btn-primary btn-sm btn-jelly"
									style="margin: 10px 0 0 0;">중복체크</button>
							</div>
							<div class="input__item">
								<input type="text" id="memberName" name="memberName"
									placeholder="Your Name*" required="required"> <span
									class="icon_profile"></span>
							</div>
							<div class="input__item">
								<input type="password" id="memberPassword" name="memberPassword"
									placeholder="Password*" required="required"> <span
									class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" id="memberPasswordCheck"
									name="memberPasswordCheck" placeholder="Password Check*"
									required="required"> <span class="icon_check"></span>
							</div>
							<div class="input__item">
								<input type="date" id="memberBirth" name="memberBirth"
									placeholder="Your Birth"> <span class="icon_clock"></span>
							</div>
							<div class="input__item">
								<input type="text" id="memberPhone" name="memberPhone"
									placeholder="Your PhoneNumber"> <span
									class="icon_phone"></span>
							</div>
							<div class="input__item">
								<input type="text" id="memberAddress" name="memberAddress"
									placeholder="Your Address"> <span class="icon_house"></span>
							</div>
							<div class="input__item">
								<input type="text" id="memberEmail" name="memberEmail"
									placeholder="Your Email"> <span class="icon_mail"></span>
							</div>

							<button type="submit" class="site-btn2">Register</button>
						</form>
						<h5>
							Already have an account? <a href="logincontroller.do">Log In!</a>
						</h5>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__social__links">
						<h3>Login With:</h3>
						<ul>
							<li><a id="naverIdLogin_loginButton" href="#" class="naver"><i
									class="fa fa-leaf"></i> Sign in With Naver</a></li>
							<li id="googlelogin"><a href="#" class="google"><i
									class="fa fa-google"></i> Sign in With Google</a></li>
							<li onclick="kakaoLogin()"><a href="#" class="kakao"><i
									class="fa fa-commenting"></i> Sign in With Kakao</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Signup Section End -->

	<!-- JS Section Begin -->

	<!-- Login Id Check Begin -->
	<script type="text/javascript">
	function idCheck() { // ajax를 통신을 이용해 아이디 중복체크
		let id = document.getElementById("memberId").value;
	// get방식 ajax호출
		let url = "ajaxIdCheck.do?memberId=" + id;	
		fetch(url)
			.then(response => response.text())
			.then(text => checkId(text));
	}	
	
	function checkId(text){
		if(text == 'yes'){
			swal ("Possible", "사용가능한 아이디입니다", "success") ;
			document.getElementById("btn").disabled = true;
			document.getElementById("btn").value = "Yes";
			document.getElementById("memberPassword").focus();
		} else{
			swal ("Impossible", "이미 사용 중인 아이디입니다", "error") ;
			document.getElementById("memberId").value = "";
			document.getElementById("memberId").focus();
		}
	}
	
	function formCheck() {
 		let password = document.getElementById("memberPassword").value;
 		let passcheck = document.getElementById("memberPasswordCheck").value;
 		let id = document.getElementById("btn").value;
 		
 		if(id == 'NoCheck'){
 			swal ("Please Check", "아이디 중복체크 하세요", "warning") ;
			return false;
 		}
 		
		if(password != passcheck){
			swal ("Impossible", "패스워드가 일치하지 않습니다", "error") ;
			return false;
		}
	}
	<!-- Login Id Check End -->
	
	<!-- Google Login Api Begin -->
	function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
		gapi.auth2.getAuthInstance().attachClickHandler('googlelogin', options, onSignIn, onSignInFailure);
		})
	}
	
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
			url: 'https://people.googleapis.com/v1/people/me'
			, data: {personFields:'birthdays', key:'AIzaSyBYUOBiRNq5SziHGXP_DSKLYTSnChe8-1U', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		})
		.fail(function(e){
			console.log(e);
		})
	}
	
	function onSignInFailure(t){		
		console.log(t);
	}
	<!-- Google Login Api End -->
	
	</script>

	<!-- Google Login Api2 Begin -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>
	<!-- Google Login Api2 End -->

	<!-- Kakao Login Api Begin -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	Kakao.init('4ce7320aa4c7250c4feb01a0333f4cad'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	</script>
	<!-- Kakao Login Api End -->

	<!-- Naver Login Api Begin -->
	<script
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
		charset="utf-8"></script>

	<script>
	
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "0WH7ACCoP4ScfayOW1QB", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost/gamerz/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: false,
				callbackHandle: true
			}
		);	
	
	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
	    		
				console.log(naverLogin.user); 
	    		
	            if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	
	
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
		
		
	}
	</script>
	<!-- Naver Login Api End -->

	<!-- JS Section End -->

</body>
</html>