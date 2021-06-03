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
        <title>회원가입</title>
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
          	<h1 class="blog-head"  style="color: #2d2d2d; position: relative; left:48%; text-align: center;"> <img alt="#" src="/resources/images/ID.png" style="width: 70px; height: 70px;"></h1> 
          	<h5 class="blog-head"  style="color: #2d2d2d; position: relative; left:48%; text-align: center;">회원정보에 입력한 이름과 이메일이 같아야 변경이 가능합니다</h5> 
          	<br>
           </div>
 
        <div class="container" >
             <div class="row" style="position: relative; left:30%;" >
                
                <div class="col-lg-8">
                    <form class="form-contact contact_form"  method="post"  role="form"  >
                       
                            
                            <div class="col-sm-6" id="divName">
                            	<h3 style="color: black;">Name</h3>	
                                <div class="form-group">
                                    <input class="form-control onlyHangul" name="user_name" id="user_name" type="text" data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Name" maxlength="15">
                                    <div class="check_font" id="name_check"></div>
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
							 <div class="col-sm-6">
                        <div class="form-group mt-3">
                            <button type="submit" class="button button-contactForm boxed-btn" style="padding: 8px 21px; position: relative; left:30%;">ID 찾기</button>
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
                   
                	var divName = $('#divName');            
                    var divEmail = $('#divEmail');
                    var mail_check_input_box_false = $('#mail_check_input_box_false');
                    
                    
                  //이름
                    if($('#user_name').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#user_name').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
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
                        modalContents.text("인증번호 확인해주세요.");
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
                        modalContents.text("인증번호 확인해주세요.");
                        modal.modal('show');
                        
                        mail_check_input_box_false.removeClass("has-success");
                        mail_check_input_box_false.addClass("has-error");
                        $('#mailcheck').focus();
                        return false;
                    }else{
                    	mail_check_input_box_false.removeClass("has-error");
                    	mail_check_input_box_false.addClass("has-success");
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
            
            
 			$('#user_name').on("ropertychange change keyup paste input",function(){
            	
            	
            	$.ajax({
        			url : "/user/nameselect",
        			type : "post",
        			dataType : "json",
        			data : { "user_name" : $("#user_name").val()},
        			success : function(data) {
        				if(data == 0) {
        					$("#name_check").text("가입되지 않은 회원입니다");
    						$("#name_check").css("color", "red");
        						
        					
        				} else if(data == 1) {
        					
        					
        					$("#name_check").text("가입된 회원입니다.");
    						$("#name_check").css("color", "green");
        					
        					
        				}
        			}
        		}); 
            	
            }); 
            
            
            
            
            
            
            
           
        </script>           
          
        <!-- </div> -->
        
    </body>
    
</html>




