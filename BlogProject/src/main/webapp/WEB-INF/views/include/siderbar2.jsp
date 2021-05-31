<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnWriteForm').on('click', function post(category_id){
		location.href="/post/postForm"
	});
	
});
</script>
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
	  		</form>
		</aside>
		<aside class="single_sidebar_widget">
			<div>
				<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="btnWriteForm" onclick="post(${category_id})" type="button">POST</button>
			</div>
		</aside>
		<aside class="single_sidebar_widget post_category_widget">
			<h4 class="widget_title" style="color: #2d2d2d;">Category</h4>
			<c:forEach var="category_list" items="${ category_list}">
				<ul class="list cat-list">
					<li><a href="#">${category_list.category_name }</a></li>
				</ul>
			</c:forEach>		
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