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
        <title>pw변경</title>
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

                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="user_id" name="user_id" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">                        
                      
                        <!-- <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>	 -->
						<div class="check_font" id="id_check"></div>
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
                
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label"></label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="user_pw"  name="user_pw" data-rule-required="true" placeholder="new Password" maxlength="30" disabled="disabled">
                    </div>
                </div>
                
                
                 <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label"></label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="user_pwcheck" data-rule-required="true" placeholder="Password Check" maxlength="30" disabled="disabled">
                        <div id="pw_check"></div>
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
        				if(data == 0) {
        					$("#id_check").text("ID 있음");
    						$("#id_check").css("color", "green");
        						
        					
        				} else if(data == 1) {
        					
        					
        					$("#id_check").text("아이디 없음");
    						$("#id_check").css("color", "red");
        					
        					
        				}
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
           
        </script>           
          
        </div>
    </body>
</html>