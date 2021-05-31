<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">
	var result = '${result}'
	
	if(result == 'success'){
		alert('success');
	}
	

	$(document).ready(function(){
		var frmObj = $('form[role="form"]');
		
		
		$('#write_btn').on('click', function(){
			self.location = "/profile/write";
		});
	
	});
	
</script>

<style type="text/css">
  .footer-btn{
  		padding: 50px 0 0 30px;
  	}
  	
  .footer-btn2{
  		padding: 30px 0 0 100px;
  	}
  
  
  .oriImg{
  		width: 600px;
  		height: 800px;
  	} 
  	
  .test{
  		padding: 30px;
  	}
  	
  .inputArea {
		margin-left: 150px;
    	height: 990px;
    	
    	padding: 100px 0px 100px 200px;
  	}
  	

</style>



<main>

	<form method="post" role="form">
	 	<input type="text" name="user_id" value="${udto.user_id }" />  	
	 </form>
	 
	 
	 
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70">
                                <h2>About Me</h2>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="#">About Me</a></li> 
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="footer-btn2">
           <button type="button" class="button button-contactForm boxed-btn" id="write_btn" >등록하기</button>
        </div>
        <!-- Hero End -->
        <!--? Visit Our Tailor Start -->
        <c:forEach items="${list }" var="pdto">
        <div class="visit-tailor-area fix">
            <!--Right Contents  -->  
            <div class="inputArea">
		 		<img src="${pdto.profile_photo}" class="oriImg"/> 
            </div>


            <!-- left Contents -->
            <div class="tailor-details">
				<span>Profile</span>
				
				<h2>
                <a href="/profile/read?user_id=${pdto.user_id }">
					 ${pdto.user_id }
                </a> 
                </h2>
                <p style="white-space:pre">  
                <c:out value="${pdto.profile_content }"></c:out>
                </p>
                
              	<div class="test"></div>
              	
              	
                <div class="footer-titles">
                
                	<div class="col-lg-8">
                    
                    	<div class="media contact-info">
                       		<span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        	<div class="media-body">
                            	<h3><c:out value="${pdto.profile_phone }"></c:out></h3>
                            	<p>Mon to Fri 9am to 6pm</p>
                        	</div>
                    	</div>
                    
                    	<div class="media contact-info">
                        	<span class="contact-info__icon"><i class="ti-email"></i></span>
                        	<div class="media-body">
                            	<h3><c:out value="${pdto.profile_sns }"></c:out></h3>
                            	<p>Send Me your query anytime!</p>
                        	</div>
                    	</div>
                    
                    	<div class="media contact-info">
                        	<span class="contact-info__icon"><i class="ti-email"></i></span>
                        	<div class="media-body">
                        		<h3><fmt:formatDate value="${pdto.profile_date }" pattern="yyyy-MM-dd"/></h3>
                            	<p>Profile Date</p>
                        	</div>
                    	</div>
                    
                	</div>
      
                    
                    <div class="footer-btn">
                    	<button type="button" class="border-btn" id="modify_btn">프로필수정</button>
                     	<button type="button" class="border-btn" id="delete_btn">프로필삭제</button>
                    </div>
                    
                    <div class="footer-btn2">
                           <button type="button" class="button button-contactForm boxed-btn" id="write_btn" >등록하기</button>
                    </div>
                </div>

                
            </div>
        </div>
       </c:forEach>
        <!-- Visit Our Tailor End -->
</main>









<%@include file="../include/footer.jsp" %>