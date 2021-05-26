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
	<link rel="stylesheet"  href="/resources/css/member/test.css?ver=1">
</head>
<body width="100%" height="100%">
    <form action="index.html" method="post" class="loginForm" id="login_form">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID" name="user_id">
      </div>
      
      
      
      
      <div class="passForm">
        <input type="password" class="pw" placeholder="Email" id="user_email" name="user_email">
      </div>
      <sapn class="mail_input_box_warn"></sapn> 
      
      <div class="passForm">
        <input type="password" class="pw" placeholder="Email Check" id="user_emailck" name="user_emailck" disabled="disabled">
        <div class="check_font" id="email_check"></div>
      </div>
      <div class="email_check_button">
			<input type="button" class="btn btn-primary" id="email_check_button" name="email_check_button" value="인증번호 전송"> 			       
	 </div>
	<div class="clearfix"></div>
	<span id="mail_check_input_box_warn"></span>
	
	<div class="passForm">
        <input type="password" class="pw" placeholder="Password" name="user_pw">
      </div>
      
      <div class="passForm">
        <input type="password" class="pw" placeholder="Password Check" name="user_pwck">
      </div>
      
      
      <button type="button" class="btn" onclick="button()">
        LOG IN
      </button>
      <script>
      
      
      $(".btn").click(function(){
  		
  		//alert("로그인 버튼 작동");
  		
  		/* 로그인 메서드 서버 요청 */
  		$("#login_form").attr("action", "/user/login");
  		$("#login_form").submit();
  		
  	});
      
      /* 인증번호 이메일 전송 */
      $("#email_check_button").click(function(){
      	
      	var email = $("#user_email").val();			// 입력한 이메일
      	var cehckBox = $(".mail_check_input");		// 인증번호 입력란
      	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
      	var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
      	
      	
      	if(mailFormCheck(email)){
      		warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
      		warnMsg.css("display", "inline-block");
      	} else {
      		warnMsg.html("올바르지 못한 이메일 형식입니다.");
      		warnMsg.css("display", "inline-block");
      		return false;
      	}	
      	
      	$.ajax({
      		
      		type:"GET",
      		url:"mailCheck?email=" + email,
      		success:function(data){
      			
      			//console.log("data : " + data);
      			cehckBox.attr("disabled",false);
      			boxWrap.attr("id", "mail_check_input_box_true");
      			code = data;
      			
      		}
      				
      	});
      	
      });
      
     
      
      /* 인증번호 비교 */
      $(".mail_check_input").on("ropertychange change keyup paste input", function(){
      	
      	var inputCode = $(".mail_check_input").val();		// 입력코드	
      	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
      	
      	if(inputCode == code){							// 일치할 경우
      		$("#email_check").text("인증번호 일치");
      		$("#email_check").css("color", "green");		
      		
      	} else {											// 일치하지 않을 경우
      		$("#email_check").text("인증번호 불일치");
      		$("#email_check").css("color", "red");
      		
      	}	
      	
      });
      
      
      
      	
      </script>
      
      
      <div class="bottomText">
      <a href="/user/idselect">	ID 찾기 </a> | <a href="#"> PW 찾기 </a> | <a href="/user/join"> 회원가입 </a>
      </div>
    </form>
  </body>
</html>