<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</head>
<body>	
	<div id="wrap">
		<br>
		<b><font size="5" color="gray">방명록</font></b>
		<hr size="1" width="700">
		<br>
	
		<!-- 글 등록 부분 시작-->
		<div id="writeGuestForm">
			<form name="guestbookInfo" method="post">
				<table width="700">
					<tr>
						<td>
							<input type="text" name="user_id" value="${guestbookDTO.user_id }" readonly="readonly">
						</td>
					</tr>
					<tr><td colspan="4">&nbsp;</td></tr>
					<tr>
						<td colspan="4">
							<textarea rows="7" cols="80" name="guest_content" style="resize: none">${guestbookDTO.guest_content }</textarea>
						</td>
					</tr>
				</table>
				<button id="guestbookmodify" class="btn btn-light" >확인</button>
				<button id="guestcencle" class="btn btn-light">돌아가기</button>
			</form>
		</div>
	</div>
</body>
</html>