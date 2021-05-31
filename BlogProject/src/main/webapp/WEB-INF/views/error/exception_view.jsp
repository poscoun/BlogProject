<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exception_view.jsp</title>
</head>
<body>

	<h3>${exception.getMessage() }</h3>
	
	<ul>
		<c:forEach var="stack" items="${exception.getStackTrace() }">
			<li>${stack.toString() }</li>
		</c:forEach>

	</ul>

	<h1>현재 페이지 확인 중입니다. 잠시만 기다려주세요</h1>
</body>
</html>