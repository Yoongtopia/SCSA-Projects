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
	
	$("#seoulnoriFooter").css("display", "none");
	
	if($("#afterUpdateServer").val() != '' && $("#afterUpdateServer").val() == 'Y'){
		alert("행사 이미지가 교체되었습니다.");
	}
	
	/* 처음 default list */
	$.post("${pageContext.request.contextPath}/event_ajax_search.do"
			, {"adminkeyword": "all" }
			,function (jsonObj) {
				
				$("#seoulnoriFooter").css("display", "none");
				
				if(jsonObj.status){
					$(jsonObj.eventList).each(function(index, item) {
					
						if(item.eventThumbnail == null || item.eventThumbnail == ""){
							var img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noPhoto.png","style":"width: 100px;height:100px"});
						} else {
							var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
						}
						var td11=$("<td rowspan='2' width='101px'/>").append(img);
						var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
						var td12=$("<td align='center'/>").html(a1);
						var butt1=$("<button role='button' class='buttn1 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("사진 검색");
						var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
						var butt2=$("<button role='button' class='buttn2 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
											.text("직접 수정");
						var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
						var butt3=$("<button role='button' class='buttn3 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
											.text("사진업로드");
						var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
				
				
						var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
						
						var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
						var tr2=$("<tr/>").append(td21);
						
						$("#eventListTable").append(tr1,tr2);
					
					});

				}else{
					$("#noImageEventTable").css("display", "block");
				}
				
				
				/* footer 높이 */
				var browserHeight = document.documentElement.clientHeight;
				var bodyHeight = document.getElementById("mainBody").getBoundingClientRect().height;
				if(browserHeight-bodyHeight >= 160){
					$("#mainDiv").css("height", "763px");	
				}
				$("#seoulnoriFooter").css("display", "block");
				
			}, "JSON");
	
	
	/* 사진 없는 행사 리스트 */
	$("#searchNoImageEvent").on("click", function() {
		
		$("#tra").children().remove();
		$("#updateImage").val("");
		$("#eventListTable").children().remove();
		
		$.post("${pageContext.request.contextPath}/event_ajax_search.do"
				, {"adminkeyword": "noImage" }
				,function (jsonObj) {
					
					$("#seoulnoriFooter").css("display", "none");
					
					if(jsonObj.status){
						$(jsonObj.eventList).each(function(index, item) {
						
						
							if(item.eventThumbnail == null || item.eventThumbnail == ""){
								var img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noPhoto.png","style":"width: 100px;height:100px"});
							} else {
								var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
							}
							var td11=$("<td rowspan='2' width='101px'/>").append(img);
							var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
							var td12=$("<td align='center'/>").html(a1);
							var butt1=$("<button role='button' class='buttn1 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
													.text("사진 검색");
							var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
							var butt2=$("<button role='button' class='buttn2 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("직접 수정");
							var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
							var butt3=$("<button role='button' class='buttn3 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("사진업로드");
							var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
					
					
							var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
							
							var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
							var tr2=$("<tr/>").append(td21);
							
							$("#eventListTable").append(tr1,tr2);
							
						
						});

					}else{
						$("#noImageEventTable").css("display", "block");
					}
					
					/* footer 높이 */
					var browserHeight = document.documentElement.clientHeight;
					var bodyHeight = document.getElementById("mainBody").getBoundingClientRect().height;
					if(browserHeight-bodyHeight >= 160){
						$("#mainDiv").css("height", "763px");	
					}
					$("#seoulnoriFooter").css("display", "block");
					
				}, "JSON");
	});
	
	
	$("#searchEventBtn").on("click", function() {
		$("#tra").children().remove();
		$("#updateImage").val("");
		$("#eventListTable").children().remove();
		$("#seoulnoriFooter").css("display", "none");
		$.post("${pageContext.request.contextPath}/event_ajax_search.do"
				, {"adminkeyword":$("#searchEventTitle").val()}
				,function (jsonObj) {
					
					if(jsonObj.status){
						
						$("#noImageEventTable").css("display", "none");
						
						$(jsonObj.eventList).each(function(index, item) {
						
						
							if(item.eventThumbnail == null || item.eventThumbnail == ""){
								var img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noPhoto.png","style":"width: 100px;height:100px"});
							} else {
								var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
							}
							var td11=$("<td rowspan='2' width='101px'/>").append(img);
							var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
							var td12=$("<td align='center'/>").html(a1);
							var butt1=$("<button role='button' class='buttn1 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
													.text("사진 검색");
							var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
							var butt2=$("<button role='button' class='buttn2 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("직접 수정");
							var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
							var butt3=$("<button role='button' class='buttn3 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
												.text("사진업로드");
							var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
					
					
							var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
							
							var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
							var tr2=$("<tr/>").append(td21);
							
							$("#eventListTable").append(tr1,tr2);

						});

					}else{
						$("#noImageEventTable").css("display", "block");
					}
					
				}, "JSON");
		
		});
	
	$(document).on("click",".buttn1",function(){
		
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
							var width=$("<p/>").text("가로  "+item.sizeWidth+"px");
							var height=$("<p/>").text("세로  "+item.sizeHeight+"px");
							var radio=$("<input type='radio' name='selectImage' class='selectImage'/>").attr("value",item.imageLink);
							var td=$("<td align='center'/>").append(image,width,height,radio);
						 	$("#imageTable tr").append(td);
						 	
							});
							
							$('#edit-searchPhoto').modal('show');
							$("#imageDiv").css("display","block");

						}else{
							alert("사진 검색결과가 존재하지 않습니다. 직접 수정 혹은 사진업로드 방식을 이용하세요.");
						}  
						
					}, "JSON");
		});

		
		$("#imageUpdateButton").on("click", function() {
			
			
			$.post("${pageContext.request.contextPath}/event_change_image.do"
					, {"imageLink":$("input[name='selectImage']:checked").val()}
					, function(jsonObj) {
						
						if(jsonObj.status){
							
							alert("행사 이미지가 교체되었습니다.");
							$('#edit-searchPhoto').modal('hide');
							var adminkeyword=jsonObj.adminkeyword;
				
							$("#tra").children().remove();
							$("#updateImage").val("");
							$("#eventListTable").children().remove();
							
							$.post("${pageContext.request.contextPath}/event_ajax_search.do"
									, {"adminkeyword":adminkeyword}
									,function (jsonObj) {
										
										if(jsonObj.status){
											$(jsonObj.eventList).each(function(index, item) {
											
											
												if(item.eventThumbnail == null || item.eventThumbnail == ""){
													var img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noPhoto.png","style":"width: 100px;height:100px"});
												} else {
													var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
												}
												var td11=$("<td rowspan='2' width='101px'/>").append(img);
												var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
												var td12=$("<td align='center'/>").html(a1);
												var butt1=$("<button role='button' class='buttn1 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
																		.text("사진 검색");
												var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
												var butt2=$("<button role='button' class='buttn2 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("Url 입력");
												var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
												var butt3=$("<button role='button' class='buttn3 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("사진업로드");
												var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
							
							
												var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
												
												var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
												var tr2=$("<tr/>").append(td21);
												
												$("#eventListTable").append(tr1,tr2);
											
											});

										}else{
											alert("error");
										}
										
										
									}, "JSON");
							
							
						}else{
							alert("행사 이미지가 교체에 실패 하였습니다.");
						}
						
						
					}, "JSON");
			
			
		});
		
		$(document).on("click",".buttn2",function(){
			$("#edit-insertUrl").modal('show');
			$("#tra").children().remove();
			$("#updateImage").val("");
			
			$("#updateEventId").val($(this).attr("name"));
			
			$("#imageDiv2").css("display","block");
			
		});
		
		$(document).on("click",".buttn3",function(){
			$("#edit-uploadImage").modal('show');
			$("#tra").children().remove();
			$("#updateImage").val("");
			
			$("#updateEventId2").val($(this).attr("name"));
			
			$("#imageDiv3").css("display","block");
			
		});
		
		$("#changeUrl").on("click", function() {
			$.post("${pageContext.request.contextPath}/event_image_update.do"
					, {"updateEventId":$("#updateEventId").val(),"eventImage":$("#updateImage").val()}
					, function(jsonObj) {
						
						$("#edit-insertUrl").modal('hide');
						
						if(jsonObj.status){
							alert("행사 이미지가 교체되었습니다.");
							var adminkeyword=jsonObj.adminkeyword;
				
							$("#tra").children().remove();
							$("#updateImage").val("");
							$("#eventListTable").children().remove();
							
							$.post("${pageContext.request.contextPath}/event_ajax_search.do"
									, {"adminkeyword":adminkeyword}
									,function (jsonObj) {
										
										if(jsonObj.status){
											$(jsonObj.eventList).each(function(index, item) {
											
											
												if(item.eventThumbnail == null || item.eventThumbnail == ""){
													var img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noPhoto.png","style":"width: 100px;height:100px"});
												} else {
													var img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
												}
												var td11=$("<td rowspan='2' width='101px'/>").append(img);
												var a1=$("<a/>").text(item.eventTitle).attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
												var td12=$("<td align='center'/>").html(a1);
												var butt1=$("<button role='button' class='buttn1 btn btn-default'/>")
																		.attr({"id": item.eventTitle,"name":item.eventId, "data-toggle" : "modal" , "data-target" : "#edit-searchPhoto"})
																		.text("사진 검색");
												var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
												var butt2=$("<button role='button' class='buttn2 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("Url 입력");
												var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
												var butt3=$("<button role='button' class='buttn3 btn btn-default'/>").attr({"id": item.eventTitle,"name":item.eventId})
																	.text("사진 업로드");
												var td15=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt3);
												
												
												var tr1=$("<tr/>").append(td11,td12,td13,td14,td15);
												
												var td21=$("<td align='center'/>").text(item.eventStartDate+"~"+item.eventEndDate);
												var tr2=$("<tr/>").append(td21);
												
												$("#eventListTable").append(tr1,tr2);
											
											});

										}else{
											alert(jsonObj.status+"error");
										}
										
									}, "JSON");
							
							
						}else{
							alert("행사 이미지가 교체에 실패 하였습니다.");
						}
						
					}, "JSON");
		});
	
	
		
		$("#imageSelectCancel").on("click", function() {
			$("#tra").children().remove();
			$("#updateImage").val("");
		});
	});
	
	$("#uploadImgSubmitBtn").on("click", function() {
		$("#edit-uploadImage").modal('hide');
	})
	


</script>
<style type="text/css">

#imageTable td { border: 0; }

</style>
</head>
<body id="mainBody">

		<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
				EDIT<font size="4em"><strong>&nbsp;행사사진수정</strong></font>
			</h2>
		<br/>
		
		
	<div style="margin: 0 30px;" id="mainDiv">
		
		<table style="width: 100%;">
			<tr>
				<td>
					<div class="form-group" style="display: inline-block; width: 280px;">		
					<input type="text" class="form-control" id="searchEventTitle"
								placeholder="사진을 변경할 행사명을 입력하세요">
				</div>
				<input type="button" id="searchEventBtn" class="btn btn-primary" value="검색"/>
				</td>
				<td style="text-align: right;">
					<input type="button" id="searchNoImageEvent" class="btn btn-default" value="사진 없는 행사만 보기"/>
				</td>
			</tr>
		</table>

		
		<!-- 이벤트 리스트 -->
		<table id="eventListTable" width="700px" class="table" style="border-bottom: 1px solid #ddd; margin: 15px 0;">
			
		</table>

		<!-- 조회 결과 없을 때 -->
		<table  id="noImageEventTable" width="763px" class="table" 
					style="border-bottom: 1px solid #ddd; margin: 15px 0; display: none;">
			<tr>
				<td style="text-align: center; width: 763px"> <br/>조회 결과가 없습니다 <br/><br/> </td>
			</tr>
		</table>

	</div>
	
	
	<!-- Modal : 사진 검색 -->
	<div class="modal fade" id="edit-searchPhoto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header" style="border-bottom: 1px solid #ddd; background-color: #3a9e8b; color: white;
	      																border-top-left-radius: 5px; border-top-right-radius: 5px;">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
	        				style="color: white; text-shadow: 0 1px 0 gray; opacity: 0.5;">×</button>
	        <h4 class="modal-title">검색 사진으로 등록하기</h4>
	      </div>
	      <div class="modal-body">
	      
	       <div style="display: none;" id="imageDiv">
				<table id="imageTable" width="700px" class="table" style="border-color: transparent; margin: 0;">
					<tr id="tra"></tr>
				</table>
			</div>
			
	      </div>
	      <div class="modal-footer" style="margin: 0; border-top: 1px solid #ddd; text-align: center; padding: 18px;">
	        <input type="button"  id="imageUpdateButton" class="btn btn-primary" value="등록">
	        <input type="button" id="imageSelectCancel" class="btn btn-default" data-dismiss="modal" value="취소">
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal : 사진 검색 -->
	
	
	<!-- Modal : 직접 수정 -->
	<div class="modal fade" id="edit-insertUrl" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header" style="border-bottom: 1px solid #ddd; background-color: #3a9e8b; color: white;
	      																border-top-left-radius: 5px; border-top-right-radius: 5px;">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
	        				style="color: white; text-shadow: 0 1px 0 gray; opacity: 0.5;">×</button>
	        <h4 class="modal-title">직접 등록하기</h4>
	      </div>
	      <div class="modal-body">
	      
	       <div style="display: none;" id="imageDiv2">
				<table id="imageTable2" class="table">
					<tr>
						<td style="padding: 8px 20px; border: 0; text-align: center;">
							<label for="updateImage" style="color: #3a9e8b;">
								<span class="glyphicon glyphicon-warning-sign"></span>
								로그인이 필요한 페이지의 이미지 url은 제대로 반영되지 않을 수 있습니다
							</label>
							<br/><br/>
							<input type="text" class="form-control" name="updateImage" id="updateImage" 
										placeholder="url을 넣어주세요" style="display: inline-block;">
						</td>
					</tr>
				</table>
			</div>
			
	      </div>
	      <div class="modal-footer" style="margin: 0; border-top: 1px solid #ddd; text-align: center; padding: 18px;">
	      	<input type="hidden" name="updateEventId" id="updateEventId" >
	        <input type="button"  id="changeUrl" class="btn btn-primary" value="등록">
	        <input type="button" id="imageSelectCancel" class="btn btn-default" data-dismiss="modal" value="취소">
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal : 직접 수정 -->
	
	
	<!-- Modal : 사진 업로드 -->
	<div class="modal fade" id="edit-uploadImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header" style="border-bottom: 1px solid #ddd; background-color: #3a9e8b; color: white;
	      																border-top-left-radius: 5px; border-top-right-radius: 5px;">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
	        				style="color: white; text-shadow: 0 1px 0 gray; opacity: 0.5;">×</button>
	        <h4 class="modal-title">이미지 업로드하기</h4>
	      </div>
	      
	      <form method="post" action="${pageContext.request.contextPath }/event_image_update_server.do" enctype="multipart/form-data">
	      <div class="modal-body">
	      
		      <div style="display: none;" id="imageDiv3">
					<table id="imageTable3" width="700px" class="table" >
						<tr>
							<td style="border: 0; padding-left: 30px;">
								<label for="updateImage" style="color: #3a9e8b;">
									<span class="glyphicon glyphicon-info-sign"></span>
									업로드할 이미지를 선택해 주세요
								</label>
								<br/><br/>
								<input type="file" name="updateImage2" id="updateImage2" style="display: inline-block;">
								<input type="hidden" name="root" value="${pageContext.request.contextPath}"/>
							</td>
						</tr>
					</table>
			</div>
			
	      </div>
	      <div class="modal-footer" style="margin: 0; border-top: 1px solid #ddd; text-align: center; padding: 18px;">
	      	<input type="hidden" name="updateEventId2" id="updateEventId2" >
	      	<input type="hidden" id="afterUpdateServer" value="${afterUpdateServer}"/>
	        <input type="submit" id="uploadImgSubmitBtn" class="btn btn-primary" value="등록">
	        <input type="reset" class="btn btn-default" data-dismiss="modal" value="취소">
	      </div>
	      </form>
	      
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal : 사진 업로드 -->

</body>
</html>