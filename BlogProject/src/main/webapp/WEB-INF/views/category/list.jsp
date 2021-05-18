<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
<h2>카테고리 목록</h2>
	<table>
		<colgroup>

		</colgroup>
		<thead>
			<tr>
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
					<c:forEach var="list" items="${CategoryList}">
						<tr>
							<td><c:out value="${list.category_name}"/></td>
							<td><c:out value="${list.post_count}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</body>
</html>


