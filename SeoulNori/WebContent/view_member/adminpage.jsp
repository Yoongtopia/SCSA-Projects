<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
  $(function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
</script>
<style>
.ui-tabs-vertical { width: 55em; }
.ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 110px; }
.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
.ui-tabs-vertical .ui-tabs-nav li a { display:block; }
.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
.ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
</style>
</head>
<body>
<c:choose>
	<c:when test="${sesseionScope.userId!=null&&sessionScope.member.memberType=='admin' }">
		<div id="tabs" style=" width: 1024px;">
			<div class="row" style="position: fixed; left: 1075px; z-index: 200; width: 170px;" >
  				<div style="display: none; width: 170px;" id="imageDiv" >
					<table  id="imageTable1">
			
					</table>	
					<br/>
					<table>
						<tr>	
							<td align="center">
								<button  class="btn btn-default"  id="imageUpdateButton">등록</button>&nbsp;&nbsp;&nbsp;
								<button  class="btn btn-default"  id="imageSelectCancel">취소</button>
							</td>
						</tr>
					</table>
				</div>
			
				<div style="display: none;" id="imageDiv2">
					<table id="imageTable2" >
						<tr>
							<td>
								<label for="updateImage">Url : </label>
								<input type="text" name="updateImage" class="form-control" id="updateImage" placeholder="Url을 넣어주세요">
							</td>
						</tr>
					</table>
					<br/><br/>
					<table border="0px">	
						<tr>
						<td>
							<input type="hidden" name="updateEventId" id="updateEventId" >
							<button id="changeUrl">등록</button>&nbsp;&nbsp;&nbsp;
							<button id="imageSelectCancel">취소</button>
						</td>
					</tr>
				</table>
			</div>
	
			<div style="display: none;" id="imageDiv3">
				<form method="post" action="${pageContext.request.contextPath }/event_image_update_server.do" enctype="multipart/form-data">
					<table id="imageTable3">
						<tr>
							<td>
								<label for="updateImage">파일 업로드 :  </label>
								<input type="file" name="updateImage2" id="updateImage2">
								<input type="hidden" name="root" value="${pageContext.request.contextPath}"/>
							</td>
						</tr>
					</table>
					<br/><br/>
					<table border="0px">
						<tr>
						<td>
							<input type="hidden" name="updateEventId2" id="updateEventId2" >
							<button  class="btn btn-default" type="submit">등록</button>&nbsp;&nbsp;&nbsp;
							<input type="reset" id="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>			
	</div>
  <ul class="nav nav-tabs" id="adminTab" style="margin-top: 250px; margin-left: 100px;">
	    <li class="active"><a href="#member"><span class="glyphicon glyphicon-list-alt"></span> 회원목록</a></li>
	    <li><a href="#stamp"><span class="glyphicon glyphicon-certificate"></span> 스탬프</a></li>
	    <li><a id="eventImageATag" href="#eventImage"><span class="glyphicon glyphicon-wrench"></span> 사진수정</a></li>
	 </ul>
  <div id="member"  style=" width: 800px;">
      <script type="text/javascript">

				$(function(){
					/* 회원타입별 정렬 */	
					$("#selectType").change(function(){
					 if($("#selectType option:selected").val()=="all"){
						/*  $("#pageArea").show();
						 $.getJSON("${pageContext.request.contextPath}/member_list_ajax.do", 
							 function(jsonObj){
						 		table(jsonObj);
						 });*/
						 location.href="${pageContext.request.contextPath}/member_list.do";
																
					 }else{
					   $("#pageArea").hide();
					   $.getJSON("${pageContext.request.contextPath}/order_by_type.do", 
					    {"memberType":$("#selectType option:selected").val()},
					    	function(jsonObj){
					 		 table(jsonObj);
					   });
					 }
					});
					/* 회원검색 */
					$("#searchMemberBtn").click(function(){
						 $("#pageArea").hide();
						if($("#selectSearchType option:selected").val()=="byUserId"){
							userId = $("#searchMember").val();
						}else {
							nickname = $("#searchMember").val();
						}
						$.getJSON("${pageContext.request.contextPath}/member_search.do",
								{"userId":$("#searchMember").val(), "nickname":$("#searchMember").val()},
								 function(jsonObj){
							 		table(jsonObj);
						 });
					
					});
				});
				/* 비동기로 목록 출력 */
				function table(jsonObj){
				    if(jsonObj.memberList.length!=0){
					     $(".body").remove();
					     $(jsonObj.memberList).each(function(index, item) {
					    	  var a = $("<a/>").attr("href",
								"${pageContext.request.contextPath }/member_view.do?userId="+(item.userId)).text( item.userId );	
							  var td1 = $("<td/>").append(a); 
							  var td2 = $("<td/>").text(item.nickname);
							  var td3 = $("<td/>").text( item.memberType );
							  var td4 = $("<td/>").text( item.memberStatus );
							  var td5 = $("<td/>").text( index+1 );
							  var tr = $("<tr/>").attr("class","body" ).append(td5, td1, td2, td3, td4);
							  $("#listTable").append(tr);
							});
						 } else {
						  var tr = $("<tr/>").attr("class","body" ).append($("<td/>").text( "목록없음" ));
						  $("#listTable").append(tr);
						 }
				}
				
				function pagelist(cpage){
			
					
					document.getElementById("pageNo").value=cpage;
					var frm = document.getElementById("frm");
					frm.action="member_list.do";
					frm.submit();
			}

				
	</script>
	<br/>
	<br/>
	<div style="text-align: right;">
		<label>회원분류</label>
			<select class="form-control" id="selectType" style="width:120px; display:inline-block;">
				<option value="all" >전체보기</option>
				<option value="admin">관리자</option>
				<option value="member">일반회원</option>
				<option value="manager">행사담당자</option>
			</select>
		</div>
		<table id="listTable" class="table table-hover" style="margin-top: 10px">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>회원분류</th>
				<th>활동상태</th>
			</tr>
			<c:forEach items="${memberList }" var="member" varStatus="status">
				<tr class="body">
					<td>${status.count  + (pageNo-1)*perPag }</td>
					<td><a href="${pageContext.request.contextPath }/member_view.do?userId=${member.userId }">${member.userId }</a></td>
					<td>${member.nickname }</td>
					<td>${member.memberType }</td>
					<td>${member.memberStatus }</td>
				</tr>
			</c:forEach>
		</table>
			<br/>
			<div id="pageArea" style="text-align: center;">
				${pageLink }
				<form id="frm" method="post">
					<input type="hidden" name="pageNo" id="pageNo" />
					<input type="hidden" name=category id="category" value="${sessionScope.category }"/>
				</form>
			</div>
			<br/>
			<div class="form-group" style="text-align: center;">
				<select class="form-control" id="selectSearchType" style="display:inline-block; width:120px;">
					<option>선택</option>
					<option value="byUserId">아이디</option>
					<option value="byNickname">닉네임</option>
				</select>
				<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchMember" 
				  					style="display:inline-block; width:150px;">
				<button type="button" id="searchMemberBtn" class="btn btn-default">검색</button>
				</div>
			</div>
  			<div id="stamp"  style=" width: 800px;">
  			<br/><br/>
    		<table class="table table-hover" style="margin-top: 10px; table-layout:fixed;">	
				<thead>
					<tr class="body">
						<th width="100px">스탬프번호</th>
						<th width="80px">스탬프</th>
						<th width="220px">행사명</th>
						<th width="125px">회원아이디</th>
						<th width="150px">발급날짜</th>
						<th width="100px">스탬프상태</th>
						<th width="100px">상태바꾸기</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${ stampList!=null&&stampList.size()>0 }">					
						<c:forEach items="${stampList }" var="stamp">
							<tr class="body">
								<td style="vertical-align: middle">${stamp.stampNum}</td>
							
								<td style="vertical-align: middle"><img width='45px' height='45px'  src="${pageContext.request.contextPath}/images/test/${stamp.stampImage}"/></td>
							
								<td style="vertical-align: middle"><p style="text-overflow:ellipsis; width:90%; white-space: nowrap; word-wrap: normal; 
										   overflow: hidden; margin: 0px ">${stamp.event.eventTitle }</p></td>
								<td style="vertical-align: middle">${stamp.userId }</td>
								<td style="vertical-align: middle">${stamp.stampGetDate }</td>
								<td style="vertical-align: middle">
								<c:choose>
								<c:when test="${stamp.stampStatus==1 }">보이기</c:when>
								<c:otherwise>감추기</c:otherwise>
								</c:choose>
								</td>
								<td style="vertical-align: middle"><button class="btn btn-default" href="${pageContext.request.contextPath}/stamp_changeStamp.do?userId=${stamp.userId }&eventId=${stamp.eventId}&stampNum=${stamp.stampNum }">바꾸기</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="5" align="center">스탬프 목록이 존재하지 않습니다.</td>
					</c:otherwise>
				</c:choose>
				</table>
  			</div>
  			<div id="eventImage"  style=" width: 800px;">
				<script type="text/javascript">
			
			  $(function(){
				$("#searchEventBtn").on("click", function() {
					$("#imageDiv").css("display","none");
					$("#imageDiv2").css("display","none");
					$("#imageDiv3").css("display","none");
					$("#imageTable1").children().remove();
					$("#updateImage").val("");
					$("#eventListTable").children().remove();
					$.post("${pageContext.request.contextPath}/event_ajax_search.do"
							, {"adminkeyword":$("#searchEventTitle").val()}
							,function (jsonObj) {
								
								if(jsonObj.status){
									$(jsonObj.eventList).each(function(index, item) {
										var img;
										
										if(item.eventThumbnail!=null&&item.eventThumbnail.trim()!=""){
											img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
										}else{
											img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noImage.png","style":"width: 100px;height:100px"});
										}				
										
										var td11=$("<td rowspan='2' width='101px'/>").append(img);
										
										var a1=$("<a/>").text(item.eventTitle)
														  .attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
										var td12=$("<td align='center'/>").html(a1);
										var butt1=$("<button role='button' class='buttn1'/>")
																.attr({"id": item.eventTitle,"name":item.eventId})
																.text("사진 검색");
										var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
										var butt2=$("<button role='button' class='buttn2'/>").attr({"id": item.eventTitle,"name":item.eventId})
															.text("Url 입력");
										var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
										var butt3=$("<button role='button' class='buttn3'/>").attr({"id": item.eventTitle,"name":item.eventId})
															.text("직접 등록");
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
					$("#imageTable1").children().remove();
					$("#updateImage").val("");
					
						var title = $(this).attr("id");
						var id = $(this).attr("name");
					
						$.post("${pageContext.request.contextPath}/event_change_image_form.do"
								, {"eventTitle": title , "eventId":id}
								,function (jsonObj) {
									
									if(jsonObj.status){
								
										$(jsonObj.imageList).each(function(index, item) {
										var image= $("<img class='forchangeimage'/>").attr("src",item.imageLink)
																					 .css({"display":"block","width":"60px","height":"60px"});
										var width=$("<p/>").text("WIDTH : "+item.sizeWidth).attr("style","font-size:0.8em;margin:0px");
										var height=$("<p/>").text("HEIGHT : "+item.sizeHeight).attr("style","font-size:0.8em;margin:0px");
										var radio=$("<input type='radio' name='selectImage' class='selectImage'/>")
																					  .attr("value",item.imageLink);
										var td=$("<td align='center'/>").append(image,width,height,radio);
									 	var tr=$("<tr/>").append(td);
										$("#imageTable1").append(tr);
									 	
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
										var adminkeyword=jsonObj.adminkeyword;
							
										$("#imageDiv").css("display","none");
										$("#imageDiv2").css("display","none");
										$("#imageDiv3").css("display","none");
										$("#imageTable1").children().remove();
										$("#updateImage").val("");
										$("#eventListTable").children().remove();
										
										$.post("${pageContext.request.contextPath}/event_ajax_search.do"
												, {"adminkeyword":adminkeyword}
												,function (jsonObj) {
													
													if(jsonObj.status){
														$(jsonObj.eventList).each(function(index, item) {
														
															var img;
															
															if(item.eventThumbnail!=null&&item.eventThumbnail.trim()!=""){
																img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
															}else{
																img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noImage.png","style":"width: 100px;height:100px"});
															}																	
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
																				.text("직접 등록");
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
						$("#imageTable1").children().remove();
						$("#updateImage").val("");
						
						$("#updateEventId").val($(this).attr("name"));
						
						$("#imageDiv2").css("display","block");
						
				  	  });
					
					  $(document).on("click",".buttn3",function(){
							$("#imageDiv").css("display","none");
							$("#imageDiv2").css("display","none");
							$("#imageDiv3").css("display","none");
							$("#imageTable1").children().remove();
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
										var adminkeyword=jsonObj.adminkeyword;
							
										$("#imageDiv").css("display","none");
										$("#imageDiv2").css("display","none");
										$("#imageDiv3").css("display","none");
										$("#imageTable1").children().remove();
										$("#updateImage").val("");
										$("#eventListTable").children().remove();
										
										$.post("${pageContext.request.contextPath}/event_ajax_search.do"
												, {"adminkeyword":adminkeyword}
												,function (jsonObj) {
													
													if(jsonObj.status){
														$(jsonObj.eventList).each(function(index, item) {
																												
															var img;
															
															if(item.eventThumbnail!=null&&item.eventThumbnail.trim()!=""){
																img=$("<img/>").attr({"src":item.eventThumbnail,"style":"width: 100px;height:100px"});
															}else{
																img=$("<img/>").attr({"src":"${pageContext.request.contextPath}/images/main/noImage.png","style":"width: 100px;height:100px"});
															}																	
															var td11=$("<td rowspan='2' width='101px'/>").append(img);
															var a1=$("<a/>").text(item.eventTitle)
																			.attr("href","${pageContext.request.contextPath}/event_detail.do?eventId="+item.eventId);
															var td12=$("<td align='center'/>").html(a1);
															var butt1=$("<button role='button' class='buttn1'/>")
																					.attr({"id": item.eventTitle,"name":item.eventId})
																					.text("사진 검색");
															var td13=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt1);	
															var butt2=$("<button role='button' class='buttn2'/>").attr({"id": item.eventTitle,"name":item.eventId})
																				.text("Url 입력");
															var td14=$("<td rowspan='2' width='90px' valign='middle' align='center'/>").html(butt2);
															var butt3=$("<button role='button' class='buttn3'/>").attr({"id": item.eventTitle,"name":item.eventId})
																				.text("직접 등록");
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
						$("#imageTable1").children().remove();
						$("#updateImage").val("");
					  });
				  });
				
				</script>
			<br/>
			<br/>
			<div class="form-group">		
			
				<input type="text" class="form-control" placeholder="이벤트명을 입력하세요" id="searchEventTitle" 
								   style="width:180px;display:inline-block;">
				<input type="button" id="searchEventBtn" class="btn btn-default" style="display:inline-block;" value="검색">
				&nbsp;&nbsp;
				<span style="color: red">검색어를 입력하지 않고 검색버튼을 누르면 이미지가 없는 행사들의 목록이 출력됩니다.</span>
			</div>
			
			<br/>
			<table id="eventListTable" class="table table-hover"  width="700px">
			</table >
			<br/>

		</div>
	</div>
	<br/><br/>
		
</c:when>
	<c:otherwise>
		<div id="tabs" style=" width: 1024px;">
			<div class="row" style="position: fixed; left: 1075px; z-index: 200; width: 170px;" >
				<h1>해당 페이지 이용권한이 없습니다.<br/><br/>
				로그인 후, 정상적인 접근을 해주세요.</h1>
			</div>
		</div>	
	</c:otherwise>
</c:choose>

</body>
</html>