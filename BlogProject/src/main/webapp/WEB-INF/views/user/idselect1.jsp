<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ include file="../include/siderbar.jsp" %> --%>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
    <body>

                
                <div class="col-lg-8">
                    <form class="form-contact contact_form"  method="post"   >
					 	<div class="container box_1170">
						<div class="section-top-border" style="position: absolute; top: 50%; left: 35%; padding:  ">
								<h3 class="mb-30" style="text-align: center;"><img alt="#" src="/resources/images/ID.png" style="width: 70px; height: 70px;"></h3>
								
								
									<div class="progress-table" style="padding: 0px 0px 0px;" >
										<div class="table-head">
										
											<div class="visit"></div>
											<div class="visit">ID</div>
											<div class="visit">NAME</div>
											<div class="visit">Member Since</div>
											
										</div>
										<div class="table-row">
										
											<div class="visit"></div>
											<div class="visit">${id }</div>
											<div class="visit">${name }</div>
											<div class="visit"><fmt:formatDate pattern="yyyy-MM-dd" value="${date }"/></div>
										</div>
									</div>
									<br>
									<br>
									<a href="/user/login" class="button button-contactForm boxed-btn" style="padding: 8px 21px;  position: relative; left:45%;">LOGIN</a>
									
								</div>
                                 </div>
                     </form>
                </div>
            
        
        <script>
   
        </script>           
   
    </body>
    
</html>



