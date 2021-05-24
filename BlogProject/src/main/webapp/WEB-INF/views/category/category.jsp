<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 헤더 --%>
<%@ include file="../include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	h2 {
		text-align: center;
		color: #555;
	}
	
</style>
<h2>Category</h2>
	<table class="categoryTable" style="width:60%; height: 100px; margin: 5px 10px; text-align: left; font-size: 18px;">
=======
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>카테고리</h2>
	<table>
>>>>>>> e518a851ee4b91323380260f8a215f52ddc09660
		<thead>
			<tr>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty CategoryList }" >
					<tr><td colspan="5" align="center">카테고리가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${!empty CategoryList}">
					<c:forEach var="cdto" items="${CategoryList}">
						<tr>
<<<<<<< HEAD
							<td><B><U><a href="#" onclick="" style="color:#555"><c:out value="${cdto.category_name}"/></a></U></B></td>
=======
							<td><a href="#" onclick=""><c:out value="${cdto.category_name}"/></a></td>
>>>>>>> e518a851ee4b91323380260f8a215f52ddc09660
						</tr>	
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>	
<<<<<<< HEAD
<%@ include file="../include/footer2.jsp" %>
=======
</body>
</html>
>>>>>>> e518a851ee4b91323380260f8a215f52ddc09660
