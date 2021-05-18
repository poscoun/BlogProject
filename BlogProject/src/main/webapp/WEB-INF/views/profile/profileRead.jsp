<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>profileRead</title>
    <meta charset="utf-8">
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
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<h1 id="colorlib-logo"><a href="index.html"><span class="img" style="background-image: url(images/author.jpg);"></span>Louie Smith</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="#">Home</a></li>
					<li><a href="#">Collection</a></li>
					<li><a href="#">About Me</a></li>
					<li><a href="#">My Services</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">Contact</a></li>
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
		<div id="colorlib-main">
			<section class="ftco-section-no-padding bg-light">
				<div class="hero-wrap">
					<div class="overlay"></div>
					<div class="d-flex align-items-center js-fullheight">
						<div class="author-image text img d-flex">
							<section class="home-slider js-fullheight owl-carousel">
					      <div class="slider-item js-fullheight" style="background-image: url(images/author.jpg);">
					      </div>

					      <div class="slider-item js-fullheight" style="background-image:url(images/author-2.jpg);">
					      </div>
					    </section>
						</div>
						<div class="author-info text p-3 p-md-5">
							<div class="desc">
							<c:forEach items="${list }" var="pdto">
							
								<span class="subheading">Hello! I'm</span>
								<h1 class="big-letter">${pdto.user_id }</h1>
								<h1 class="mb-4"><span>${pdto.user_id }</span></h1>
								<p class="mb-4">${pdto.profile_content }</p>
								<h1 class="signature h1">About Me</h1>
								<div class="block-23 mb-3">
		              				<ul>
		                				<li><label>HOBBY</label><p class="mb-4">(profile_hobby)</p></li>
		                				<li><label>PHONE</label><p class="mb-4">${pdto.profile_phone }</p></li>
		                				<li><label>SNS</label><p class="mb-4">(profile_sns)</p></li>
		              					</ul>
		            			</div>
							
							
							
							</c:forEach>
								
	            			</div>

	            			<p><a href="profileModify.jsp" class="btn-custom">수정 <span class="ion-ios-arrow-forward"></span></a></p>
	            			<p><a href="#" class="btn-custom">초기화 <span class="ion-ios-arrow-forward"></span></a></p>
						</div>
					</div>
				</div>
			</section>
			

	   

		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/resources/assets/js/jquery.min.js"></script>
  <script src="/resources/assets/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/assets/js/popper.min.js"></script>
  <script src="/resources/assets/js/bootstrap.min.js"></script>
  <script src="/resources/assets/js/jquery.easing.1.3.js"></script>
  <script src="/resources/assets/js/jquery.waypoints.min.js"></script>
  <script src="/resources/assets/js/jquery.stellar.min.js"></script>
  <script src="/resources/assets/js/owl.carousel.min.js"></script>
  <script src="/resources/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/assets/js/aos.js"></script>
  <script src="/resources/assets/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/assets/js/bootstrap-datepicker.js"></script>
  <script src="/resources/assets/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/resources/assets/js/main.js"></script>
    
  </body>
</html>