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
<div id="colorlib-main">
	<div class="ftco-section" style="padding: 3em 1.8em; margin-right: 20%;">
		<div id="wrap" style="width: 85%;">
			<b><font size="5" color="gray">방명록</font></b>
			<hr />
			<div id="writeGuestForm">
				<form name="guestbookInfo" method="post">
					<div class="form-group">
						<!-- <input type="hidden" name="user_id" id="user_id" /> -->
						<label>${guestbookDTO.user_id }</label>
						<hr />
						<textarea rows="7" cols="80" style="resize: none" class="form-control" name="guest_content">${guestbookDTO.guest_content }</textarea>
					</div>
					<button id="guestbookreg" class="btn btn-light" >확인</button>
					<button id="guestcencle" class="btn btn-light">돌아가기</button>
				</form>
			</div>
		</div>
	</div>
</div>
<br />
<br />
<br />
<br />