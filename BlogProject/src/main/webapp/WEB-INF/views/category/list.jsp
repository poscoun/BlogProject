<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 목록</title>
</head>
<body>
<table>
	<tr>
		<td>카테고리명</td>
	</tr>
	<c:forEach items="${CategoryList }" var="cdto" >
	<tr>
		<td>${cdto.category_name }</td>
		<td><a href="delete?category_id=${cdto.category_id }">X</a></td>
	</tr>	
	</c:forEach>
</table>
</body>
</html>