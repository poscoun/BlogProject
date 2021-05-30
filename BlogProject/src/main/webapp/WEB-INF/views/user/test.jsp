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
 
 
             
                
                <div class="col-lg-8">
                    <form class="form-contact contact_form"  method="post"   >
					 	<div class="container box_1170">
						<div class="section-top-border" style="position: absolute; top: 50%; left: 50%; ">
								<h3 class="mb-30" style="">Table</h3>
								
									<div class="progress-table" style="padding: 20px 50px 40px;" >
										<div class="table-head">
											<div class="serial">ID</div>
											<div class="country">NAME</div>
											<div class="visit">Member Since</div>
											
										</div>
										<div class="table-row">
											<div class="serial">${id }</div>
											<div class="country">${name }</div>
											<div class="visit"><fmt:formatDate pattern="yyyy-MM-dd" value="${date }"/></div>
										</div>
									</div>
								</div>
                                 </div>
                    </form>
                </div>
            
   
          
        
        
        
        <script>
        

           
        </script>           
          
        <!-- </div> -->
        
    </body>
    
</html>




<%-- <%@ include file="../include/footer.jsp" %> --%>
<%-- <%@ include file="../include/footer.jsp" %> --%>