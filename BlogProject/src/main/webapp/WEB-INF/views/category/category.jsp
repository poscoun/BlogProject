<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>G-Blog</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	$('#CategoryEdit').on('click', function user(user_id){
		location.href="/category/edit";
	});
	
});	
	
$(document).on('click', '#btnSearch', function(e){
	e.preventDefault();
	var url = "/post/homeList"
	url = url + "?keyword=" + $('#keyword').val();
	location.href = url;
	console.log(url);
});		
</script>
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70">
                                <a href="/category/category"><h2>Category</h2></a>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item"><a href="#">category</a></li> 
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        <!--? Blog Area Start-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                        <c:choose>
                        	<c:when test="${empty CategoryList }">
                        		<article class="blog_item">
                                <div class="blog_details">
                                    <p>카테고리가 없습니다.</p>
                                </div>
                            </article>
                        	</c:when>
                        	<c:when test="${!empty CategoryList }">
		                            <article class="blog_item">
		                                <div class="blog_details">
                        		<c:forEach var="cdto" items="${CategoryList }">
		                                    <a class="d-inline-block" href="/post/getList?category_id=${cdto.category_id }">
		                                        <h2 class="blog-head" style="color: #2d2d2d;">${cdto.category_name }</h2>
		                                    </a>
		                                    <hr />
                        		</c:forEach>
		                                    <ul class="blog-info-link">
		                                    </ul>
		                                </div>
		                            </article>
                        	</c:when>
                        </c:choose>   
                        </div>
                    </div>
					<%@ include file="../include/siderbar.jsp" %>					
                </div>
            </div>
        </section>
<%@ include file="../include/footer.jsp" %>