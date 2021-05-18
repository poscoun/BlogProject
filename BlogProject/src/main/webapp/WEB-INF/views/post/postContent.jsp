<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postContent</title>
<script>
	//목록으로 이동
	$(document).on('click', '#btnList', function(){
		location.href = "${pageContext.request.contextPath}/post/list";
	});
	
	//수정 버튼 클릭 이벤트
	$(document).on('click', '#btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/post/modifyForm";
		url = url + "?post_id="+${postDTO.post_id};
		url = url + "&mode=edit";
		
		location.href = url;
	});
	
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#btnDelete', function(){
	    var url = "${pageContext.request.contextPath}/post/deletePost";
	    url = url + "?post_id=" + ${postDTO.post_id};
		location.href = url;
	});
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Content</h2>
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${postDTO.post_subj}"/></div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${postDTO.user_id}"/>,</span><span class="board_date"><c:out value="${postDTO.post_reg}"/></span>
				</div>
				<div class="board_content">${postDTO.post_content}</div>
				<div class="board_tag">TAG : </div>
			</div>
			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>