<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>





<main>
   <div class="slider-area2">
      <div class="slider-height2 d-flex align-items-center">
         <div class="container">
            <div class="row">
               <div class="col-xl-12">
                  <div class="hero-cap hero-cap2 pt-70">
                     <h2>BLOG MEMBER</h2>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                           
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


   <section class="contact-section">
     <hr style="border: solid 5px #09cc7f; width: 100%;" >
            <div class="container" >
                <div class="row">
                    <form class="form-contact contact_form" method="POST">
                    <c:forEach items="${allList }" var="pdto">
                    <div class="col-lg-6 col-md-6 col-sm-6"  style="float: left;" >
                        <div class="blog_left_sidebar">
                            <article class="blog_item">
                                <div class="blog_item_img">
                                    <a href="/post/homeList?user_id=${pdto.user_id}&blog_id=${pdto.blog_id}"><img class="card-img rounded-0" src="${pdto.profile_photo}" style="height: 300px; width: 350px;"></a>
                                    <div class="percentage">
                        <div class="progress" style="width: 350px;">
                           <div class="progress-bar color-2" role="progressbar" style="width: 350px; background-color: gray;" aria-valuenow="350" aria-valuemin="350"aria-valuemax="350"></div>
                                       </div>
                                       </div>
                                    
                                </div>
                                <div class="blog_details" style="width: 350px; height: 200px; padding: 30px 20px 30px 20px; background-color: 09cc7f;">
                                    <ul class="blog-info-link">
                                        <li><a href="/post/homeList?user_id=${pdto.user_id}&blog_id=${pdto.blog_id}" style="color: #2d2d2d;" class="blog-head"><i class="fa fa-user"  ></i>${pdto.user_id }</a></li>
                                        <li style="color: #2d2d2d;" class="blog-head"><i class="fa ti-email"></i>${pdto.profile_sns }</li>
                                        <%-- <li><a href="/post/getList?category_id=${category_list.category_id }&user_id=${category_list.user_id }">${category_list.category_name }</a></li> --%>
                                    </ul>
                                    <h4>${pdto.profile_content}</h4>
                                </div>
                            </article>
                     
                        </div>
                    </div>
                    </c:forEach>
                    </form>
                </div>
            </div>
            <hr style="border: solid 5px #09cc7f; width: 100%;" >
        </section>
        <!-- Blog Area End -->
</main>



<%@ include file="../include/footer.jsp" %>