<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	  $(function () {
		  
		// 탭 @sy
		$('#mapTab a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
		});

		// 지역구별 검색 이미지 슬라이더 @sy
		$('.bxSlider-map').bxSlider({
		    slideWidth: 373,
		    minSlides: 2,
		    maxSlides: 2,
		    moveSlides: 2,
		    slideMargin: 10,
		    auto: true,
		    autoHover: true
		  }); 
		
		// 지하철역별 검색 이미지 슬라이더 @sy
		$('.bxSlider-subway').bxSlider({
		    slideWidth: 373,
		    minSlides: 2,
		    maxSlides: 2,
		    moveSlides: 2,
		    slideMargin: 10,
		    auto: true,
		    autoHover: true
		  }); 
		
		
		// 지역구별 검색시 다시 지도 영역으로 @sy
		if( $("#clickedGuName").val() != ""){
			$("#main-menu-map").click();
		}
		
		// 지하철역별 검색시 다시 지하철노선 영역으로 @sy
		if( $("#clickedSubwayName").val() != "" ){
			$("#main-menu-map").click();
			$("#bySubwayTab").click();
		}
		
		// 지역구별 검색 @sy
		$("#Dobong-gu").on("mouseenter", function() {
			$("#Dobong-gu").css("fill","darkseagreen");
		});
		$("#Dongdaemun-gu").on("mouseenter", function() {
			$("#Dongdaemun-gu").css("fill","darkseagreen");
		});
		$("#Dongjak-gu").on("mouseenter", function() {
			$("#Dongjak-gu").css("fill","darkseagreen");
		});
		$("#Eunpyeong-gu").on("mouseenter", function() {
			$("#Eunpyeong-gu").css("fill","darkseagreen");
		});
		$("#Gangbuk-gu").on("mouseenter", function() {
			$("#Gangbuk-gu").css("fill","darkseagreen");
		});
		$("#Gangdong-gu").on("mouseenter", function() {
			$("#Gangdong-gu").css("fill","darkseagreen");
		});
		$("#Gangseo-gu").on("mouseenter", function() {
			$("#Gangseo-gu").css("fill","darkseagreen");
		});
		$("#Geumcheon-gu").on("mouseenter", function() {
			$("#Geumcheon-gu").css("fill","darkseagreen");
		});
		$("#Guro-gu").on("mouseenter", function() {
			$("#Guro-gu").css("fill","darkseagreen");
		});
		$("#Gwanak-gu").on("mouseenter", function() {
			$("#Gwanak-gu").css("fill","darkseagreen");
		});
		$("#Gwangjin-gu").on("mouseenter", function() {
			$("#Gwangjin-gu").css("fill","darkseagreen");
		});
		$("#Gangnam-gu").on("mouseenter", function() {
			$("#Gangnam-gu").css("fill","darkseagreen");
		});
		$("#Jongno-gu").on("mouseenter", function() {
			$("#Jongno-gu").css("fill","darkseagreen");
		});
		$("#Jung-gu").on("mouseenter", function() {
			$("#Jung-gu").css("fill","darkseagreen");
		});
		$("#Jungnang-gu").on("mouseenter", function() {
			$("#Jungnang-gu").css("fill","darkseagreen");
		});
		$("#Mapo-gu").on("mouseenter", function() {
			$("#Mapo-gu").css("fill","darkseagreen");
		});
		$("#Nowon-gu").on("mouseenter", function() {
			$("#Nowon-gu").css("fill","darkseagreen");
		});
		$("#Seocho-gu").on("mouseenter", function() {
			$("#Seocho-gu").css("fill","darkseagreen");
		});
		$("#Seodaemun-gu").on("mouseenter", function() {
			$("#Seodaemun-gu").css("fill","darkseagreen");
		});
		$("#Seongbuk-gu").on("mouseenter", function() {
			$("#Seongbuk-gu").css("fill","darkseagreen");
		});
		$("#Seongdong-gu").on("mouseenter", function() {
			$("#Seongdong-gu").css("fill","darkseagreen");
		});
		$("#Songpa-gu").on("mouseenter", function() {
			$("#Songpa-gu").css("fill","darkseagreen");
		});
		$("#Yangcheon-gu").on("mouseenter", function() {
			$("#Yangcheon-gu").css("fill","darkseagreen");
		});
		$("#Yeongdeungpo-gu").on("mouseenter", function() {
			$("#Yeongdeungpo-gu").css("fill","darkseagreen");
		});
		$("#Yongsan-gu").on("mouseenter", function() {
			$("#Yongsan-gu").css("fill","darkseagreen");
		});
		$("#kyu1").on("mouseenter", function() {
			$("#kyu1").css("fill","#F4E0E0");
		});
		$("#kyu2").on("mouseenter", function() {
			$("#kyu2").css("fill","#F4E0E0");
		});
		$("#kyu3").on("mouseenter", function() {
			$("#kyu3").css("fill","#F4E0E0");
		});
		$("#kyu4").on("mouseenter", function() {
			$("#kyu4").css("fill","#F4E0E0");
		});
		$("#kyu5").on("mouseenter", function() {
			$("#kyu5").css("fill","#F4E0E0");
		});
		$("#kyu6").on("mouseenter", function() {
			$("#kyu6").css("fill","#F4E0E0");
		});
		$("#kyu7").on("mouseenter", function() {
			$("#kyu7").css("fill","#F4E0E0");
		});
		
		$("path").on("mouseleave", function() {		
				$(".seoulPath").children().css("fill","#ddd");
				$(".sudoPath").children().css("fill","#fff");
				$(".guName").children().css("fill", "#565656");
		});
		
		$("#Dobong-gu").on("click", function() {
			var id=$(this).attr("id");
			console.log(id);
			callList(id);
		});
		$("#Dongdaemun-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Dongjak-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Eunpyeong-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Gangbuk-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Gangdong-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Gangseo-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Geumcheon-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Guro-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Gwanak-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Gwangjin-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Gangnam-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Jongno-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);							
		});
		$("#Jung-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Jungnang-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Mapo-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Nowon-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Seocho-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Seodaemun-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Seongbuk-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Seongdong-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Songpa-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Yangcheon-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Yeongdeungpo-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#Yongsan-gu").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu1").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu2").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu3").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu4").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu5").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu6").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		$("#kyu7").on("click", function() {
			var id=$(this).attr("id");
			callList(id);
		});
		// end 지역구별 검색
		
		
		// 지하철역별 검색 @sy
		$("#gwanghwa").on("click", function() {
			callSubwayList("mapX=126.9764537&mapY=37.5716284&id=gwanghwa");
		});
		$("#nambu").on("click", function() {
			callSubwayList("mapX=127.0107423&mapY=37.4785361&id=nambu");
		});
		$("#myoungdong").on("click", function() {
			callSubwayList("mapX=126.9864814&mapY=37.5609735&id=myoungdong");
		});
		$("#samsung").on("click", function() {
			callSubwayList("mapX=127.0631652&mapY=37.5088693&id=samsung");
		});
		$("#cityHall").on("click", function() {
			callSubwayList("mapX=126.9767911&mapY=37.5642225&id=cityHall");
		});
		$("#shincheon").on("click", function() {
			callSubwayList("mapX=126.9373755&mapY=37.5552514&id=shincheon");
		});
		$("#apgujung").on("click", function() {
			callSubwayList("mapX=127.0285041&mapY=37.5261521&id=apgujung");
		});
		$("#omok").on("click", function() {
			callSubwayList("mapX=126.8750667&mapY=37.5245635&id=omok");
		});
		$("#jongno3").on("click", function() {
			callSubwayList("mapX=126.9918461&mapY=37.5716415&id=jongno3");
		});
		$("#hapjung").on("click", function() {
			callSubwayList("mapX=126.9145430&mapY=37.5499421&id=hapjung");
		});
		$("#hyehwa").on("click", function() {
			callSubwayList("mapX=127.0019098&mapY=37.5820886&id=hyehwa");
		});
		
		$("circle").hover(function() {
			$(this).css("stroke", "salmon");
		}, function() {
			$(this).css("stroke", "gray");
		});
		

	  });
	  
	  
	  // 지역구 클릭시 호출되는 함수 @sy
	 function callList(id) {
		location.href="${pageContext.request.contextPath}/event_search_by_gu.do?eventGu="+id;
	};

	function callSubwayList(str) {
		location.href="${pageContext.request.contextPath}/event_search_station.do?"+str;
	}
	  
</script>
<style type="text/css">

	.mapSlideTable { margin: 15px 0; width: 372px; }
	.mapSlideTd { 
		position: fixed;
		vertical-align: middle; 
		padding: 12px 5px;
		width: 290px; 
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		word-wrap: normal;
	}
	.mapSlideTitle { font-size: 16px; font-weight: bold; padding-left: 10px; width: 280px; }
	.mapSlideDate { padding-left: 10px; }
	.mapSlideHr { margin: 7px 0; border-color: silver; width: 280px; }
	.mapSlideImg { width: 80px; height: 80px; }

</style>
</head>
<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
		<br/>
		<div class="row" style="padding: 15px 0;">
			<span class="glyphicon glyphicon-screenshot seoulnori-mid-title" style="font-size: 24px;"></span>
			<span class="seoulnori-mid-title" style="font-size: 20px;">지역별 노리찾기</span> 
		</div>

		<ul class="nav nav-tabs-seoulnori" id="mapTab">
		  <li class="active"><a id="byMapTab" class="tab-seoulnori" href="#byMap">지역구별</a></li>
		  <li><a id="bySubwayTab" class="tab-seoulnori" href="#bySubway">지하철역별</a></li>
		</ul>
		 
		<div class="tab-content">
		  <div class="tab-pane active" id="byMap">
		  
		  	<!-- 지도 -->
		  	<div class="row" id="mapImage" >
			<table style="width: 100%;">
				<tr>
					<td style=" text-align: center; overflow: hidden; width: 100%;">
						<c:import url="seoul_sudo_map.jsp"></c:import>
					</td>
				</tr>
			</table>	
			
		</div>
		
		<br/>
		<div class="row" id="mapContents" style="height: 340px;">
			
			<div id="guList">
			
				<div style="margin-left: 60px; font-weight: bold;">
					<input type="hidden" id="clickedGuName" value="${clickedGuName}" />
					<c:if test="${ eventListByGu != null }">
						<span class="glyphicon glyphicon-search" style="font-size: medium; color: gray;"></span> 
						<span style="font-size: medium;">${clickedGuName} 행사정보 ( ${ eventListByGu.size() }건 )</span>				
					</c:if>
				</div>
				
				<c:choose>
					<c:when test="${ eventListByGu != null && eventListByGu.size() != 0 }">					
						
						<div class="bxSlider-map" style="width: 800px;">
						
						<c:forEach items="${eventListByGu}" var="event" varStatus="status">

							<c:if test="${ status.index%2 == 0 }">  
								 <!-- 이미지 슬라이더 contents : start -->
								  <div class="slide">
							</c:if>

										<table class="mapSlideTable">
											<tr>
												<td style="width: 82px;">
													<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}">
														<c:if test="${event.eventThumbnail != null}">
															<img class="mapSlideImg" src="${event.eventThumbnail}"/>
														</c:if>
														<c:if test="${event.eventThumbnail == null}">
															<img class="mapSlideImg" src="${pageContext.request.contextPath}/images/main/noPhoto.png"/>
														</c:if>
													</a>
												</td>
												<td class="mapSlideTd">
													<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}" style="width: 280px;">
														<span class="mapSlideTitle">
															${event.eventTitle}
														</span>
													</a>
													<hr class="mapSlideHr"/>
													<span class="mapSlideDate">${event.eventStartDate} ~ ${event.eventEndDate}</span>
												</td>
											</tr>		
										</table>
										
								<c:if test="${ status.index%2 == 1 || status.index == eventListByGu.size()-1 }">
									</div>
									<!-- 이미지 슬라이더 contents : end -->
								</c:if>
								
								<c:if test="${ eventListByGu.size() < 3 }">
								
									<div class="slide">
										<table class="mapSlideTable">
											<tr><td style="width: 82px;"><a></a></td><td class="mapSlideTd">
											<a><span class="mapSlideTitle"></span></a>
											<hr class="mapSlideHr" style="border-color: transparent;"/>
											<span class="mapSlideDate"></span></td></tr></table>
									</div>
										
								</c:if>
						
						</c:forEach>
						
						</div> <!-- end bxSlider-map -->
					</c:when>
					<c:otherwise>
					
					<c:if test="${ eventListByGu.size() == 0 }">
						<div style="padding: 80px; text-align: center;">
							<div style="height: 32px; vertical-align: middle; line-height: 32px; display: inline-block; color: gray;"> 
								<span class="glyphicon glyphicon-ok-circle" style="font-size: x-large; color: #6dbd96; margin-bottom: 10px;"></span><br/>
								선택하신 지역에서 진행중인 행사정보가 없습니다
							</div>
						</div>
					</c:if>
					
					<c:if test="${ eventListByGu == null }">
						<div style="padding: 80px; text-align: center;">
							<div style="height: 32px; vertical-align: middle; line-height: 32px; display: inline-block; color: gray; font-size: 14px;"> 
								<div style="border: 1px solid #ddd; border-radius: 5px; background-color: #f7f7f7; padding: 20px 20px;">
									<span class="glyphicon glyphicon-hand-up" style="font-size: x-large; color: #6dbd96; margin-bottom: 10px;"></span><br/>
									행사정보를 검색하고자 하는 지역을 클릭하세요
								</div>
							</div>
						</div>
					</c:if>
						
					</c:otherwise>
				</c:choose>
					
					
			</div><!-- end guList -->
				
		</div><!-- end byMap -->
		  
		  </div>
		  
		  <div class="tab-pane" id="bySubway">
		  
		  		  
		  	<!-- 노선도 -->
		  	<div class="row" id="subwayMapImage" >
				<table style="width: 100%;">
					<tr>
						<td style=" text-align: center; overflow: hidden; width: 100%;">
							<c:import url="subway_map.jsp"></c:import>
						</td>
					</tr>
				</table>	
				
			</div>
			
			<br/>
			<div class="row" id="subwayContents" style="height: 340px;">
				
				<div id="subwayList">
				
					<div style="margin-left: 60px; font-weight: bold;">
						<input type="hidden" id="clickedSubwayName" value="${clickedSubwayName}" />
						<c:if test="${ eventListBySubway != null }">
							<span class="glyphicon glyphicon-search" style="font-size: medium; color: gray;"></span> 
							<span style="font-size: medium;">${clickedSubwayName} 행사정보 ( ${ eventListBySubway.size() }건 )</span>				
						</c:if>
					</div>
					
					<c:choose>
						<c:when test="${ eventListBySubway != null && eventListBySubway.size() != 0 }">					
							
							<div class="bxSlider-subway" style="width: 800px;">
							
							<c:forEach items="${eventListBySubway}" var="event" varStatus="status">
	
								<c:if test="${ status.index%2 == 0 }">  
									 <!-- 이미지 슬라이더 contents : start -->
									  <div class="slide">
								</c:if>
	
											<table class="mapSlideTable">
												<tr>
													<td style="width: 82px;">
														<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}">
															<c:if test="${event.eventThumbnail != null}">
																<img class="mapSlideImg" src="${event.eventThumbnail}"/>
															</c:if>
															<c:if test="${event.eventThumbnail == null}">
																<img class="mapSlideImg" src="${pageContext.request.contextPath}/images/main/noPhoto.png"/>
															</c:if>
														</a>
													</td>
													<td class="mapSlideTd">
														<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}" style="width: 280px;">
															<span class="mapSlideTitle">
																${event.eventTitle}
															</span>
														</a>
														<hr class="mapSlideHr"/>
														<span class="mapSlideDate">${event.eventStartDate} ~ ${event.eventEndDate}</span>
													</td>
												</tr>		
											</table>
											
									<c:if test="${ status.index%2 == 1 || status.index == eventListBySubway.size()-1 }">
										</div>
										<!-- 이미지 슬라이더 contents : end -->
									</c:if>
							</c:forEach>
							
							<c:if test="${ eventListBySubway.size() < 3 }">
										
										<div class="slide">
											<table class="mapSlideTable">
												<tr><td style="width: 82px;"></td>
													<td class="mapSlideTd"><a style="width: 280px;"><span class="mapSlideTitle"></span></a>
														<hr class="mapSlideHr" style="border-color: transparent;"/>
														<span class="mapSlideDate"></span>
												</td></tr>		
											</table>
										</div>
											
								</c:if>
							
							</div> <!-- end bxSlider-map -->
						</c:when>
						<c:otherwise>
						
						<c:if test="${ eventListBySubway.size() == 0 }">
							<div style="padding: 80px; text-align: center;">
								<div style="height: 32px; vertical-align: middle; line-height: 32px; display: inline-block; color: gray;"> 
									<span class="glyphicon glyphicon-ok-circle" style="font-size: x-large; color: #6dbd96; margin-bottom: 10px;"></span><br/>
									선택하신 지하철역 주변에서 진행중인 행사정보가 없습니다
								</div>
							</div>
						</c:if>
						
						<c:if test="${ eventListBySubway == null }">
							<div style="padding: 80px; text-align: center;">
								<div style="height: 32px; vertical-align: middle; line-height: 32px; display: inline-block; color: gray;
													font-size: 14px;">
									<div style=" border: 1px solid #ddd; border-radius: 5px; background-color: #f7f7f7; padding: 20px 20px;">
									<span class="glyphicon glyphicon-hand-up" style="font-size: x-large; color: #6dbd96; margin-bottom: 10px;"></span><br/>
										주변 행사정보를 검색하고자 하는 지하철역을 클릭하세요<br/>
										도보 10분 거리 이내의 행사정보를 제공해 드립니다
									</div> 
								</div>
							</div>
						</c:if>
							
						</c:otherwise>
					</c:choose>
						
						
				</div><!-- end subwayList -->
					
			</div><!-- end bySubway -->
		  
		</div>
		
			
	
	</div>
	
	<div class="col-md-2"></div>

</div>

</body>
</html>