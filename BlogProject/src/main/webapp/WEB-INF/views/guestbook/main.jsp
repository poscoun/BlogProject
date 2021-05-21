<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest_book</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

<link rel="stylesheet" href="/resources/assets/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">

<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/assets/css/aos.css">

<link rel="stylesheet" href="/resources/assets/css/ionicons.min.css">

<link rel="stylesheet" href="/resources/assets/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/assets/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/assets/css/flaticon.css">
<link rel="stylesheet" href="/resources/assets/css/icomoon.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var frmObj = $('form[name="guestbookInfo"]')
			
		$('#guestbook').on('click', function(){
			// alert('click')
			
			frmObj.attr('action', "/guestbook/guestbook_form");
			frmObj.method('get');
			frmObj.submit();
	
		});
		
		
	});

</script>
</head>
<body>
	<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
		<h1 id="colorlib-logo"><a href="index.html"><span class="img" style="background-image: url(images/author.jpg);"></span>Louie Smith</a></h1>
		<nav id="colorlib-main-menu" role="navigation">
			<ul>
				<li class="colorlib-active"><a href="index.html">Home</a></li>
				<li><a href="collection.html">Collection</a></li>
				<li><a href="about.html">About Me</a></li>
				<li><a href="services.html">My Services</a></li>
				<li><a href="blog.html">Blog</a></li>
				<li><a href="/guestbook/guestbook_form" >Gusetbook</a></li>
				<li>Total : <%=session.getAttribute("totalCount") %></li>
				<li>Today : <%=session.getAttribute("todayCount") %></li>
			</ul>
		</nav>
		<div class="colorlib-footer">
			<h3>Newsletter</h3>
			<div class="d-flex justify-content-center">
				<form action="#" class="colorlib-subscribe-form">
         			<div class="form-group d-flex">
         				<div class="icon"><span class="icon-paper-plane"></span></div>
           				<input type="text" class="form-control" placeholder="Enter Email Address">
         			</div>
       			</form>
			</div>
		</div>
	</aside> <!-- END COLORLIB-ASIDE -->
</body>
</html>