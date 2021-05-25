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
			
			//console.log(frmObj);
			
			$('.btn_s').on('click', function(){
				//alert('btn click');
				//console.dir(frmObj);
				frmObj.attr('action', "/profile/modify");	
				frmObj.submit();
			});	
			
			$('.btn_c').on('click', function(){
				self.location = "/profile/list";
			});

		});	 
		
		
		
		
	</script>
	
	
</head>
<body>
	
<form method="post" role="form" enctype="multipart/form-data">

	 <input type="hidden" name="user_id" value="${profileDTO.user_id }" /> 


	<table>
		<thead>
      	<tr>
       		<th>user_id</th>
       		<th>profile_content</th>
        	<th>profile_sns</th>
        	<th>profile_phone</th>
        	<th>profile_photo</th>
        	<th>profile_date</th>
      	</tr>
    	</thead>

		<tbody>
    	<tr>
    		<td>
    			<c:out value="${profileDTO.user_id }" />
    		</td>	
			<td><input type="text" name="profile_content" value="${profileDTO.profile_content }" /></td>
			<td><input type="text" name="profile_sns" value="${profileDTO.profile_sns }" /></td>
			<td><input type="text" name="profile_phone" value="${profileDTO.profile_phone }" /></td>
			<td>
				<input type="file" name="file" id="profile_photo" />
			</td>
			<td>
				<fmt:formatDate value="${profileDTO.profile_date }" pattern="yyyy/MM/dd"/>
			</td>	
		</tr>
    	</tbody>
	</table>

	
	<div id="image_list">
		<img id="preview" src="#" width=200 height=300 name="profile_photo " />
	</div>
	<div class="select_img"><img src="" /></div>
		
	<div>
		<button type="button" class="btn_s">저장하기</button>&nbsp;
		<button type="button" class="btn_c">취소하기</button>
	</div>	



</form>

</body>
</html>