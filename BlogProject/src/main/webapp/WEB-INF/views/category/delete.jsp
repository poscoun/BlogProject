<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<h2>카테고리 목록</h2>
	<table>
		<thead>
			<tr>
				<th>카테고리 ID</th>
				<th>카테고리명</th>
				<th>게시글 수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty CategoryList }" >
					<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${!empty CategoryList}">
					<c:forEach var="cdto" items="${CategoryList}">
						<tr>
							<td><c:out value="${cdto.category_id}"/></td>
							<td><c:out value="${cdto.category_name}"/></td>
							<td><c:out value="${cdto.post_count}"/></td>
						</tr>
						<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
<script type="text/javascript">
	<!-- 삭제 버튼 클릭 이벤트 -->
	$(document).on('click', '#btnDelete', function(){
    var url = "${pageContext.request.contextPath}/category/delete";
    url = url + "?category_id=" + ${cdto.category_id};
		location.href = url;
	});
</script>
</body>
</html>

