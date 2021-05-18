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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var frmObj = $('form[name="writeGuestForm"]')
		
		$('#guestbookreg').on('click', function() {
			// alert('click');
			
			frmObj.attr('action', "/guestbook/guestbook_form");
			frmObj.submit();
		});
		
	});
	
	function guestbookdel(guest_id){
		// alert('click');
		if(confirm("삭제 하시겠습니까?")){
			location.href = '/guestbook/guestbook_del?guest_id='+guest_id;
		}
	}
	
	function guestbookupdate(guest_id){
		location.href = '/guestbook/guestbook_modify?guest_id='+guest_id;
	}
	

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
							<input type="text" name="user_id" placeholder="세션에서 아이디 가져오기">
						</td>
					</tr>
					<tr><td colspan="4">&nbsp;</td></tr>
					<tr>
						<td colspan="4">
							<textarea rows="7" cols="80" name="guest_content" style="resize: none"> </textarea>
						</td>
					</tr>
				</table>
				<button id="guestbookreg" class="btn btn-light" >확인</button>
			</form>
		</div>
		<!-- 글 등록 부분 끝-->
		<div id="listGestFrom">
	        <form method="post" name="listform">
	            <input type="hidden" name="pro">
	            <div id="comment">
	            	<c:forEach var="guestbook" items="${list}">
		                <hr size="1" width="700">
		                <label>${guestbook.user_id }</label>&nbsp;&nbsp;&nbsp;
		                <label><fmt:formatDate value="${guestbook.guest_date }" pattern="yyyy-MM-dd HH:mm"/></label>&nbsp;&nbsp;&nbsp;&nbsp;
		                <a href="#" onclick="guestbookupdate(${guestbook.guest_id})">[수정]</a>&nbsp;
		                <a href="#" onclick="guestbookdel(${guestbook.guest_id})">[삭제]</a><br>
		                 ${guestbook.guest_content } <br>
		                 <br />
		                 <a data-bs-toggle="collapse" href="#guestreply" role="button" aria-expanded="false" aria-controls="guestreply">[댓글쓰기]</a>&nbsp;
		                 <br />
		                 <div class="collapse" id="guestreply">
  							<textarea rows="7" cols="80" name="guest_content" style="resize: none"> </textarea>
						</div>
		                 <hr size="1" width="700">
	                 </c:forEach>
	            </div>
	        </form>
	     </div>
	</div>
</body>
</html>