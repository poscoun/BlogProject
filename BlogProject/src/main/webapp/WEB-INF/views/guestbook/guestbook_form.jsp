<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var frmObj = $('form[name="guestbookInfo"]')
		
		$('#gustbookreg').on('click', function() {
			alert('click!');
			console.dir(frmObj);
			
			// frmObj.attr('action', "/guestbook/main");
			// frmObj.submit();
		
	});
	

</script>
<style type="text/css">
		#wrap {
			width: 700px;
			margin: 0 auto 0 auto;
		}
		
		#comment{
			text-align :left;
		}
		
		#listGuestForm{
			text-align :center;
			/*overflow:scroll; 
    		overflow-x:hidden; 
    		height:220px;*/
		}
		
		#writeGuestForm, #pageForm{
			text-align :center;
		}
</style>
</head>
<body>


	
<div id="wrap">
	<br>
	<b><font size="5" color="gray">방명록</font></b>
	<hr size="1" width="700">
	<br>

	<!-- 글 등록 부분 시작-->
	<div id="writeGuestForm">
		<form name="guestbookInfo" method="post">
			<table width="700">
				<tr>
					<td>ID : (세션에서 ID가져오기)</td>
				</tr>
				<tr><td colspan="4">&nbsp;</td></tr>
				<tr>
					<td colspan="4">
						<textarea rows="7" cols="80" name="guestbook_content" style="resize: none"> </textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="button" value="등록" id="gustbookreg">
		</form>
	</div>
	<!-- 글 등록 부분 끝-->
</div>

</body>
</html>