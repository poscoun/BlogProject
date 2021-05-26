<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var frmObj = $('form[role="form"]');
			
			
			
			$('.btn_m').click(function(){
				frmObj.attr('action', 'modify');
				frmObj.attr('method', 'get');
				frmObj.submit();
			});
			
			
			$(".btn_d").click(function(){
				var con = confirm("삭제하시겠습니까?");
				if(con) {
					frmObj.attr("action", "delete");
					frmObj.submit();
				}		
			});
			
		});	 
		
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
    			<tr>
    				<td>
    					<c:out value="${profileDTO.user_id }"></c:out>
    				</td>	
					<td><input type="text" name="profiile_content" value="${profileDTO.profile_content }" readonly="readonly" /></td>
					<td><input type="text" name="profiile_sns" value="${profileDTO.profile_sns }" readonly="readonly" /></td>
					<td><input type="text" name="profiile_phone" value="${profileDTO.profile_phone }" readonly="readonly" /></td>
					<td>
						<fmt:formatDate value="${profileDTO.profile_date }" pattern="yyyy/MM/dd"/>
					</td>	
				</tr>	
    		</tbody>
		</table>
		
		<div class="inputArea">
 			<label for="profile_photo">이미지</label>
 			<p>profile_photo</p>
		 	<img src="${profileDTO.profile_photo}" class="oriImg"/> 
		</div>
		
		<div>
			<button type="button" class="btn_m">수정하기</button>&nbsp; 
			<button type="button" class="btn_d">삭제하기</button>
		</div>

</body>
</html>