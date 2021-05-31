<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 헤더 --%>
<%@ include file="../include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
	
	
</script>
<style type="text/css">
	h2 {
		text-align: center;
		color: #555;
	}
	
</style>
<h2>Category</h2>

	<table class="categoryTable" style="width:60%; height: 100px; margin: 5px 10px; text-align: left; font-size: 18px;">
		<thead>
			<tr>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty CategoryList }" >
					<tr>
						<td colspan="5" align="center">카테고리가 없습니다.</td>
						<a href="/category/edit?user_id=${udto.user_id }" style="color: black" >edit</a>
					</tr>
				</c:when> 
				<c:when test="${!empty CategoryList}">
					<c:forEach var="cdto" items="${CategoryList}">
						<tr>
							<td><B><U><a href="/post/getList?category_id=${cdto.category_id }" onclick="" style="color:#555"><c:out value="${cdto.category_name}"/></a></U></B></td>
						</tr>	
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>	
	<div >
		<%@ include file="../include/siderbar.jsp" %>
	</div>
<%@ include file="../include/footer.jsp" %>