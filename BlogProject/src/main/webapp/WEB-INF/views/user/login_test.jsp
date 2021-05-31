<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
	<link rel="stylesheet"  href="/resources/css/member/login.css?ver=2">
</head>
<body width="100%" height="100%">
    <form action="index.html" method="post" class="loginForm" id="login_form">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID" name="user_id">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW" name="user_pw">
      </div>
      <c:if test="${result==0 }">
      	<div class = "login_warn">ID 또는 PW를 잘못 입력하셨습니다.</div>
      </c:if>
      
      
      
      <button type="button" class="btn" onclick="button()">
        LOG IN
      </button>
      <script>
      
      
      $(".btn").click(function(){
  		
  		//alert("로그인 버튼 작동");
  		
  		/* 로그인 메서드 서버 요청 */
  		$("#login_form").attr("action", "/user/login.do");
  		$("#login_form").submit();
  		
  	});
      
      
      
      	
      </script>
      
      
      <div class="bottomText">
      <a href="/user/idselect">	Forget ID </a> | <a href="/user/modify"> Forget PW </a> | <a href="/user/join"> Sing in </a>
      </div>
    </form>
  </body>
</html>