<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
  
<title>G - Blog</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- CSS here -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/slicknav.css">
<link rel="stylesheet" href="/resources/assets/css/flaticon.css">
<link rel="stylesheet" href="/resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="/resources/assets/css/gijgo.css">
<link rel="stylesheet" href="/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="/resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="/resources/assets/css/slick.css">
<link rel="stylesheet" href="/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
</head>
<script type="text/javascript">
 $(document).ready(function(){
	console.log('${user_id}');
	console.log('${blog_id}');
});

function fn_category(){
    var user_id = '${user_id}';
    var url = "/category/category"; 
    
    if(user_id != "" || user_id != null){
       url = url + "?user_id=" + user_id;
    }
    location.href = url;
 }
 
function fn_guestbook(){
    var user_id = '${user_id}';
    var blog_id = '${blog_id}';
    var url = "/guestbook/guestbook_form"; 
    
    
    if(user_id != "" || user_id != null){
       url = url + "?user_id=" + user_id+"&blog_id="+blog_id;
    }
    location.href = url;
 }

</script>
<body>
<header>
	<!-- 조건문 삽입 : session 에 ID 가 없을시 출력 부분 -->
	<!-- Header Start -->
	<c:if test="${sessionScope.udto eq null }">
	 	<div class="header-area">
		    <div class="main-header ">
		        <div class="header-bottom  header-sticky">
		            <div class="container-fluid">
		                <div class="row align-items-center">
							<div class="col-xl-2 col-lg-2">
							    <div class="logo">
							        <a href="/post/homeList"><img src="/resources/assets2/img/logo/loder.png" alt=""></a>
							    </div>
							</div>
							<div class="col-xl-10 col-lg-10">
							    <div class="menu-wrapper  d-flex align-items-center justify-content-end">
									<div class="main-menu d-none d-lg-block">
									    <nav>
									        <ul id="navigation">                                                                                          
									            <li><a href="/post/homeList">Home</a></li>
									            <li><a href="#" onclick="">Category</a></li>
									            <li><a href="/user/login" onclick="">Guest</a></li>
									            <li><a href="/user/login">Sign In</a></li>
									        </ul>
									    </nav>
									</div>
							    </div>
							</div> 
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</c:if>
	<c:if test="${sessionScope.udto ne null }">
		<div class="header-area">
			<div class="main-header ">
				<div class="header-bottom  header-sticky">
					<div class="container-fluid">
						<div class="row align-items-center">
	                    	<div class="col-xl-2 col-lg-2">
	                        	<div class="logo">
	                            	<a href="/post/homeList"><img src="/resources/assets/img/logo/loder.png" alt=""></a>
	                        	</div>
	                    	</div>
	                    	<div class="col-xl-10 col-lg-10">
	                        	<div class="menu-wrapper  d-flex align-items-center justify-content-end">
	                            <!-- Main-menu -->
	                            	<div class="main-menu d-none d-lg-block">
	                                	<nav>
	                        				<ul id="navigation">                                                                                          
				                               <li><a href="/post/homeList">Home</a></li>
				                               <li><a href="#" onclick="fn_category()" >Category</a></li>
				                               <li><a href="#" onclick="fn_guestbook()">Guest</a></li>
				                               <c:if test="${sessionScope.Profile_list ne null }" >
				                               <li><a href="#">About</a>
													<ul class="submenu">
														<li><a href="/profile/read?user_id=${udto.user_id }">MyProfile</a></li>	
                                                        <li><a href="/user/logout.do">Sign Out</a></li>
													</ul>
												</li>
				                               </c:if>
												<c:if test="${sessionScope.Profile_list eq null }">
	                                               	<li><a href="#">About</a>                                                      
	                                               		<ul class="submenu"> 
	                                               			<li><a href="/profile/write">ProfileWrite</a></li>
	                                                        <li><a href="/user/logout.do">Sign Out</a></li>
	                                                     </ul>
	                                               	</li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
							</div> 
	                	</div>
	            	</div>
	        	</div>
	    	</div>
		</div>
	</c:if>
	<!-- Header End -->
</header>
</body>
</html>