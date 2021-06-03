<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		
 		var user_id = "${user_id}"
		var blog_id = "${blog_id_update}"
		
		var frmObj = $('form[name="writeGuestForm"]')
		
		$('#guestbookmodify').on('click', function() {
			// alert('click');
			
			frmObj.attr('action', "/guestbook/guestbook_modify");
			frmObj.submit();
		});
		
		
		$('#guestcencle').on('click', function() {
			self.location = "/guestbook/guestbook_form";
		});
		
	});

</script>
<style type="text/css">
		#wrap {
			width: 700px;
			margin: 0 auto 0 auto;
		}
		
		#comment{
			text-align :left;
		}
		
		#listGuestForm{
			text-align :center;
			overflow: scroll;
			overflow-x: hidden;
			height: 220px;
		}
</style>
<div class="slider-area2">
    <div class="slider-height2 d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap hero-cap2 pt-70">
                        <a href="/post/homeList"><h2>Guest</h2></a>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/post/homeList">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Guest</a></li>
                                <li class="breadcrumb-item"><a href="#">Modify</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="cblog_area section-padding">
	<div class="container" style="padding: 3em 1.8em; margin-right: 20%;">
		<div class="row">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
					<div id="wrap" style="width: 85%;">
						<b><font size="5" color="gray">방명록</font></b>
						<hr />
						<div id="writeGuestForm">
							<form name="guestbookInfo" method="post">
								<div class="form-group">
									<!-- <input type="hidden" name="user_id" id="user_id" /> -->
									<label >${guestbookDTO.user_id }</label>
									<hr />
					   				<textarea rows="7" cols="80" style="resize: none; font-size: 18px;" class="form-control" name="guest_content">${guestbookDTO.guest_content }</textarea>
				 				</div>
								<button id="guestbookmodify" class="btn btn-light" style="padding: 13px 20px; border-radius: 20px;">확인</button>
								<button id="guestcencle" class="btn btn-light" style="padding: 13px 20px; border-radius: 20px;">돌아가기</button>
							</form>
						</div>
						<!-- 글 등록 부분 끝-->
						<br />
					</div>
				</div>
			</div>
			<%@ include file="../include/siderbar.jsp" %>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
</div>