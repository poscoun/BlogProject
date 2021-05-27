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
	// 삭제 클릭 시
	$("#delete").click(function(){
		if($(':radio[name="category_id"]:checked').length < 1) {
			alert('카테고리가 존재하지 않습니다.');
		} else{
			
			var warning = confirm('정말 삭제 하시겠습니까?');
			if(warning) {
				// yes
				$('#delList').submit();
				alert('삭제되었습니다.');
			} else {
				// no
				alert('삭제가 취소되었습니다.');
			}				
		}
	});
});		// 삭제 클릭시 확인창 출력

$(document).ready(function(){		// 페이지가 로딩되면서 실행
	$('form[name="create"]').bind('submit', function(){		// form을 submit 하기 전에 이벤트
		if($('input[name="category_name"]').val()==''){		// input value가 빈값 일 경우
			alert('카테고리명을 입력해주세요.');
			$('input[name="category_name"]').focus();		// 해당 input에 focus
			
			return false;
		}
	})
})		// 폼 전송하기 전에 bind로 이벤트가 발생하면서 submit 이벤트 전에 실행

// 수정 버튼 클릭시 수정페이지로 이동
function modify(category_id){
	location.href = '/category/modify?category_id='+category_id;
}

$(document).ready(function(){
	$('#btnWriteForm').on('click', function post(category_id){
		location.href="/post/postForm"
	});
	
});

$(document).ready(function(){
	$('#CategoryEdit').on('click', function user(user_id){
		location.href="/category/edit";
	});
	
});
	
</script>
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70">
                                <a href="/category/edit"><h2>Category EDIT</h2></a>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item"><a href="#">category</a></li>
                                        <li class="breadcrumb-item"><a href="#">edit</a></li>
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
                         
                         <article class="blog_item">
                                <div class="blog_details">
                                    <h2>카테고리 생성</h2>
                                    <hr />
                                    <div class="form-group">
										<form action="./create" name="create" method="post">
											<div class="input-group mb-3">
												<input type="hidden" name="user_id" value="${udto.user_id }" />
												<input type="text" class="form-control" placeholder='CATEGORY NAME' name="category_name" >						
						          			</div>
						          				<input type="submit" class="btn btn-light" value="생성" />
										</form>
						      		</div>
                                </div>
                            </article>
                            
                        <c:choose>
                        	<c:when test="${empty CategoryList }">
                        		<article class="blog_item">
                                <div class="blog_details">
                                    <p>데이터가 없습니다.</p>
                                </div>
                            </article>
                        	</c:when>
                        	<c:when test="${!empty CategoryList }">
		                            <article class="blog_item">
		                                <div class="blog_details">
                        		<c:forEach var="cdto" items="${CategoryList }">
		                                    <%-- <input type="radio" name="category_id" value="${cdto.category_id }" checked="checked" /> --%>
		                                    <a href="#" onclick="modify(${cdto.category_id})"><h2 class="blog-head" style="color: #2d2d2d;">${cdto.category_name }</h2></a>
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
							  			<div>
							  				<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="CategoryEdit" onclick="user(${user_id})" type="button">EDIT</button>
							  			</div>
							  		<ul class="list cat-list">
								      
								   	</ul>
								</aside>
								<aside class="single_sidebar_widget newsletter_widget">
							  		<h4 class="widget_title" style="color: #2d2d2d;">Newsletter</h4>
									<form action="#">
										<div class="form-group">
							    			<input type="email" class="form-control" onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
							            </div>
										<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
											type="submit">Subscribe</button>
							       	</form>
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