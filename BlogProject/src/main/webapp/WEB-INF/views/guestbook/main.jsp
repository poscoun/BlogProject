<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest_book</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var frmObj = $('form[name="guestbookInfo"]')
			
		$('#joinBtn7').on('click', function(){
			// alert('click')
			
			frmObj.attr('action', "/guestbook/guestbook_form");
			frmObj.method('get');
			frmObj.submit();
	
		});
		
		
	});

</script>
</head>
<body>
	<div id = "wrap">
		<form action="" method="get" name="guestbookInfo">
			<p>
				<button class="btn btn-success" onclick="changeView(0)">HOME</button>
				<button id="loginBtn" class="btn btn-primary" onclick="changeView(1)">로그인</button>
				<button id="joinBtn" class="btn btn-primary" onclick="changeView(2)">회원가입</button>
				<button id="joinBtn" class="btn btn-info" onclick="changeView(6)">게시판</button>
				<button id="joinBtn7" class="btn btn-info" >방명록</button>
			</p>
		</form>
	</div>
</body>
</html>