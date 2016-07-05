<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type='text/css' href="${pageContext.request.contextPath}/css/jquery.bxslider.css"/>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.bxslider.js'></script>
<script type="text/javascript">

$(function() {
	
	
	if( $("#mainEventListChk").val() == null || $("#mainEventListChk").val() == "" ){
		location.href="${pageContext.request.contextPath}/seoulnori.do";
	} else {
		
		$('.bxSlider').bxSlider({
		    slideWidth: 277,
		    minSlides: 2,
		    maxSlides: 3,
		    moveSlides: 1,
		    slideMargin: 10,
		    auto: true,
		    autoHover: true
		  });
		
	}
	
	$('#questionMark').hover(function() {
		$("#seoulnori-tooltip").css("display", "block");
	}, function() {
		$("#seoulnori-tooltip").css("display", "none");
	});
	
});

function imgResize(obj) {
	var objHeight = obj.height;
	var objWidth = obj.width;
	var imgPx = 275;
	
	if(obj.width >= obj.height){
		obj.height = imgPx;
		obj.width = objWidth*imgPx/objHeight;
		if(obj.width > imgPx){
			$(obj).css("margin-left", ((obj.width-imgPx)/2)*(-1) );
		}
	} else {
		obj.width=imgPx;
		obj.height = objHeight*imgPx/objWidth;
		if(obj.height > imgPx){
			$(obj).css("margin-top", ((obj.height-imgPx)/2)*(-1) );
		}
	}
}


</script>
<style type="text/css">

	#moreView a strong:hover { color: #6dbd96; }

</style>
</head>
<body>

<input type="hidden" id="mainEventListChk" value="${mainEventList}"/>

<div class="row" style="width: 1280px;">
	
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<div id="seoulnori-tooltip" style="position: absolute; top: 21px; left: 185px; font-size: smaller; padding: 5px 10px; 
						background-color: #f5f5f5; border: 1px solid #ddd; display: none;">
		해당 순위는 지난 일주일 간의 트윗 수, 조회 수, 네이버 검색 수 등을 합산하여 산정합니다
	</div>
	<div class="row" style="padding: 15px 0;">
			<span class="glyphicon glyphicon-thumbs-up seoulnori-mid-title" style="font-size: 24px;"></span>
			<span class="seoulnori-mid-title" style="font-size: 20px;">서울노리 TOP5</span>
			<img src="${pageContext.request.contextPath}/images/main/question_mark.png" 
					width="23px" height="23px" style="margin-bottom: 3px;" id="questionMark"/>
	</div>
	<div class="row" style="text-align: right; margin-top: -30px; margin-bottom: 5px;" >
		<span id="moreView">
			<a href="${pageContext.request.contextPath}/event_search_keyword.do" style="text-decoration: none; color: black;">
			<strong>더보기+</strong></a>
		</span>
	</div>
	
		<div class="row" id="TopContents" style="padding: 0; overflow: visible;">
		
		<div class="bxSlider">

		  <c:if test="${mainEventList != null && mainEventList.size() != 0}">
			  <c:forEach items="${mainEventList}" var="event" varStatus="status">
			  
				<!-- 이미지 슬라이더 contents : start -->
				  <div class="slide">
					<div class="thumbnail_seoulnori" style="padding: 0; width: 277px; border: 0; border-radius: 0; box-shadow: 0;">
						<div class="imageDiv" style="height: 275px; width: 275px; overflow: hidden; text-align: center; vertical-align: middle;">
							<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}">
								<c:choose>
									<c:when test="${ event.eventThumbnail != null}">
										<img src="${event.eventThumbnail }"  onload="imgResize(this);"/>
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/images/main/noImage.png" height="279px" width="279px"/>
									</c:otherwise>
									</c:choose>							
							</a>
						</div>	
				     	 <div class="textDiv" style="padding: 5px; text-align: center;">
					     	 <h5 style="width: 260px; margin: 5px 0 0 5px;
					     	 					overflow: hidden; text-overflow:ellipsis; white-space:nowrap; word-wrap:normal;">
					     	 		<strong>${status.count}위 </strong>
					     	 		<a href="${pageContext.request.contextPath }/event_detail.do?eventId=${event.eventId }"
					     	 			style="color: gray; text-decoration: none;">${event.eventTitle}</a>
					     	 </h5>
					     </div>
				    </div>
				  </div>
				  <!-- 이미지 슬라이더 contents : end -->
				  
				</c:forEach>
			</c:if>
			
		</div> <!-- end bxSilder -->
			 
		</div>	<!-- end row -->
		
		
		<!-- ----------------------------------------------------------------------------------------------------------------------------------- -->

		<br/>
		
		<div class="row" id="MainContents" 
			style="padding: 10px; border: 1px solid #D4D4D4; height: 340px; vertical-align: middle;">
			
			<p><img alt="" src="${pageContext.request.contextPath}/images/main/seoulnori_guide.png" 
						width="840px" style="padding-top: 25px;"></p>
		</div>
			
	</div>

	<div class="col-md-2"></div>

</div>

</body>
</html>