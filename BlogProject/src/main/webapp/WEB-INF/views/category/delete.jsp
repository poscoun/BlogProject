<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 삭제 클릭 시
		$("#delete").click(function(){
			if($(':radio[name="category_id"]:checked').length < 1) {
				alert('카테고리가 존재하지 않습니다.');
			} else{
				
				var warning = confirm('정말 삭제 하시겠습니까?');
				if(warning) {
					// yes
					$('#delList').submit();
					alert('삭제되었습니다.');
				} else {
					// no
					alert('삭제가 취소되었습니다.');
				}				
			}
		});
		
		// 카테고리명 빈값 체크 
		
	});
	

</script>
</head>
<body>
<form action="./create" method="post">
		<fieldset>
			<legend>카테고리 에디터</legend>
			카테고리명 : <input type="text" name="category_name"><br />  
			<input type="submit" value="생성" />
		</fieldset>
</form>

<h2>카테고리 목록</h2>
<form action="./delete" method="post" id="delList">
<input type="button" id="delete" value="삭제"/>
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
						 	<!-- checked="checked" 사용시 defualt 값 없이 자동으로 체크 -->
							<td><input type="radio" name="category_id" value="${cdto.category_id}" checked="checked"/><c:out value="${cdto.category_id}"/></td>
							<td><c:out value="${cdto.category_name}"/></td>
							<td><c:out value="${cdto.post_count}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</form>

</body>
</html>

