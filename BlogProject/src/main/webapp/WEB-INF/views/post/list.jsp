<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('#btnWriteForm').on('click', function(){
			alert("btnWriteForm click");
			preventDefault();
			location.href="${pageContext.request.contextPath}/post/postForm";
		});
		
	});
	
	function fn_contentView(post_id){
		var url = "${pageContext.request.contextPath}/post/postContent";
		url = url + "?post_id=" + post_id;
		location.href = url;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>board list</h2>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty list}">
							<c:forEach var="list" items="${list}">
								<tr>
									<td><c:out value="${list.post_id}" /></td>
									<td>
										<a href="#" onClick="fn_contentView(<c:out value="${list.post_id }" />)">
											<c:out value="${list.post_subj}" />
										</a>
									</td>
									<td><c:out value="${list.user_id}" /></td>
									<td><c:out value="${list.post_reg}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm">글쓰기</button>
		</div>
	</div>
</body>
</html>