<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login</title>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="/resources/assets2/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/assets/css/login.css">
</head>
<body>


  <main>
    <div class="container-fluid">
      <div class="row">
				<div class="col-sm-6 login-section-wrapper">
					<a href="/user/MainHome"
						style="color: #09cc7f; text-decoration: none;" class="login-title"><img
						src="/resources/assets/img/logo/loder.png" alt="logo" class="logo"
						style="width: 50px; height: 50px;">G-Blog</a>
					<div class="brand-wrapper">
						<!-- <img src="/resources/assets/img/logo/loder.png" alt="logo" class="logo" style="width: 50px; height: 50px;"> -->
					</div>
					<div class="login-wrapper my-auto">
						<h1 class="login-title">LOGIN</h1>

						<form action="#!" method="POST" class="loginForm" id="login_form">
							<div class="form-group">
								<h4 style="color: gray;">ID</h4>
								<input type="text" name="user_id" id="user_id"
									class="form-control">
							</div>
							<div class="form-group mb-4">
								<h4 style="color: gray;">Password</h4>
								<input type="password" name="user_pw" id="user_pw"
									class="form-control">
							</div>

							<c:if test="${result==0 }">
								<div class="login_warn">ID 또는 PW를 잘못 입력하셨습니다.</div>
							</c:if>


							<input name="login" id="login" class="btn btn-block login-btn"
								type="button" value="Login">


						</form>

						<script>
							$("#login").click(
									function() {

										//alert("로그인 버튼 작동");

										/* 로그인 메서드 서버 요청 */
										$("#login_form").attr("action",
												"/user/login.do");
										$("#login_form").submit();

									});
						</script>

						<a href="/user/idselect" style="color: black;">Forgot ID?</a> <br>
						<a href="/user/modify" style="color: black;">Forgot Password?</a>
						<p class="login-wrapper-footer-text">
							Don't have an account? <a href="/user/join" class="text-reset">Register
								here</a>
						</p>
					</div>
				</div>
				<div class="col-sm-6 px-0 d-none d-sm-block">
          <img src="/resources/assets/images/login.jpg" alt="login image" class="login-img">
        </div>
      </div>
    </div>
  </main>
  
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
