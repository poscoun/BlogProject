<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postContent</title>
<script type="text/javascript">

	$(document).ready(function(){
		var check = '${udto.user_id}';
		if ( !check || check == ""){
			//alert('로그인하셈');
			// $('#btnReplySave').hide();
		}
		//showReplyList();
		
	});	
	
	$(document).ready(function() {
		var sessionId = '${udto.user_id}';
		var otherId = '${user_id}';
		
		if (!sessionId || sessionId == "") {
			// alert('로그인하셈');
			$('#btnUpdate').hide();
			$('#btnDelete').hide();
		}else if(sessionId != otherId){
			$('#btnUpdate').hide();
			$('#btnDelete').hide();
		}
	});
	
	//목록으로 이동
	$(document).on('click', '#btnList', function(){
		//location.href = "/post/getList?category_id="+${category_list.category_id };
		location.href = "/post/homeList";
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
		var cid = '${category_id}';
	    var url = "${pageContext.request.contextPath}/post/deletePost";
	    url = url + "?post_id=" + ${postDTO.post_id};
		if (cid){
		    url = url + "&category_id=" + cid;
		}
		location.href = url;
	});
	
	//댓글 저장 버튼 클릭 이벤트
	$(document).on('click', '#btnReplySave', function(){
		var check = '${udto.user_id}';
		if ( !check || check == ""){
			alert('Please Login');
		}else{
			var replyContent = $('#rp_content').val();
			var replyWriter = '${udto.user_id}';
			if ( !replyContent || replyContent == ""){
				alert('Please Write')
				$('#rp_content').focus();
			}else{
				
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
						//showReplyList();
						location.reload();
						$('#rp_content').val('');
					}
					, error: function(error){
						console.log("에러 : " + error);
					}
				});
			}
		}
	});
	
	function showReplyList(){
		var _date = new Date
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
	                    	var rpDate = new Date(this.rp_reg);
	                    	rpDate = rpDate.toLocaleDateString("ko-US");
	                     htmls += '<div class="media text-muted pt-3" id="rp_id' + this.rp_id + '">';
	                     htmls += '<div class="comment-list" style="background-color: #f8f9fa; padding: 10px">';
	                     htmls += '<div class="single-comment justify-content-between d-flex">';
	                     htmls += '<div class="user justify-content-between d-flex">';
	                     htmls += '<div class="desc">';
	                     htmls += '<div class="d-flex justify-content-between">';
	                     htmls += '<div class="d-flex align-items-center"><h5><a href="#" style="font-size: 12.5px"><i class="fa fa-user">&nbsp;' + this.rp_writer + '</i></a></h5>';
	                     htmls += '</div>';
	                     htmls += '</div>';
	                     htmls += '<p class="d-flex" style="font-size: 16px; padding: 5px;">';
	                     htmls += this.rp_content;
	                     htmls += '</p>';
	                     htmls += '<p class="date" style="padding-right: 30px; display: inline">' + rpDate + '</p>';
	                     htmls += '<a href="javascript:void(0)" id="qwer" onclick="fn_editReply(' + this.rp_id + ', \'' + this.rp_writer + '\', \'' + this.rp_content + '\', \'' + this.rp_reg + '\' )" style="color: #10285d; font-size: 16px; margin: 3px" >edit</a>';
	                     htmls += '<a href="javascript:void(0)" id="123444" onclick="fn_deleteReply(' + this.rp_id + ')" style="color: #10285d; font-size: 16px; margin: 3px" >del</a>';
	                     htmls += '</div>';
	                     htmls += '</div>';
	                     htmls += '</div>';
	                     htmls += '</div>';
	                     htmls += '</div>';

	                });	//each end
			}
			$("#replyList").html(htmls);

              }	   // Ajax success end
		});	// Ajax end
	}
	
	function fn_editReply(rp_id, rp_writer, rp_content, rp_reg){
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rp_id' + rp_id + '">';
		htmls += '<div class="comment-list" style="background-color: #f8f9fa; padding: 10px">';
        htmls += '<div class="single-comment justify-content-between">';
        htmls += '<div class="user justify-content-between">';
        htmls += '<div class="desc">';
        htmls += '<div class="d-flex justify-content-between">';
        htmls += '<div class="d-flex align-items-center"><h5><a href="#" style="font-size: 12.5px"><i class="fa fa-user">&nbsp;' + rp_writer + '</i></a></h5>';
        htmls += '</div>';
        htmls += '</div>';
        htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
        htmls += rp_content;
        htmls += '</textarea>';
        htmls += '<p class="date">' +   '</p>';
        htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rp_id + ', \'' + rp_writer + '\')" style="color: #10285d; font-size: 16px; margin: 3px">save</a>';
        htmls += '<a href="javascript:void(0)" onClick="showReplyList()" style="color: #10285d; font-size: 16px; margin: 3px">cancel<a>';
        htmls += '</div>';
        htmls += '</div>';
        htmls += '</div>';
        htmls += '</div>';
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
				//showReplyList();
                location.reload();
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
				//showReplyList();
				location.reload();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
</script>
<style type="text/css">
	.ck.ck-editor {
		max-width: 500px;
	}
</style>
</head>
<body>
	<!--? Preloader Start -->
	 <div id="preloader-active">
	  <div class="preloader d-flex align-items-center justify-content-center">
	    <div class="preloader-inner position-relative">
	      <div class="preloader-circle"></div>
	      <div class="preloader-img pere-text">
	        <img src="assets/img/logo/loder.png" alt="">
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Preloader Start -->
	<!--? Hero Start -->
  <div class="slider-area2">
    <div class="slider-height2 d-flex align-items-center">
      <div class="container">
        <div class="row">
          <div class="col-xl-12">
            <div class="hero-cap hero-cap2 pt-70">
              <h2>POST</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                  <li class="breadcrumb-item"><a href="#">Category</a></li> 
                  <li class="breadcrumb-item"><a href="#">Post</a></li> 
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Hero End -->
  
	<section class="blog_area single-post-area section-padding" style="padding-top: 60px;">
   <div class="container">
    <div class="row">
     <div class="col-lg-8 posts-list">
      <div class="single-post">
      <div class="blog_details" style="padding-bottom: 20px">
        <h2 style="color: #2d2d2d;"><c:out value="${postDTO.post_subj}"/>
       </h2>
       <ul class="blog-info-link mt-3 mb-4">
         <li><a href="#"><i class="fa fa-user"></i> ${postDTO.user_id }</a></li>
         <li><i class="fa "></i><c:out value="${postDTO.post_reg}"/></li>
       </ul>
       <div style="font-size: 16px; padding: 20px" id="postContent">
	       ${postDTO.post_content}
       </div>
       
   </div>
	    <div style="margin : 20px; text-align: center;">
	    	<button type="button" class="button button-contactForm btn_1 boxed-btn" id="btnUpdate" style="padding: 10px 20px;">수정</button>
			<button type="button" class="button button-contactForm btn_1 boxed-btn" id="btnDelete" style="padding: 10px 20px;">삭제</button>
		</div>
 </div>

<div class="comments-area">
 <h4>Comments</h4>
 <div id="replyList" style="padding-left: 20px;">
 
  <c:forEach items="${replyList }" var="rdto">
      <div class="media text-muted pt-3" id="rp_id${rdto.rp_id }">
         <div class="comment-list" style="background-color: #f8f9fa">
            <div class="single-comment justify-content-between d-flex">
               <div class="user justify-content-between d-flex">
                  <div class="desc">
                     <div class="d-flex justify-content-between">
                        <div class="d-flex align-items-center">
                           <h5>
                              <a href="#" style="font-size: 12.5px">${rdto.rp_writer }</a>
                           </h5>
                        </div>
                     </div>
                     <p class="d-flex" style="font-size: 16px">${rdto.rp_content }</p>
                     <p class="date" style="padding-right: 30px; display: inline">${rdto.rp_reg }</p>
                     <c:if test="${udto.user_id eq rdto.rp_writer}">

                        <a href="javascript:void(0)" onclick="fn_deleteReply(${rdto.rp_id})" style="color: #10285d; font-size: 16px; margin: 3px">del</a>

                     </c:if>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </c:forEach>
   
 </div>			
</div>


<div class="comment-form">
 <h4>Leave a Reply</h4>
 <form:form name="form" id="form" role="form" modelAttribute="replyDTO" method="post">
 <form:hidden path="post_id" id="post_id"/>
  <div class="row">
   <div class="col-12">
    <div class="form-group">
    <form:textarea path="rp_content" id="rp_content" class="form-control w-100" rows="9" placeholder="Write Comment"></form:textarea>
   </div>
 </div>
</div>
<div class="form-group">
 <button type="button" class="button button-contactForm btn_1 boxed-btn" id="btnReplySave">Post Comment</button>
</div>
</form:form>

</div>
	<div style="margin : 20px; text-align: center;">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
	</div>
</div>
	<%@ include file="../include/siderbar.jsp" %>
</div>
</div>
</section>
<!-- Blog Area End -->
</body>
</html>

<%@ include file="../include/footer.jsp" %>