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

<!-- CSS here -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/slicknav.css">
<link rel="stylesheet" href="/resources/assets/css/animate.min.css">
<link rel="stylesheet" href="/resources/assets/css/hamburgers.min.css">
<link rel="stylesheet" href="/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="/resources/assets/css/slick.css">
<link rel="stylesheet" href="/resources/assets/css/nice-select.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnWriteForm').on('click', function post(category_id){
			location.href="/post/postForm"
		});
		
	});
	
	function fn_contentView(post_id){
		var url = "${pageContext.request.contextPath}/post/postContent";
		url = url + "?post_id=" + post_id;
		location.href = url;
	}
	
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, keyword) {
		var page = rangeSize;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/post/getList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
 	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, keyword) {
		var url = "${pageContext.request.contextPath}/post/getList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + keyword;
		location.href = url;	
	}
	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/post/getList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
	
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "/post/getList"
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
                                <a href="/post/getList"><h2>Blog</h2></a>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="#">Blog</a></li> 
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
                        	<c:when test="${empty list }">
                        		<article class="blog_item">
                                <div class="blog_details">
                                    <p>데이터가 없습니다.</p>
                                </div>
                            </article>
                        	</c:when>
                        	<c:when test="${!empty list }">
                        		<c:forEach var="list" items="${list }">
		                            <article class="blog_item">
		                                <div class="blog_details">
		                                    <a class="d-inline-block" href="/post/postContent?post_id=${list.post_id }">
		                                        <h2 class="blog-head" style="color: #2d2d2d;">${list.post_subj }</h2>
		                                    </a>
		                                    <p><c:out value="${list.post_content}" /></p>
		                                    <ul class="blog-info-link">
		                                        <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
		                                    </ul>
		                                </div>
		                            </article>
                        		</c:forEach>
                        	</c:when>
                        </c:choose>
                            
                            <!-- pagination{s} -->
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                	<c:if test="${pagination.prev}">
	                                    <li class="page-item">
	                                        <a href="#" class="page-link" aria-label="Previous" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}')">
	                                            <i class="ti-angle-left"></i>
	                                        </a>
	                                    </li>
	                                </c:if>
	                                <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
	                                    <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
	                                        <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}' )"> ${idx} </a>
	                                    </li>  
	                                    </c:forEach>
									<c:if test="${pagination.next}">                                  
	                                    <li class="page-item">
	                                        <a href="#" class="page-link" aria-label="Next" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}')">
	                                            <i class="ti-angle-right"></i>
	                                        </a>
	                                    </li>
                                    </c:if>
                                </ul>
                            </nav>
                            <!-- pagination{e} -->
                            
                        </div>
                    </div>
						
					<div class="col-lg-4">
								<div class="blog_right_sidebar">
									<aside class="single_sidebar_widget search_widget">
										<form action="#">
											<div class="form-group">
												<div class="input-group mb-3">
													<input type="text" class="form-control" placeholder='Search Keyword' >
								          		</div>
								      		</div>
								      		<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								      			type="submit">Search
								      		</button>
											<aside class="single_sidebar_widget">
												<div>
													<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="btnWriteForm" onclick="post(${category_id})" type="button">POST</button>
												</div>
											</aside>
								  		</form>
									</aside>
									<aside class="single_sidebar_widget post_category_widget">
								  		<h4 class="widget_title" style="color: #2d2d2d;">Category</h4>
								  			<ul class="list cat-list">
								  				<c:forEach var="cdto" items="${CategoryList }">
								  					<li>
								  						<a href="#" class="d-flex">${cdto.category_name }</a>
								  					</li>
								  				</c:forEach>
								  			</ul>
								  			<div>
								  				<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="CategoryEdit" onclick="user(${user_id})" type="button">EDIT</button>
								  			</div>
								  		<ul class="list cat-list">
									      
									   	</ul>
									</aside>
									<aside class="single_sidebar_widget post_category_widget" >
								  		<h4 class="widget_title" style="color: #2d2d2d; margin-bottom: 20px;">Guest</h4>
								  		<label style="font: 20px;">Total : <%=session.getAttribute("totalCount") %></label> <br />
										<label style="font: 20px;">Today : <%=session.getAttribute("todayCount") %></label>
									</aside>
								</div>
							</div>
						
                </div>
            </div>
        </section>
<%@ include file="../include/footer.jsp" %>
