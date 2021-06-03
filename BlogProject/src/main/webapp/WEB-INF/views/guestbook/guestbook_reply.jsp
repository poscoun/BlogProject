<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<title>방명록 답변</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style type="text/css">
		#wrap {
			width: 700px;
			margin: 0 auto 0 auto;
		}
</style>
<script type="text/javascript">

function checkValue(guest_id, guest_rp_id, blog_id){
    var form = document.replyInfo;

    if(!form.guest_rp_content.value)
    {
        alert("내용을 입력하세요.");
        $('#guest_rp_text').focus();
        return false;
    }
    else
    {
        form.target = opener.name;
        form.action='/guestbook/guestbook_reply?guest_id='+guest_id+'&guest_rp_id='+guest_rp_id+'&blog_id='+blog_id;
        form.submit();

        if (opener != null) {
            opener.rForm = null;
            self.close();
        }
    }
}
</script>
</head>
<body>
	<div id="wrap">
		<br>
		<b><font size="5" color="gray">답글</font></b>
		<hr size="1" width="700">
		<!-- 답글 등록 부분 시작-->
		<div id="writeReplyForm">
			<form name="replyInfo" target="replyForm" id="replyInfo" method="post">
				<!-- 부모 방명록의 정보를 같이 전송한다. -->
				<%-- <input type="hidden" name="blog_id" value="${blog_id}" /> --%>
				<div class="form-group">
					<label>${user_id }</label>
					<hr />
	  				<textarea rows="7" cols="80" style="resize: none" class="form-control" name="guest_rp_content" id="guest_rp_text"></textarea>
				</div>
				<br>
				<input type="button" value="확인" id="replyInsert" onclick="checkValue('${guest_id}','${user_id}','${blog_id}')" class="btn btn-light">
				<input type="button" value="창닫기" onclick="window.close()" class="btn btn-light">
			</form>
		</div>
		<!-- 답글 등록 부분 끝-->
		<div id="listGestFrom">
	        <form method="post" name="listform">
	            <div id="comment">
	            	<br />
		            <c:if test="${empty reply_list }">
		            	<label>등록된 방명록이 없습니다.</label>
		            </c:if>
		            <c:if test="${not empty reply_list }">
		            	<c:forEach var="guestbookrpl" items="${reply_list}">
		            		<hr size="1" width="700">		            			
			                <label>${guestbookrpl.guest_rp_id }</label>&nbsp;&nbsp;&nbsp;
			                <label><fmt:formatDate value="${guestbookrpl.guest_rp_date }" pattern="yyyy-MM-dd HH:mm"/></label>&nbsp;&nbsp;&nbsp;&nbsp; <br />
			                ${guestbookrpl.guest_rp_content } <br>
			                <br />
		                </c:forEach>
					</c:if>
	            </div>
	        </form>
		</div>
	</div>
</body>
</html>