<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		var frmObj = $('form[name="writeGuestForm"]')
		
		$('#guestbookreg').on('click', function() {
			// alert('click');
			
			frmObj.attr('action', "/guestbook/guestbook_form");
			frmObj.submit();
		});
		
	});
	
	function guestbookdel(guest_id, user_id, blog_id){
		// alert('click');
		if(confirm("삭제 하시겠습니까?")){
			location.href = '/guestbook/guestbook_del?guest_id='+guest_id+'&user_id='+user_id+'&blog_id='+blog_id;
		}
	}
	
	function guestbookupdate(guest_id, user_id, blog_id){
		location.href = '/guestbook/guestbook_modify?guest_id='+guest_id+'&user_id='+user_id+'&blog_id='+blog_id;
	}
	
	function guestbookreply(guest_id, user_id, blog_id){
		window.name = "gusetbookform";
		window.open('/guestbook/guestbook_reply?guest_id='+guest_id+'&user_id='+user_id+'&blog_id='+blog_id,
				    "rForm", "width=800, height=600, resizable=no, scrollbars=no");
		
	}
	

</script>
<style type="text/css">
		#wrap {
			width: 700px;
			margin: 0 auto 0 auto;
		}
		
		#comment{
			text-align :left;
		}
		
		#listGuestForm{
			text-align :center;
			overflow: scroll;
			overflow-x: hidden;
			height: 220px;
		}
</style>
<!--? Hero Start -->
<div class="slider-area2">
    <div class="slider-height2 d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap hero-cap2 pt-70">
                        <a href="/post/homeList"><h2>Guest</h2></a>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/post/homeList">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Guest</a></li> 
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->
<!-- 글 등록 부분 시작-->
<section class="blog_area section-padding">
 <!-- style="padding: 3em 1.8em; margin-right: 20%;" -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
					<article class="blog_item">
						<div class="blog_details">
							<div id="writeGuestForm">
								<form name="guestbookInfo" method="post">
									<div class="form-group">
										<%-- <input type="hidden" name="user_id" id="user_id" value="${udto.user_id }"/> --%>
										<input type="hidden" name="blog_id" value="${blog_id_session}" />
										<label >${udto.user_id }</label>
										<hr />
						   				<textarea rows="7" cols="80" style="resize: none; font-size: 18px;" class="form-control" name="guest_content"></textarea>
					 				</div>
									<button id="guestbookreg" class="btn btn-light" style="padding: 13px 20px; border-radius: 20px;">확인</button>
								</form>
							</div>
							<!-- 글 등록 부분 끝-->
							<br />
							<div style="border: 1px solid; border-color: #ccc; border-radius: 4px; padding: 2em">
								<div id="listGestFrom">
					        		<form method="post" name="listform">
				            			<div id="comment">
						            		<c:if test="${empty list }">
						            			<div style="text-align: center">
						            				<label>등록된 방명록이 없습니다.</label>
						            			</div>
						            		</c:if>
						            		<c:if test="${not empty list }">
						            			<c:forEach var="guestbook" items="${list}">
							            			<hr size="1">
								                	<label>${guestbook.user_id }</label>&nbsp;&nbsp;&nbsp;
								                	<label><fmt:formatDate value="${guestbook.guest_date }" pattern="yyyy-MM-dd HH:mm"/></label>&nbsp;&nbsp;&nbsp;&nbsp;
								                	<c:if test="${guestbook.user_id eq user_id }">
									                	<a href="#" onclick="guestbookupdate(${guestbook.guest_id},'${udto.user_id}', ${blog_id_update})" style="color: black">수정</a>&nbsp;
									                	<a href="#" onclick="guestbookdel(${guestbook.guest_id},'${udto.user_id}', ${blog_id_delete})" style="color: black">삭제</a><br />
								                	</c:if>
								                	<div>
								                		${guestbook.guest_content }
								                		<c:if test="${guestbook.guest_reply_count ne 0}">
															<small><b>[&nbsp;<c:out value="${guestbook.guest_reply_count}"/>&nbsp;]</b></small>
														</c:if>		
								                	</div>
								                	<br />
								                	<a  href="#" onclick="guestbookreply('${guestbook.guest_id}','${udto.user_id}','${guestbook.blog_id}')" style="color: black">답글쓰기</a><br>
						                		</c:forEach>
											</c:if>
				            			</div>
					        		</form>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
			<%@ include file="../include/siderbar.jsp" %>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
</section>
<%@ include file="../include/footer.jsp" %>
