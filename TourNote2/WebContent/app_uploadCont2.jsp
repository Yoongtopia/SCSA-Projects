<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/jquery-ui-1.10.3.custom.css" />
<!-- <link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.3.custom.css" /> -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ko"></script>
<script src="./js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript">
	var index=1;
	$(function(){
		
		$("#mainCont").dialog({
			width: 340,
			height: 500,
			buttons: {
					'다음': function(){
						$("#uploadForm").submit();
					},
					'취소': function(){
						var href="${pageContext.request.contextPath}/upload_delete2.do";
						location.replace(href);
					}
				},
			modal: true
		});
		$(".ui-dialog-titlebar-close").hide();
		
/* 		// upload type에 따라 title을 다르게 주기
		if ("${uploadType}"=="selectUpload"){
			$("#mainCont").attr("title","지정 위치로 올리기 - 글, 사진");
		} else if ("${uploadType}" == "currentUpload"){
			$("#mainCont").attr("title","현재 위치로 올리기 - 글, 사진");
		} else if ("${uploadType}" == "photoUpload"){
			$("#mainCont").attr("title","사진 위치로 올리기 - 글, 사진");
		} */
		
		// upload type에 따라 form action 다르게
		if ("${uploadType}"=="photoUpload"){
			$("#uploadForm").attr("action","${pageContext.request.contextPath}/uploadTransportation_view_byPhoto2.do");
/* 			$("#uploadForm").attr("action","${pageContext.request.contextPath}/uploadTransportation_view_byPhoto.do?uploadType=${uploadType}"); */
		} else {
			$("#uploadForm").attr("action","${pageContext.request.contextPath}/uploadTransportation_view2.do");
/* 			$("#uploadForm").attr("action","${pageContext.request.contextPath}/uploadTransportation_view.do?uploadType=${uploadType}&latitude=${latitude}&longitude=${longitude}"); */
		}
		
		// 뒤로 가기 해서 왔을 때, 입력한 제목과 글 있으면 다시 써주기
		if ("${travelSpot != null}" == "true"){
			$("#title").val("${travelSpot.spotTitle}");
			$("#content").val("${travelSpot.spotCont}");
		}

 		// 뒤로가기해서 왔을 때 이전에 등록한 사진 보여주기
		<% List<Photo> photoList=(List<Photo>)request.getAttribute("photoList");
		if (photoList != null && photoList.size() !=0){
			for (Photo photo:photoList){%>
			var photoName="<%=photo.getPhotoName() %>";
			var pathHeader = photoName.lastIndexOf(".");
			var fileName = photoName.substring(0, pathHeader); //파일명
			var src="${pageContext.request.contextPath}/image/"+photoName;
			var image=$("<img/>").attr("src",src).attr("class","viewImg").attr("width","70px").attr("height","70px");
			var deleteBtn=$("<input/>").attr("type","button").attr("id",fileName).attr("value","x")
										.attr("class","dltBtn")
										.click(function(){
											var id=$(this).attr("id");
											$.get("${pageContext.request.contextPath}/delete_image2.do",
													{"photoName" : photoName});
											$("#Div"+id).remove();
										});
			var addImageDiv=$("<div/>").append(image,deleteBtn).attr("id","Div"+fileName).attr("class","dltImageDiv");

			$('#imageList').append(addImageDiv);
		<%}}%>
				
		
		// 파일 업로드할 때마다 파일명 중복확인 후, 중복 아니면 미리보기
 		$(".image").on("change",function(){
 			getFileInfo(this);
		});
		
/* 		$("#uploadFile").click(function(){
			$(".image").click();
		})
		
		$("#imageDiv .image").hide(); */
	});
	
	var fileArray=[];
	// 업로드 한 파일 중복 체크 후 등록
	function getFileInfo(img) {
		var file = img;
/* 		var file = document.uploadForm.image; */
		var fileName="";
		var extName="";
		if ( file.value != "" ) {
			 var pathHeader = file.value.lastIndexOf("\\");
			 var pathMiddle = file.value.lastIndexOf(".");
			 var pathEnd = file.value.length;
			 fileName = file.value.substring(pathHeader+1, pathMiddle); //파일명
			 extName = file.value.substring(pathMiddle+1, pathEnd); //확장자
		}
		
		//파일명이 한글인 경우, alert
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if(check.test(fileName)){
			alert("파일명은 영문 또는 숫자로만 설정해주세요.");
			$(".image:last-child").remove();
			addInputFile();
		} else {
			// 뒤로 가기 했다 온 경우, 이미 저장된 db에 파일 있는지 확인
			$.get("${pageContext.request.contextPath}/photo_check2.do",
					{"photoName" : fileName+"."+extName},
					function(jsonObj){
						if(jsonObj.status){
							// db에 없다면 현재 등록한 사진에 있는지 확인
							if (fileArray.length != 0){
								var duplCheck=true;
								//현재 등록한 사진에 이미 있는 경우
								for (var i=0; i<fileArray.length; i++){
									if (fileArray[i]==fileName+"."+extName){
										alert("동일한 파일명의 사진이 이미 존재합니다. 파일명을 확인해주세요.");
										$(".image:last-child").remove();
										addInputFile();
										duplCheck=false;
										break;
									}
								}
								//현재 등록 사진 중 없는 경우
								if (duplCheck){
									fileArray.push(fileName+"."+extName);
									readURL(img,fileName+"."+extName);
									/* if (extName == "jpg" || extName == "jpeg" || extName == "JPG" ||extName == "JPEG"){
										fileArray.push(fileName+"."+extName);
										readURL(img,fileName+"."+extName);
									} else {
										alert("이미지 파일은 JPG(jpg), JPEG(jpeg)만 업로드 가능합니다.");
										$(".image:last-child").remove();
										addInputFile();
									} */
								}
							} else {
								fileArray.push(fileName+"."+extName);
								readURL(img,fileName+"."+extName);
							/* 	//처음 새 등록하는 경우
								if (extName == "jpg" || extName == "jpeg" || extName == "JPG" ||extName == "JPEG"){
									fileArray.push(fileName+"."+extName);
									readURL(img,fileName+"."+extName);
								} else {
									alert("이미지 파일은 JPG(jpg), JPEG(jpeg)만 업로드 가능합니다.");
									$(".image:last-child").remove();
									addInputFile();
								} */
							}
						} else {
						// db에 이미 저장된 경우
							alert("동일한 파일명의 사진이 이미 존재합니다. 파일명을 확인해주세요.");
							$(".image:last-child").remove();
							addInputFile();
							file.value == "";
							return false;
						}
				})
		}

	}
	
	// 업로드 한 이미지 미리보기
	function readURL(input,fileName) {

	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        $("#imageDiv .image").hide();

	        reader.onload = function (e) {
	        	
	        	var dltId="dlt"+(index-1);
	        	var divId="file"+dltId;
/* 	        	var id="file"+(index-1); */
	         	var image=$("<img/>").attr("src",e.target.result).attr("class","viewImg")
	        				.attr("width","70px").attr("height","70px");
	      		var deleteBtn=$("<input/>").attr("type","button").attr("value","x").attr("class","dltBtn").attr("id",dltId)
							      		.click(function(){
													var id="file"+$(this).attr("id");
													$("#"+id).remove();
													$("#img"+id).remove();
													var arrayIdx=fileArray.indexOf(fileName);
													
													fileArray=fileArray.slice(0,arrayIdx);
													var fileArrayF=fileArray.slice(arrayIdx+1,arrayIdx.length);
													if (fileArrayF.length != 0){
														for (var i=0; i<fileArrayF.length; i++){
															fileArray.put(fileArrayF[i]);
														}
													}
											});;
	      		var addImageDiv=$("<div/>").append(image,deleteBtn).attr("class","dltImageDiv").attr("id",divId)
				
				/* var addImageDiv=$("<div/>").append(image,deleteBtn).attr("class","dltImageDiv").attr("id",id)
											.click(function(){
															$(this).remove();
															$("#img"+$(this).attr("id")).remove();
															var arrayIdx=fileArray.indexOf(fileName);
															
															fileArray=fileArray.slice(0,arrayIdx);
															var fileArrayF=fileArray.slice(arrayIdx+1,arrayIdx.length);
															if (fileArrayF.length != 0){
																for (var i=0; i<fileArrayF.length; i++){
																	fileArray.put(fileArrayF[i]);
																}
															}
												}); */
				$('#imageList').append(addImageDiv);
	        };

	        reader.readAsDataURL(input.files[0]);	
	    }
	    
	    addInputFile();
	}
	
	// 사진 하나 업로드되면, input file 추가
	function addInputFile(){
		index=index+1;
		var id="imgfiledlt"+index;
		var input=$("<input/>").attr("type","file").attr("name","image")
								.attr("class","image").attr("id",id)
								.on("change",function(){
									getFileInfo(this);
								});
		$("#imageDiv").append(input);
	}
   
</script>
<style type="text/css">
body{
	background-color: #E0F0FF;	
}
#mainDiv{
	width: 310px;
	height: 100%;
	margin: 0 auto;
	padding: 5px;	
}
#titleLable, #contentLabel, #photoSpan{
	color: skyblue;
	font-weight: bold;
	margin-bottom: 5px
}
#title,#content{
	margin-bottom: 5px;
	margin-left: 5px;	
	width: 290px;
}
#content{
	margin-left: 5px;
	width: 290px;
}
#imageList{
	margin-top: 5px;
	margin-left: 5px;
	width: 290px;
	height: 140px;
	border: dotted;
	border-color: gray;
	border-width: thin;
	overflow-x: scroll;
}
.image{
	margin-left: 5px;
}
.dltImageDiv{
	display: inline-block;
	margin-left: 5px;
	margin-top: 5px;
}
.viewImg, .dltBtn{
	display: block;
}
.dltBtn{
	margin-left: 5px;
	background-color: #eeeeee ;
	border: none;
	width: 15px;
	height: 20px;
	font-size: 10em;
}
.ui-widget {
	font-family: Trebuchet MS,Tahoma,Verdana,Arial,sans-serif;
	font-size: 1em;
}
#progress{
	margin-left: 5px;
	margin-bottom: 10px;
}
</style>
<title>업로드 화면</title>
</head>

<body>
<div style="height:50px;"></div>

<c:choose>
<c:when test="${uploadType == 'photoUpload' }">
<div id="mainCont" title="사진 위치로 올리기">
</c:when>
<c:when test="${uploadType == 'selectUpload' }">
<div id="mainCont" title="지정 위치로 올리기">
</c:when>
<c:otherwise>
<div id="mainCont" title="현재 위치로 올리기">
</c:otherwise>
</c:choose>

	<form name="uploadForm" id="uploadForm" method="post" enctype="multipart/form-data">
	<div>
		<img id="progress" src="${pageContext.request.contextPath}/images/upload/progress1.png" width="300px">
	</div>
	<div class="modal-body" id="mainDiv" >

	
		<label id="titleLable" for="title">Title</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="title" id="title" size="80" width="220px"><br/>
		<label id="contentLabel" for="content">Content</label><br/>
		<textarea rows="4" cols="70" name="content" id="content"></textarea><br/>
		
		<div id="imageDiv">
		<span id="photoSpan">Photo</span>
		<input type="file" name="image" class="image" id="imgfiledlt1">
		</div>
		
 		<div id="imageList">
		</div>
		
		</div>

	<c:if test="${uploadType != 'photoUpload' }">
		<input type="hidden" name="latitude" value="${latitude}">
		<input type="hidden" name="longitude" value="${longitude}">
	</c:if>
	<input type="hidden" name="uploadType" value="${uploadType}">
	</form>
</div>
</body>
</html>