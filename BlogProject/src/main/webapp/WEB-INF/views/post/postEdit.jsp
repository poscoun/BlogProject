<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script src="https://cdn.ckeditor.com/4.16.1/standard-all/ckeditor.js"></script>
<script>
	$(document).on('click', '#btnSave', function() {
		var title = $('#post_subj').val();
		var frmObj = $('form[role="form"]');
		
		if (title == null || title==""){
			alert("Please Write Title");
			$('#title').focus();
		}else{
			frmObj.attr('action', "/post/updatePost?post_id="+${postContent.post_id});   
			frmObj.submit();
		}
	});
	
	$(document).on('click',	'#btnList',	function() {
		location.href = "${pageContext.request.contextPath}/post/homeList";
	});
</script>
</head>
		<!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70">
                                <a href="#"><h2>POST FORM</h2></a>
                                <nav aria-label="breadcrumb">
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
<body>
	<article>
		<section class="blog_area single-post-area section-padding" style="padding-top: 60px;">
		   <div class="container">
		   <form class="form-contact contact_form" method="post" role="form" enctype="multipart/form-data">
				<input type="hidden" name="post_id" value="${postContent.post_id}"/>
				<div class="input-group mb-3">
					<label for="category_select" style="font-size: 12px; padding: 5px">category</label>
					<select name="category_id" id="category_select" >
							<c:forEach var="cdto" items="${CategoryList }">
								<option value="${cdto.category_id }">${cdto.category_name }</option>
							</c:forEach>
					</select>				
				</div>
				<!-- form 키워드 사용, name=> path 사용 -->
				<div class="input-group mb-3">
					<input class="form-control" name="post_subj" id="post_subj" type="text" style="font-size:20px; height: 40px" value='<c:out value="${postContent.post_subj}"/>'>
				</div>
				<div class="input-group">
				</div>
				
				<div>
					<textarea class="form-control w-100" name="post_content" id="post_content" cols="30" rows="9">${postContent.post_content}</textarea>
				</div>				
			</form>
			<div style="text-align: center; margin: 40px">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" style="margin: 10px">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
		</section>
	</article>
			
	<script type="text/javascript">
	
	var ckeditor_config = {
			height : 500,
		resize_enaleb : false,
		resize_maxHeight : 200,
		resize_maxWidth : 200,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		filebrowserUploadUrl : "/post/ckUpload",
		uploadUrl: "/post/ckUpload"
	};
	CKEDITOR.replace('post_content', ckeditor_config);
	
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>