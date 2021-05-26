<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	var result = '${result}'
	
	if(result == 'success'){
		alert('success');
	}
</script>

</head>
<body>
<table>
	<thead>
      <tr>
        <th>user_id</th>
        <th>profile_content</th>
        <th>profile_sns</th>
        <th>profile_phone</th>
        <th>profile_date</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list }" var="pdto">
    	<tr>	
			<td><a href="/profile/read?user_id=${pdto.user_id }">${pdto.user_id }</a></td>
			<td>${pdto.profile_content }</td>
			<td>${pdto.profile_sns }</td>
			<td>${pdto.profile_phone }</td>
			<td>
				<fmt:formatDate value="${pdto.profile_date }" pattern="yyyy/MM/dd HH:mm"/>
			</td>
		</tr>	
		</c:forEach>
		
    </tbody>
</table>
</body>
</html>
