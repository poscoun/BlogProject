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
				frmObj.attr('action', "/profile/write");	
				frmObj.submit();
			});	
			
			$('#btn_c').on('click', function(){
				self.location = "/profile/list";
			});

		});	 
		
		$(document).on("keyup", "#phoneNumber", function() {
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });


	</script>
	
	<style type="text/css">
		#profile{
			padding-left: 300px;
		}
		
		#btn{
			padding-left: 65px;
		}
	</style>

<main>
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
    <!-- Hero End -->
    <!--?  Contact Area start  -->
    <section class="contact-section">
        <div class="container">
            
            <div class="row" id="profile">
                <div class="col-10">
                    <h2 class="contact-title">프로필 등록</h2>
                </div>
                <div class="col-lg-10">
                    

                    <form class="form-contact contact_form" method="post" role="form" autocomplete="off" enctype="multipart/form-data">
                             

                        <div class="row">
                        	<div class="col-sm-8">
                                <div class="form-group">

                                	<label>USER ID</label>
                                    <input class="form-control valid" name="user_id" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter id'" value="${udto.user_id }" readonly="readonly" >
                                </div>
                            </div>
                            <div class="col-8">
                                <div class="form-group" >
                                	<label>CONTENT</label>
                                    <textarea class="form-control w-100" name="profile_content" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter comment'" placeholder="자기소개글을 입력하세요"></textarea>

                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group">
                                	<label>PHONE NUMBER</label>
                                    <input class="form-control valid" name="profile_phone" id="phoneNumber" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter phone number'" placeholder="전화번호를 입력하세요" >
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group">
                                	<label>E-MAIL</label>
                                    <input class="form-control valid" name="profile_sns" id="text" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="이메일을 입력하세요">
                                </div>
                            </div>
                            
                            
                            <div class="col-sm-8">
                                <div class="form-group">
                            		<div class="inputArea">
 										<label>PROFILE IMAGE</label>
 										<div><input type="file" id="profile_photo" name="file"/></div>
 										<div class="select_img"><img src="" /></div>
									</div>	
								</div>
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
                       <div class="form-group mt-3" id="btn">
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