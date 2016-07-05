<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.forchangeimage{
	margin-bottom: 10px;
	margin-top: 10px;
}
</style>
<script type="text/javascript">

$(function(){
	$("#searchEventBtn").on("click", function() {
		$("#imageDiv").css("display","none");
		$("#imageDiv2").css("display","none");
		$("#imageDiv3").css("display","none");
		$("#tra").children().remove();
		$("#updateImage").val("");
		$("#eventListTable").children().remove();
		$.post("${pageContext.request.contextPath}/event_ajax_search.do"
				, {"keyword":$("#searchEventTitle").val()}
				,function (jsonObj) {
					
					if(jsonObj.status){
						$(jsonObj.eventList).each(function(index, item) {
						
						
							var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
							var td11=$("<td rowspan='2' width='101px'/>").append(img);
							var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
							var td12=$("<td align='center'/>").html(a1);
							var butt1=$("<button role='button' class='buttn1'/>").attr({"id": item.eventTitle,"name":item.eventId})
													.text("사진 검색");
							var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
							var butt2=$("<button role='button' class='buttn2'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("직접 수정");
							var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
							var butt3=$("<button role='button' class='buttn3'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("사진업로드");
							var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
					
					
							var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
							
							var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
							var tr2=$("<tr/>").append(td21);
							
							$("#eventListTable").append(tr1,tr2);
							
						
						});

					}else{
						alert("조회결과가 없습니다.");
					}
					
					
				}, "JSON");
		});
	
	$(document).on("click",".buttn1",function(){
	
		$("#imageDiv").css("display","none");
		$("#imageDiv2").css("display","none");
		$("#imageDiv3").css("display","none");
		$("#tra").children().remove();
		$("#updateImage").val("");
		
			var title = $(this).attr("id");
			var id = $(this).attr("name");
		
			$.post("${pageContext.request.contextPath}/event_change_image_form.do"
					, {"eventTitle": title , "eventId":id}
					,function (jsonObj) {
						
						if(jsonObj.status){
							
			

							$(jsonObj.imageList).each(function(index, item) {
							var image= $("<img class='forchangeimage'/>").attr("src",item.imageLink).css({"display":"block","width":"70px","height":"70px"});
							var width=$("<p/>").text("WIDTH : "+item.sizeWidth);
							var height=$("<p/>").text("HEIGHT : "+item.sizeHeight);
							var radio=$("<input type='radio' name='selectImage' class='selectImage'/>").attr("value",item.imageLink);
							var td=$("<td align='center'/>").append(image,width,height,radio);
						 	$("#imageTable tr").append(td);
						 	
							});
							
							$("#imageDiv").css("display","block");

						}else{
							alert("검색결과가 존재하지 않습니다.");
						}  
						
					}, "JSON");
		});

		
		$("#imageUpdateButton").on("click", function() {
			
			
			$.post("${pageContext.request.contextPath}/event_change_image.do"
					, {"imageLink":$("input[name='selectImage']:checked").val()}
					, function(jsonObj) {
						
						if(jsonObj.status){
							
							alert("행사 이미지가 교체되었습니다.");
							var keyword=jsonObj.keyword;
				
							$("#imageDiv").css("display","none");
							$("#imageDiv2").css("display","none");
							$("#imageDiv3").css("display","none");
							$("#tra").children().remove();
							$("#updateImage").val("");
							$("#eventListTable").children().remove();
							
							$.post("${pageContext.request.contextPath}/event_ajax_search.do"
									, {"keyword":keyword}
									,function (jsonObj) {
										
										if(jsonObj.status){
											$(jsonObj.eventList).each(function(index, item) {
											
											
												var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
												var td11=$("<td rowspan='2' width='101px'/>").append(img);
												var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
												var td12=$("<td align='center'/>").html(a1);
												var butt1=$("<button role='button' class='buttn1'/>").attr({"id": item.eventTitle,"name":item.eventId})
																		.text("사진 검색");
												var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
												var butt2=$("<button role='button' class='buttn2'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("Url 입력");
												var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
												var butt3=$("<button role='button' class='buttn3'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("사진업로드");
												var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
							
							
												var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
												
												var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
												var tr2=$("<tr/>").append(td21);
												
												$("#eventListTable").append(tr1,tr2);
											
											});

										}else{
											alert("실패~");
										}
										
										
									}, "JSON");
							
							
						}else{
							alert("행사 이미지가 교체에 실패 하였습니다.");
						}
						
						
					}, "JSON");
			
			
		});
		
		$(document).on("click",".buttn2",function(){
			$("#imageDiv").css("display","none");
			$("#imageDiv2").css("display","none");
			$("#imageDiv3").css("display","none");
			$("#tra").children().remove();
			$("#updateImage").val("");
			
			$("#updateEventId").val($(this).attr("name"));
			
			$("#imageDiv2").css("display","block");
			
		});
		
		$(document).on("click",".buttn3",function(){
			$("#imageDiv").css("display","none");
			$("#imageDiv2").css("display","none");
			$("#imageDiv3").css("display","none");
			$("#tra").children().remove();
			$("#updateImage").val("");
			
			$("#updateEventId2").val($(this).attr("name"));
			
			$("#imageDiv3").css("display","block");
			
		});
		
		$("#changeUrl").on("click", function() {
			$.post("${pageContext.request.contextPath}/event_image_update.do"
					, {"updateEventId":$("#updateEventId").val(),"eventImage":$("#updateImage").val()}
					, function(jsonObj) {
						
						if(jsonObj.status){
							alert("행사 이미지가 교체되었습니다.");
							var keyword=jsonObj.keyword;
				
							$("#imageDiv").css("display","none");
							$("#imageDiv2").css("display","none");
							$("#imageDiv3").css("display","none");
							$("#tra").children().remove();
							$("#updateImage").val("");
							$("#eventListTable").children().remove();
							
							$.post("${pageContext.request.contextPath}/event_ajax_search.do"
									, {"keyword":keyword}
									,function (jsonObj) {
										
										if(jsonObj.status){
											$(jsonObj.eventList).each(function(index, item) {
											
											
												var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
												var td11=$("<td rowspan='2' width='101px'/>").append(img);
												var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
												var td12=$("<td align='center'/>").html(a1);
												var butt1=$("<button role='button' class='buttn1'/>").attr({"id": item.eventTitle,"name":item.eventId})
																		.text("사진 검색");
												var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
												var butt2=$("<button role='button' class='buttn2'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("Url 입력");
												var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
												var butt3=$("<button role='button' class='buttn3'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("사진 업로드");
												var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
												
												
												var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
												
												var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
												var tr2=$("<tr/>").append(td21);
												
												$("#eventListTable").append(tr1,tr2);
											
											});

										}else{
											alert("실패~");
										}
										
										
									}, "JSON");
							
							
						}else{
							alert("행사 이미지가 교체에 실패 하였습니다.");
						}
						
					}, "JSON");
		});
	
	
		
		$("#imageSelectCancel").on("click", function() {
			$("#imageDiv").css("display","none");
			$("#imageDiv2").css("display","none");
			$("#imageDiv3").css("display","none");
			$("#tra").children().remove();
			$("#updateImage").val("");
		});
	});
	


</script>
</head>
<body>

		<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
				REVIEW<font size="4em"><strong>&nbsp;내가 쓴 후기</strong></font>
			</h2>
		<br/>
		
		<div class="form-group">		
			<input type="text" class="form-control" placeholder="이벤트명을 입력하세요" id="searchEventTitle">
		</div>
		<button type="button" id="searchEventBtn" class="btn btn-default">검색</button>
		<br/>
		
		<br/>
		<table cellpadding="0" cellspacing="0" id="eventListTable" border="1px solid black" width="700px">
			
		</table >
		<br/>

		<div style="display: none;" id="imageDiv">
			<table cellpadding="0" cellspacing="0" id="imageTable" border="1px solid black" width="700px">
				<tr id="tra"></tr>
			</table>
			<br/>
			
			<table width="700px">
				<tr>
					<td align="center">
						<button id="imageUpdateButton">등록</button>&nbsp;&nbsp;&nbsp;
						<button id="imageSelectCancel">취소</button>
					</td>
				</tr>
			</table>
		</div>
		<div style="display: none;" id="imageDiv2">
			<table cellpadding="0" cellspacing="0" id="imageTable2" border="1px solid black" width="700px">
				<tr>
					<td bordercolor="white">
						<label for="updateImage">Url : </label>
						<input type="text" name="updateImage" id="updateImage" placeholder="Url을 넣어주세요">
					</td>
				</tr>
				<tr>
					<td bordercolor="white">
						<input type="hidden" name="updateEventId" id="updateEventId" >
						<button id="changeUrl">등록</button>&nbsp;&nbsp;&nbsp;
						<button id="imageSelectCancel">취소</button>
					</td>
				</tr>
			</table>
		</div>
		<div style="display: none;" id="imageDiv3">
			<form method="post" action="${pageContext.request.contextPath }/event_image_update_server.do" enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" id="imageTable3" border="1px solid black" width="700px">
					<tr>
						<td bordercolor="white">
							<label for="updateImage">파일 업로드 :  </label>
							<input type="file" name="updateImage2" id="updateImage2">
							<input type="hidden" name="root" value="${pageContext.request.contextPath}"/>
						</td>
					</tr>
					<tr>
						<td bordercolor="white">
							<input type="hidden" name="updateEventId2" id="updateEventId2" >
							<button type="submit">등록</button>&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>


</body>
</html>