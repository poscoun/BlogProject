<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	
	$(document).on('click',	'#btnList',	function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/post/list";
	});
	
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'edit'){
			//입력 폼 셋팅
			$("#reg_id").prop('readonly', true);
			$("input:hidden[name='post_id']").val(<c:out value="${postContent.post_id}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#reg_id").val('<c:out value="${postContent.user_id}"/>');
			$("#title").val('<c:out value="${postContent.post_subj}"/>');
			$("#content").val('${postContent.post_content})');

		}
	});
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>Post Form</h2>
			<form:form name="form" id="form" role="form" modelAttribute="postDTO" method="post" 
			action="${pageContext.request.contextPath}/post/savePost">
				<!-- postDTO에는 mode라는 속성을 가지고 있지 않기 때문에 일반적인 form태그 사용 -->
				<form:hidden path="post_id" />
				<input type="hidden" name="mode"/>
				
				<!-- form 키워드 사용, name=> path 사용 -->
				<div class="mb-3">
					<label for="title">제목</label> 
					<form:input path="post_subj" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label> 
					<form:input path="user_id" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<form:textarea path="post_content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" />
				</div>
				<div class="mb-3">
					<label for="tag">TAG</label> 
					<!-- <input path="tag" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요" />
					-->
				</div>
			</form:form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
	<script type="text/javascript">
	CKEDITOR.replace( 'content',{
		width:'780',
		height:'300'
	});
	
	/* var editorContent = CKEDITOR.instances.content.getData();
	var convertContent = editorContent.replace(/(<([^>]+)>)/ig,"");
	console.log(convertContent);
	console.log(convertContent.length); */
	
	</script>
</body>
</html>