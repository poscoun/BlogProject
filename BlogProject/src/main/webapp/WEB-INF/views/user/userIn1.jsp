<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
                
 
 
            <form class="form-horizontal" role="form" method="POST">               
        
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="user_id" name="user_id" data-rule-required="true"  maxlength="30" readonly="readonly" value="${udto.user_id }"> 
                    </div>
                   
                </div>
               
               
                
                
                
               
                
                <div class="form-group" id="divbirth">
                    <label for="inputbirth" class="col-lg-2 control-label">생년원일</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="user_birth" name="user_birth" data-rule-required="true" placeholder="ex)960407." maxlength="6" value="${udto.user_birth }">
                    </div>
                </div>
                
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="user_phone" name="user_phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" value="${user_phone }">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary" >수정</button>
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
                
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
            
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                
                
            
                
                
                //------- 검사하여 상태를 class에 적용
           
                
                
                
	           $('#user_birth').keyup(function(event){
                    
                    var divPhoneNumber = $('#divbirth');
                    
                    if($.trim($('#user_birth').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                
               
                

                
                
                
                $('#user_phone').keyup(function(event){
                    
                    var divPhoneNumber = $('#divPhoneNumber');
                    
                    if($.trim($('#user_phone').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                
                
                
                
                
                
                
                
                
                
                //------- validation 검사
                $( "form" ).submit(function( event ) {  
                 
                    var divbirth = $('#divbirth'); 
                                
                   
                    var divPhoneNumber = $('#divPhoneNumber');
                    
                    
                    
                    
                    
                     
                    
                
                    
                  //생년월일
                    if($('#user_birth').val()==""){
                        modalContents.text("생년월일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divbirth.removeClass("has-success");
                        divbirth.addClass("has-error");
                        $(' ').focus();
                        return false;
                    }else{
                        divbirth.removeClass("has-error");
                        divbirth.addClass("has-success");
                    }
                    
                   
                    
                   
                    
                    //휴대폰 번호
                    if($('#user_phone').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $(' ').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                    
                    
                    
                
                });
                
            });
            
             
             
       
            
        
           
        </script>           
          
        </div>
    </body>
</html>