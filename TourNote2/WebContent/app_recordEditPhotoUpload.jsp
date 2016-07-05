<%@ page import="com.scsa.wapl.entity.Photo"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ko"></script>
<script type="text/javascript">
var index=1;
$(function(){
	// 사진 추가 버튼누르면 새로운 file 업로드 가능
	$("#addFile").click(function(){
		var input=$("<input/>").attr("type","file").attr("name","image").attr("class","image");
			input.change(function(){
			readURL(this);
		});
		$("#imageDiv .image").hide();
		$("#imageDiv").append(input);
	});		
	
	// 파일 업로드할 때마다 사진 미리보기
		$(".image").change(function(){
		readURL(this);
});

		function readURL(input) {

		    if (input.files && input.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function (e) {
		        	$("#imageDiv .image").hide();
		        	var image=$("<img/>").attr("src",e.target.result)
		        				.attr("width","70px").attr("height","70px")
		        				.css("margin-right","20px");
		            $('#imageList').append(image);
		        };

		        reader.readAsDataURL(input.files[0]);
		    }
		}

	});

</script>
<style type="text/css">
body{
	background-color: #E0F0FF;
}
#mainDiv{
	background-color: white;
	border: 4px solid skyblue;
	border-radius: 20px;
	width: 700px;
	height: 100%;
	margin: 0 auto;
	padding: 15px;
}
#titleSpan, #contentSpan{
	color: skyblue;
}
#addFile{
	width: 80px;
	height: 25px;
	margin-bottom: 20px;
	margin-left: 460px;
}
#submitBtn{
	width: 80px;
	height: 25px;
	margin-left: 300px;
	margin-top: 15px;
}
h3, #contentSpan, #titleSpan{
	font-weight: bold;
}
h3{
	margin-left: 20px;
	color: skyblue;
}
#titleSpan,#contentSpan,#content,#selectedTransportation{
	margin-left: 100px;
}
#title,#content{
	margin-bottom: 20px;
}
table{
	margin-top: 20px;
	margin-left: 100px;
}
#imageList{
	margin-top: 20px;
	margin-left: 100px;
}
#airplane, #bus, #train, #boat{
	width: 70px;
	height: 25px;
}
select{
	width: 220px;
}
.image{
	margin-left: 100px;
}
</style>
<title>업로드 화면</title>
</head>

<body>
	<form id="uploadForm" method="post" enctype="multipart/form-data" action="edit_photoUpload.do">
	<br/><br/><br/><br/><br/>
	<div id="mainDiv">
		
		<div id="imageDiv">
		<input type="button" id="addFile" value="사진 추가">
		<input type="file" name="image" class="image">
		</div>
		
		<div id="imageList">
		</div>

		<input type="submit" value="저장" id="nextBtn">
	
	</div>
	<input type="hidden" name="recordNum" value="${param.recordNum}">
	<input type="hidden" name="spotNum" value="${param.spotNum}">
	
	</form>
</body>
</html>