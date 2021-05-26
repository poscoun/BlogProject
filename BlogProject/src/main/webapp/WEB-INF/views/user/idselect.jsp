<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            <div class="row">
                <p></p>
                <div class="col-md-12">
                    <small>
                    <a href="#">로그인</a> | <a href="#">회원가입</a>
                    </small>
                </div>
            </div>
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
            <hr/>
            <!-- 본문 들어가는 부분 -->
                
 
 
            <form class="form-horizontal" role="form" method="post" >               

                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="user_name" name="user_name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                        
                    </div>
                </div>
                
                
                
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control mail_input" id="user_email" name="user_email" data-rule-required="true" placeholder="ex)goot77@gmail.com" maxlength="40">                       
                    </div>
					<sapn class="mail_input_box_warn"></sapn>                    
                 <div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" id="mailcheck" disabled="disabled">
						<div class="check_font" id="email_check"></div>
					</div>
					<div class="email_check_button">
						<input type="button" class="btn btn-primary" id="email_check_button" name="email_check_button" value="인증번호 전송"> 
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
                </div>
         
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">아이디 찾기</button>
                    </div>
                </div>
            </form>
        
        
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
               
 
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
                
                
                //------- 검사하여 상태를 class에 적용
               
                $('#user_name').keyup(function(event){
                    
                    var divName = $('#divName');
                    
                    if($.trim($('#user_name').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
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
            		
            	} else {											// 일치하지 않을 경우
            		$("#email_check").text("인증번호 불일치");
            		$("#email_check").css("color", "red");
            		
            	}	
            	
            });
           
        </script>           
          
        </div>
    </body>
</html>