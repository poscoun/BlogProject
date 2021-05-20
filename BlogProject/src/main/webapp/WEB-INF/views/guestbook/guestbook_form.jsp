<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
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
	
	function guestbookreply(guest_id){
		window.name = "replyForm";
		window.open('/guestbook/guestbook_reply?guest_id='+guest_id, 
				    "rForm", "width=800, height=600, resizable=no, scrollbars=no");
		
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
				<div class="form-group">
					<input type="text" name="user_id" id="user_id" placeholder="세션에서 가져올 아이디" />
					<hr />
    				<textarea rows="7" cols="80" style="resize: none" class="form-control" name="guest_content"></textarea>
  				</div>
				<button id="guestbookreg" class="btn btn-light" >확인</button>
			</form>
		</div>
		<!-- 글 등록 부분 끝-->
		<div id="listGestFrom">
	        <form method="post" name="listform">
	            <input type="hidden" name="pro">
	            <div id="comment">
	            	<br />
		            <c:if test="${empty list }">
		            	<label>등록된 방명록이 없습니다.</label>
		            </c:if>
		            <c:if test="${not empty list }">
		            	<c:forEach var="guestbook" items="${list}" varStatus="Count">
		            		<hr size="1" width="700">
			                <label>${guestbook.user_id }</label>&nbsp;&nbsp;&nbsp;
			                <label><fmt:formatDate value="${guestbook.guest_date }" pattern="yyyy-MM-dd HH:mm"/></label>&nbsp;&nbsp;&nbsp;&nbsp;
			                <a href="#" onclick="guestbookupdate(${guestbook.guest_id})">[수정]</a>&nbsp;
			                <a href="#" onclick="guestbookdel(${guestbook.guest_id})">[삭제]</a><br />
			                ${guestbook.guest_content } <br>
			                <br />
			                <a  href="#" onclick="guestbookreply(${guestbook.guest_id})">[답글쓰기]</a><br>
		                </c:forEach>
					</c:if>
	            </div>
	        </form>
	     </div>
	</div>
</body>
</html>