<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType = "text/html;charset=utf-8" %>
<html>
<head>
    <title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
<script type="text/javascript">
$(document).ready(function(){
	$("#gdsImg").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result).width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
});
</script>
</head>
<body>
    <!-- 
	1. 전송하고자 하는 입력 폼을 <form>과 </form>사이에 위치해놓는다. 
	2. action 값은 데이터를 전송받아서 처리할 Controller url로 설정한다.
	3. method를 반드시 post로 설정해준다. get으로 설정시 parameter들이 url에 따라간다.
	4. enctype을 multipart/form-data로 설정한다.
	5. <form>과 </form>사이에 input type submit버튼을 위치시킨다.
	-->
    <form action="./upload" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data">
		<div class="inputArea">
			<label for="gdsImg">이미지</label> 
			<input type="file" id="gdsImg" name="file" />
			<div class="select_img">
				<img src="" />
			</div>
		</div>
        <input type="submit" name="업로드" value="제출"><br>
    </form>
    
    <div class="inputArea">
	 <label for="gdsImg">이미지</label>
	 <p>원본 이미지</p>
	 <img src="${pdto.post_img}" class="oriImg"/>
	</div>
</body>
</html>