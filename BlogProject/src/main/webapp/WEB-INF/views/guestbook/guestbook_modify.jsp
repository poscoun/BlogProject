<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		
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
									<input type="text" name="user_id" id="user_id" placeholder="세션에서 가져올 아이디" />
									<hr />
					   				<textarea rows="7" cols="80" style="resize: none" class="form-control" name="guest_content">${guestbookDTO.guest_content }</textarea>
				 				</div>
								<button id="guestbookmodify" class="btn btn-light" style="color: black;">확인</button>
								<button id="guestcencle" class="btn btn-light" style="color: black;">돌아가기</button>
							</form>
						</div>
						<!-- 글 등록 부분 끝-->
						<br />
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<form action="#">
							<div class="form-group">
								<div class="input-group mb-3">
									<input type="text" class="form-control" placeholder='Search Keyword' >
		            			</div>
		        			</div>
		        			<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
		        				type="submit">Search</button>
		    			</form>
					</aside>
					<aside class="single_sidebar_widget post_category_widget">
		    			<h4 class="widget_title" style="color: #2d2d2d;">Category</h4>
		    			<ul class="list cat-list">
					       
					    </ul>
					</aside>
					<aside class="single_sidebar_widget newsletter_widget">
		    			<h4 class="widget_title" style="color: #2d2d2d;">Newsletter</h4>
						<form action="#">
    						<div class="form-group">
        						<input type="email" class="form-control" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
                			</div>
							<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
							type="submit">Subscribe</button>
           				</form>
	       			</aside>
					<aside class="single_sidebar_widget post_category_widget" >
		    			<h4 class="widget_title" style="color: #2d2d2d; margin-bottom: 20px;">Guest</h4>
		    			<label style="font: 20px;">Total : <%=session.getAttribute("totalCount") %></label> <br />
						<label style="font: 20px;">Today : <%=session.getAttribute("todayCount") %></label>
					</aside>
	   			</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
</div>