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
 <title>WITHDRAWAL</title>
</head>
    
    <body>
 <!-- <section class="blog_area section-padding">  -->
 
 <section class="contact-section" >
 <div class="col-sm-6" >
          	<h1 class="blog-head"  style="color: #2d2d2d; position: relative; left:48%; text-align: center;">회원탈퇴</h1> 
          	<!-- <h1 class="blog-head" style="color: #2d2d2d;">SIGN UP</h1> -->
          	<br>
           </div>
 
        <div class="container" >
             <div class="row" style="position: relative; left:30%;" >
                
                <div class="col-lg-8">
                    <form class="form-contact contact_form"  method="post"  id="login_form"  >
                       
                            
                            <div class="col-sm-6" id="divId">
                            	<h3 style="color: black;">ID</h3>
                                <div class="form-group">
                                    <input class="form-control onlyAlphabetAndNumber" name="user_id" id="user_id" type="text" data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" maxlength="30">
                                    <div class="check_font" id="id_check"></div>
                                </div>
                            </div>
                            
                             
							
							
							<div class="col-sm-6" id="divPassword">
                           		<h3 style="color: black;">PW</h3>
                                <div class="form-group">
                                    <input class="form-control valid" name="user_pw" id="user_pw" type="password"  data-rule-required="true" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" maxlength="30" >
                                     <c:if test="${result==0 }">
      									<div class = "login_warn" style="color: red;">ID 또는 PW를 잘못 입력하셨습니다.</div>
     								</c:if>
                                </div>
                            </div>
                            
                        
							 <div class="col-sm-6">
                        <div class="form-group mt-3">
                            <!-- <button type="submit" class="button button-contactForm boxed-btn" style="padding: 8px 21px;  position: relative; left:27%;">비밀번호 변경</button> -->
                            <input name="login" id="login" class="button button-contactForm boxed-btn" style="padding: 8px 21px;  position: relative; left:32%;" type="button" value="회원탈퇴">
                        </div>
                        </div>
                    </form>
                </div>
            </div>
               </div>
            </section>
          
        
        
        
        
        <script>
        
        $("#login").click(function(){
      		
      		//alert("로그인 버튼 작동");
      		
      		/* 로그인 메서드 서버 요청 */
      		$("#login_form").attr("action", "/user/userdelete.do");
      		$("#login_form").submit();
      		
      	});
           
        </script>           
          
     
        
    </body>
    
</html>




<%-- <%@ include file="../include/footer.jsp" %> --%>
<%-- <%@ include file="../include/footer.jsp" %> --%>