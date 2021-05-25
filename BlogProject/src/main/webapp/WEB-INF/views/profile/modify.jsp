<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
		$(document).ready(function(){
			var frmObj = $('form[role="form"]');
			
			//console.log(frmObj);
			
			$('#btn_s').on('click', function(){
				//alert('btn click');
				//console.dir(frmObj);
				frmObj.attr('action', "/profile/modify");	
				frmObj.submit();
			});	
			
			$('#btn_c').on('click', function(){
				self.location = "/profile/list";
			});

		});	 
		

	</script>

<main>
    <!--? Hero Start -->
    <div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70">
                            <h2>Contact</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">About</a></li> 
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->
    <!--?  Contact Area start  -->
    <section class="contact-section">
        <div class="container">
            
            <div class="row">
                <div class="col-8">
                    <h2 class="contact-title">프로필 수정</h2>
                </div>
                <div class="col-lg-8">
                    

                    <form class="form-contact contact_form" method="post" role="form" autocomplete="off" enctype="multipart/form-data">
                        <input type="hidden" name="user_id" value="${profileDTO.user_id }" />
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group" style="white-space:pre">
                                    <textarea class="form-control w-100" name="profile_content" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" > ${profileDTO.profile_content }</textarea>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control valid" name="profile_phone" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter phone number'" value="${profileDTO.profile_phone }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control valid" name="profile_sns" id="text" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" value="${profileDTO.profile_sns }">
                                </div>
                            </div>
                            <div class="inputArea">
 								<label for="profile_photo">이미지</label>
 								<input type="file" id="profile_photo" name="file" />
 								<div class="select_img"><img src="" /></div>
 

							</div>	
<script>
  $("#profile_photo").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  
  <%=request.getRealPath("/") %>
  
 </script>	
                            
                       </div>
                       <div class="form-group mt-3" >
                            <button type="button" class="button button-contactForm boxed-btn" id="btn_s">저장하기</button>
                            <button type="button" class="button button-contactForm boxed-btn" id="btn_c">취소하기</button>
                       </div>
                    </form>

                </div>
                
            </div>
        </div>
    </section>
</main>






<%@include file="../include/footer.jsp" %>