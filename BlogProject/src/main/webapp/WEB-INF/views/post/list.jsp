<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<c:url var="postList" value="/post/list"></c:url>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnWriteForm').on('click', function(){
			location.href="${pageContext.request.contextPath}/post/postForm";
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
		var url = "${pageContext.request.contextPath}/post/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
 	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, keyword) {
		var url = "${pageContext.request.contextPath}/post/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + keyword;
		location.href = url;	
	}
	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/post/list";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
	
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${postList}"
		url = url + "?keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	

</script>
<title>Insert title here</title>
</head>
<body>
	<h2>Post list</h2>
	<div class="container">
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty list}">
							<c:forEach var="list" items="${list}">
								<tr>
									<td><c:out value="${list.post_id}" /></td>
									<td>
										<a href="#" onClick="fn_contentView(<c:out value="${list.post_id }" />)">
											<c:out value="${list.post_subj}" />
										</a>
									</td>
									<td><c:out value="${list.user_id}" /></td>
									<td><c:out value="${list.post_reg}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm">글쓰기</button>
		</div>
		<br />
		<!-- pagination{s} -->
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item">
						<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}')">Previous</a>
					</li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}' )"> ${idx} </a>
					</li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item">
						<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}')" >Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->
	
		<!-- search{s} -->
		<div class="form-group row justify-content-center">
			<!-- <div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="Content">본문</option>
					<option value="reg_id">작성자</option>
				</select>
			</div> -->
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
		<!-- search{e} -->

	</div>
</body>
</html>