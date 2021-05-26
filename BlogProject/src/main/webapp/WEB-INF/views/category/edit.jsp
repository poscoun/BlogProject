<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 에디터 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>카테고리 목록</h2>
	<table>
		<thead>
			<tr>
				<th>카테고리 ID</th>
				<th>카테고리명</th>
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
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</body>
</html>