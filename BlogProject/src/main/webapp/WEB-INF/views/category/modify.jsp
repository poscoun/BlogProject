<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		
		var frmObj = $('form[name="CategoryModify"]').category_id
		
		// 수정 버튼 클릭시
		$('#Confirm').on('click', function() {
			//alert('click');
			
			frmObj.attr('action', "/category/modify");
			frmObj.submit();
		});
		
		// 돌아가기 버튼 클릭시
		$('#Cencle').on('click', function() {
			self.location = "/category/edit";
		});
		
		// 삭제 버튼 클릭시
		$('#delete').click(function(){
			var warning = confirm('정말 삭제 하시겠습니까?');
			if(warning) {
				// yes
			$("#CategoryInfo").attr('action', "/category/delete").submit();
				alert('삭제되었습니다.');
			} else {
				// no
				alert('삭제가 취소되었습니다.');
			}
			
			
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
			<b><font size="5" color="gray">카테고리 수정</font></b>
			<hr />
			<div id="CategoryModify">
				<form id="CategoryInfo" name="CategoryInfo"  method="post">
					<div class="form-group">
						<label>${categoryDTO.user_id }</label>
						<hr />
						<input type="hidden" name="category_id" value="${categoryDTO.category_id}" />
						<textarea rows="7" cols="80" style="resize: none" class="form-control" name="category_name">${categoryDTO.category_name }</textarea>
					</div>
					<button id="Confirm" class="btn btn-light" >확인</button>
					<button id="delete" class="btn btn-light">삭제</button>
					<button id="Cencle" class="btn btn-light">돌아가기</button>
				</form>
			</div>
		</div>
	</div>
</div>
<br />
<br />
<br />
<br />
<%@ include file="../include/footer.jsp" %>