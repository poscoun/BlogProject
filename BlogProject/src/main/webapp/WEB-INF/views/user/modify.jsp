<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ include file="../include/siderbar.jsp" %> --%>
<%@ include file="../include/header1.jsp" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Password 변경</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    </head>
    <body>
        <!-- <div class="container"> --><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            
            <!--// 헤더 들어가는 부분 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
           
            <!-- 본문 들어가는 부분 -->
            
            <!-- <div class="slider-area2">
        
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70" style="text-align: center; color: black;">
                            <h2>Sing up</h2>
                        </div>
                    </div>
                </div>
            </div>
        
    </div> -->
            
           
            
                
 
 <!-- <section class="blog_area section-padding">  -->
 
 <section class="contact-section" >
 <div class="col-sm-6" >
          	<h1 class="blog-head"  style="color: #2d2d2d; position: relative; left:48%; text-align: center;"> <img alt="#" src="/resources/images/password.png" style="width: 70px; height: 70px;"></h1> 
          	<!-- <h1 class="blog-head" style="color: #2d2d2d;">SIGN UP</h1> -->
          	<br>
           </div>
 
        <div class="container" >
             <div class="row" style="position: relative; left:30%;" >
                
                <div class="col-lg-8">
                    <form class="form-contact contact_form"  method="post"  role="form"  >
                       
                            
                            <div class="col-sm-6" id="divId">
                            	<h3 style="color: black;">ID</h3>
                                <div class="form-group">
                                    <input class="form-control onlyAlphabetAndNumber" name="user_id" id="user_id" type="text" data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="ID" maxlength="30">
                                    <div class="check_font" id="id_check"></div>
                                </div>
                            </div>
                            
                             <div class="col-sm-6" id="divEmail">
                             
                            	<h3 style="color: black;">Email</h3>	
                                <div class="form-group">
                                    <input class="form-control mail_input" name="user_email" id="user_email" type="email" data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)goott@email.com'" placeholder="EX) goott@email.com" maxlength="30">
                                </div>
                                <span class="mail_input_box_warn"></span>
                            
                            
                            
                            	 <div class="mail_check_wrap">	
                            	 
								<div class="email_check_button">
								<input type="button" class="button button-contactForm boxed-btn" id="email_check_button" name="email_check_button" value="인증번호 전송" style="padding: 8px 21px;"> 
								</div>
								<div class="clearfix"></div>
								<span id="mail_check_input_box_warn"></span>	
								<br>
															
								<div class="mail_check_input_box" id="mail_check_input_box_false">
									<input class="form-control mail_check_input" id="mailcheck" disabled="disabled">
									<div class="check_font" id="email_check"></div>
								</div>
								</div>
							</div>
							  <br>
							  <br>
							
							<div class="col-sm-6" id="divPassword">
                           		<h3 style="color: black;">PW</h3>
                                <div class="form-group">
                                    <input class="form-control valid" name="user_pw" id="user_pw" type="password"  data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Password" maxlength="30" disabled="disabled">
                                </div>
                            </div>
                            <div class="col-sm-6" id="divPasswordCheck" >
                            	<h3 style="color: black;">PW Check</h3>	
                                <div class="form-group">
                                    <input class="form-control valid" name=user_pwcheck id="user_pwcheck" type="password" data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Password Check" maxlength="30" disabled="disabled">
                                     <div class="check_font" id="pw_check"></div>
                                </div>
                            </div>
                            
							
                       
							 <div class="col-sm-6">
                        <div class="form-group mt-3">
                            <button type="submit" class="button button-contactForm boxed-btn" style="padding: 8px 21px;  position: relative; left:27%;">비밀번호 변경</button>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
               </div>
            </section>
          
        
        
        
        <script>
        
      //입력 이메일 형식 유효성 검사 
        function mailFormCheck(email){
       	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
       	return form.test(email);
       } 
        	
        
        
            $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
               
 
                $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                });
                
                
                //------- 검사하여 상태를 class에 적용
               
                $('#user_name').keyup(function(event){
                    
                    var divId = $('#divId');
                    
                    if($('#user_id').val()==""){
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                });
                
                
                $('#user_email').keyup(function(event){
                    
                    var divEmail = $('#divEmail');
                    
                    if($.trim($('#user_email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                });
                
				 $('#mailcheck').keyup(function(event){
                    
					 var mail_check_input_box_false = $('#mail_check_input_box_false');
                    
                    if($.trim($('#mailcheck').val())==""){
                    	mail_check_input_box_false.removeClass("has-success");
                    	mail_check_input_box_false.addClass("has-error");
                    }else{
                    	mail_check_input_box_false.removeClass("has-error");
                        mail_check_input_box_false.addClass("has-success");
                    }
                });
				 
				 $('#user_pw').keyup(function(event){
	                    
	                    var divPassword = $('#divPassword');
	                    
	                    if($('#user_pw').val()==""){
	                        divPassword.removeClass("has-success");
	                        divPassword.addClass("has-error");
	                    }else{
	                        divPassword.removeClass("has-error");
	                        divPassword.addClass("has-success");
	                    }
	                });
                
				 $('#user_pwcheck').keyup(function(event){
	                    
	                    var passwordCheck = $('#user_pwcheck').val();
	                    var password = $('#user_pw').val();
	                    var divPasswordCheck = $('#divPasswordCheck');
	                    
	                    if((passwordCheck=="") || (password!=passwordCheck)){
	                        divPasswordCheck.removeClass("has-success");
	                        divPasswordCheck.addClass("has-error");
	                    }else{
	                        divPasswordCheck.removeClass("has-error");
	                        divPasswordCheck.addClass("has-success");
	                    }
	                });
				 
				 
                
                
                
          
                
                
                
                
                
                //------- validation 검사
                $( "form" ).submit(function( event ) {  
                   
                	var divId = $('#divId');               
                    var divEmail = $('#divEmail');
                    var mail_check_input_box_false = $('#mail_check_input_box_false');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    
                    
             
                    //아이디 
                    if($('#user_id').val()==""){
                         modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                         modal.modal('show');
                         
                         divId.removeClass("has-success");
                         divId.addClass("has-error");
                         $('#user_id').focus();
                         return false;
                     }else{
                         divId.removeClass("has-error");
                         divId.addClass("has-success");
                     }  
                    
                 
                   
                    
                    //이메일
                    if($('#user_email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#user_email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                    
                    
                  //이메일
                    if($('#mailcheck').val()==""){
                        modalContents.text("인증번호 확인해줘.");
                        modal.modal('show');
                        
                        mail_check_input_box_false.removeClass("has-success");
                        mail_check_input_box_false.addClass("has-error");
                        $('#mailcheck').focus();
                        return false;
                    }else{
                    	mail_check_input_box_false.removeClass("has-error");
                    	mail_check_input_box_false.addClass("has-success");
                    }
                    
                    
            
                    
                    //이메일 체크 
                    
                    if($('#mailcheck').val()!=code){
                        modalContents.text("인증번호 확인해줘.");
                        modal.modal('show');
                        
                        mail_check_input_box_false.removeClass("has-success");
                        mail_check_input_box_false.addClass("has-error");
                        $('#mailcheck').focus();
                        return false;
                    }else{
                    	mail_check_input_box_false.removeClass("has-error");
                    	mail_check_input_box_false.addClass("has-success");
                    }
                    
                    
                  //패스워드 검사
                    if($('#user_pw').val()==""){
                        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                        $('#user_pw').focus();
                        return false;
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                    
                    
                  //패스워드 확인
                    if($('#user_pwcheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#user_pwCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                  
                    //패스워드 비교
                    if($('#user_pw').val()!=$('#user_pwcheck').val() || $('#user_pwcheck').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#user_pwcheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                    
                    
                });
                
            });
            
            
            /* 인증번호 이메일 전송 */
            $("#email_check_button").click(function(){
            	
            	var email = $(".mail_input").val();			// 입력한 이메일
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
            
            
            
            
	       $('#user_id').on("ropertychange change keyup paste input",function(){
            	
            	
            	$.ajax({
        			url : "/user/idcheck",
        			type : "post",
        			dataType : "json",
        			data : { "user_id" : $("#user_id").val()},
        			success : function(data) {
        				if(data == 1) {
        					$("#id_check").text("ID 있음");
    						$("#id_check").css("color", "green");
        						
        					
        				} else if(data == 0) {
        					
        					
        					$("#id_check").text("아이디 없음");
    						$("#id_check").css("color", "red");
        					
        					
        				}
        			}
        		}); 
            	
            }); 
	       
	       
	       $(function(){
               $("input").keyup(function(){
                  var pwd1=$("#user_pw").val();
                  var pwd2=$("#user_pwcheck").val();
                  if(pwd1 != "" || pwd2 != ""){
                     if(pwd1 == pwd2){ 
                        $("#pw_check").text("PW가 일치합니다.");
                      $("#pw_check").css("color", "green");
                     }else{ 
                        $("#pw_check").text("PW가 일치하지 않습니다.");
                      $("#pw_check").css("color", "red");
                        
                     }
                     }
                  }
               );
               
            });

            
           
            
            /* 인증번호 비교 */
            $(".mail_check_input").on("ropertychange change keyup paste input", function(){
            	
            	var inputCode = $(".mail_check_input").val();		// 입력코드	
            	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
            	
            	if(inputCode == code){							// 일치할 경우
            		$("#email_check").text("인증번호 일치");
            		$("#email_check").css("color", "green");
            		$("#user_pw").attr("disabled",false);
            		$("#user_pwcheck").attr("disabled",false);
            		
            	} else {											// 일치하지 않을 경우
            		$("#email_check").text("인증번호 불일치");
            		$("#email_check").css("color", "red");
            		
            	}	
            	
            });
           
        </script>           
          
        <!-- </div> -->
        
    </body>
    
</html>




<%-- <%@ include file="../include/footer.jsp" %> --%>
<%-- <%@ include file="../include/footer.jsp" %> --%>