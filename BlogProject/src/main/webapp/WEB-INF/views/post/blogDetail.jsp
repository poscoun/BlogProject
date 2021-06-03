<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postContent</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		showReplyList();
	});	
	
	//목록으로 이동
	$(document).on('click', '#btnList', function(){
		location.href = "${pageContext.request.contextPath}/post/list";
	});
	
	//수정 버튼 클릭 이벤트
	$(document).on('click', '#btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/post/modifyForm";
		url = url + "?post_id="+${postDTO.post_id};
		url = url + "&mode=edit";
		
		location.href = url;
	});
	
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#btnDelete', function(){
	    var url = "${pageContext.request.contextPath}/post/deletePost";
	    url = url + "?post_id=" + ${postDTO.post_id};
		location.href = url;
	});
	
	//댓글 저장 버튼 클릭 이벤트
	$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#rp_content').val();
		var replyWriter = $('#rp_writer').val();
		var paramData = JSON.stringify({"rp_content": replyContent
				, "rp_writer": replyWriter
				, "post_id":'${postDTO.post_id}'
		});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/restPost/saveReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				$('#rp_content').val('');
				$('#rp_writer').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});
	
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/restPost/replyList";
		var paramData = {"post_id" : "${postDTO.post_id}"};
		$.ajax({
            type : 'POST',
            url : url,
            data : paramData,
            dataType : 'json',
            success : function(result) {
            	// console.log(result);
               	var htmls = "";
			if(result.length < 1){
				htmls = "등록된 댓글이 없습니다";
			} else {
	                    $(result).each(function(){
	                     htmls += '<div class="media text-muted pt-3" id="rp_id' + this.rp_id + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.rp_writer + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rp_id + ', \'' + this.rp_writer + '\', \'' + this.rp_content + '\' )" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rp_id + ')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.rp_content;
	                     htmls += '</p>';
	                     htmls += '</div>';

	                });	//each end
			}
			$("#replyList").html(htmls);
              }	   // Ajax success end
		});	// Ajax end
	}
	
	function fn_editReply(rp_id, rp_writer, rp_content){
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rp_id' + rp_id + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + rp_writer + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rp_id + ', \'' + rp_writer + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += rp_content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';

		$('#rp_id' + rp_id).replaceWith(htmls);
		$('#rp_id' + rp_id + ' #editContent').focus();
	}
	function fn_updateReply(rp_id, rp_writer){
		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"rp_content": replyEditContent, "rp_id": rp_id	});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/restPost/updateReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	function fn_deleteReply(rp_id){
		var paramData = {"rp_id": rp_id};
		$.ajax({
			url: "${pageContext.request.contextPath}/restPost/deleteReply"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				console.log(result)
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${postDTO.post_subj}"/></div>
				<div class="board_info_box">
					<span class="board_author"></span><span class="board_date"><c:out value="${postDTO.post_reg}"/></span>
				</div>
				<div class="board_content">
					${postDTO.post_content}
					<%-- <textarea rows="" cols="" id="content" name="content"><c:out value="${postDTO.post_content}"/></textarea> --%>
				</div>
			</div>
			
			<!-- Reply Form {s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form:form name="form" id="form" role="form" modelAttribute="replyDTO" method="post">
				<form:hidden path="post_id" id="post_id"/>
				<div class="row">
					<div class="col-sm-10">
						<form:textarea path="rp_content" id="rp_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
					</div>
					<div class="col-sm-2">
						<form:input path="rp_writer" class="form-control" id="rp_writer" placeholder="댓글 작성자"></form:input>
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form:form>
			</div>
			<!-- Reply Form {e} -->
			
			<!-- Reply List {s}-->
			<div class="comments-area">
 			<h4>Comments</h4>
				<div id="replyList">
				
				<div class="comment-list">
			  <div class="single-comment justify-content-between d-flex">
			   <div class="user justify-content-between d-flex">
			   <div class="desc">
			     <p class="comment">
			      Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
			      Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
			    </p>
			    
			    <div class="d-flex justify-content-between">
			      <div class="d-flex align-items-center">
			       <h5>
			        <a href="#" style="color: black">Emilly Blunt</a>
			      </h5>
			      <p class="date">December 4, 2017 at 3:12 pm </p>
			    </div>			        
			 </div>
			 
			</div>
			</div>
			</div>
			</div>
			
			
				</div>
			</div> 
			<!-- Reply List {e}-->
			
			</div>
	</article>