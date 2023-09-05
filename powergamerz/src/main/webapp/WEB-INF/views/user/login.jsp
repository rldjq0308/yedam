<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<a href="home.do">Home</a> / <span>Login</span>
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
						<h2>Login</h2>
						<p>Welcome to Gamerz.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->


	<!-- Login Section Begin -->

	<section class="login spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>Login</h3>
						<form action="login.do" method="post">
							<div class="input__item">
								<input type="text" id="memberId" name="memberId"
									placeholder="Your Id"> <span class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input type="password" id="memberPassword" name="memberPassword"
									placeholder="Password"> <span class="icon_lock"></span>
							</div>
							<button type="submit" class="site-btn2">Login Now</button>
						</form>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__register">
						<h3>Don’t Have An Account?</h3>
						<a href="signupcontroller.do" class="primary-btn">Register Now</a>
					</div>
				</div>
			</div>
			<div class="login__social">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6">
						<div class="login__social__links">
							<span>or</span>
							<ul>
								<li><a id="naverIdLogin_loginButton" href="#" class="naver">
										<i class="fa fa-leaf"></i> Sign in With Naver
								</a></li>
								<li id="googlelogin"><a href="javascript:void(0)"
									class="google"><i class="fa fa-google"></i> Sign in With
										Google</a></li>
								<li onclick="kakaoLogin()"><a href="#" class="kakao"><i
										class="fa fa-commenting"></i> Sign in With Kakao</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Login Section End -->

	<!-- JS Section Begin -->

	<script>
	function submit(){
		let id = document.getElementById("memberId").value;
		// get방식 ajax호출
			let url = "ajaxIdCheck.do?memberId=" + id;	
			fetch(url)
				.then(response => response.text())
				.then(text => checkId(text));
	}
	function checkId(text){
		if(text == 'yes'){
			swal ("Please Check", "존재하지 않는 아이디입니다", "warning") ;
			document.getElementById("btn").disabled = true;
			document.getElementById("btn").value = "Yes";
			document.getElementById("memberId").focus();
		}
	</script>

	<!-- Google Login Api Begin -->
	<script type="text/javascript">
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
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>
	<!-- Google Login Api End -->

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
	
	function enterkey(event){
		if(event.keyCode == 13) {
			submit();
		}
	}
	
	document.getElementById("memberId").addEventListener("keyup", function(event) {
        enterkey(event);
    });

    document.getElementById("memberPassword").addEventListener("keyup", function(event) {
        enterkey(event);
    });
	</script>
	<!-- Naver Login Api End -->

	<!-- 
	<script>
	
	</script>
	-->

	<!-- JS Section End -->
</body>
</html>