<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!-- main -->
 <section id="main-content">
     <section class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<div class="box1">
						<c:if test="${check == 0 }">
						<label>찾으시는 아이디는' ${pw}' 입니다.</label>
						</c:if>
								
				</div>
			
			</div>
			
		</div>
	</section>
</section>	
