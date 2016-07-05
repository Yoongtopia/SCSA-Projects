<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.seoulnori.vo.Event" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

	$(function() {
		
		$(".list-item").hover(function() {
			$(this).children().eq(0).css("display", "inline-block");
			$(this).children().eq(1).css("display", "inline-block");
			$(this).children().eq(2).css("display", "inline-block");
			$(this).children().eq(3).css("display", "inline-block");
			$(this).children().eq(4).css("display", "inline-block");
			$(this).children().eq(5).children().eq(0).children().eq(0).css("display", "inline-block");
			$(this).children().eq(5).children().eq(0).children().eq(1).css("display", "inline-block");
		}, function() {
			$(this).children().eq(0).css("display", "none");
			$(this).children().eq(1).css("display", "none");
			$(this).children().eq(2).css("display", "none");
			$(this).children().eq(3).css("display", "none");
			$(this).children().eq(4).css("display", "none");
			$(this).children().eq(5).children().eq(0).children().eq(0).css("display", "none");
			$(this).children().eq(5).children().eq(0).children().eq(1).css("display", "none");
		});
	
		
	});

	function imgResize(obj) {
		var objHeight = obj.height;
		var objWidth = obj.width;
		var imgPx = 279;
		
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
	
	function pagelist(cpage){
			
			document.getElementById("pageNo").value=cpage;
			var frm = document.getElementById("frm");
			frm.action="event_list_move.do";
			frm.submit();
	}


	
</script>
<style type="text/css">
	#categoryHeader {
		margin-bottom: -20px;
		margin-left: -20px;
	}
	#pagenation a { color: #999999; }
	#pagenation a:hover { color: #6dbd96; }
</style>
</head>
<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8" style="padding: 0;">
		

			<c:if test="${requestScope.category==null }">
				<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
					<img src="./images/main/category_exhibition.png"/>
				</div>
				<h2 id="categoryHeader">
					ALL&nbsp;&nbsp;<font size="4em"><strong>모든 카테고리</strong></font>
				</h2>
			</c:if>
			
			<c:if test="${requestScope.category=='exhibition' }">
				<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
					<img src="./images/main/category_exhibition.png"/>
				</div>
				<h2 id="categoryHeader">
					EXHIBITION&nbsp;&nbsp;<font size="4em"><strong>전시회 | 박람회 | 컨벤션</strong></font>
				</h2>
			</c:if>
			
			<c:if test="${requestScope.category=='performance' }">
				<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
					<img src="./images/main/category_performance.png"/>
				</div>
				<h2 id="categoryHeader">
					PERFOMANCE&nbsp;&nbsp;<font size="4em"><strong>뮤지컬 | 콘서트 | 연극</strong></font>
				</h2>
			</c:if>
			
			<c:if test="${requestScope.category=='festival' }">
				<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
					<img src="./images/main/category_festival.png"/>
				</div>
				<h2  id="categoryHeader">
					FESTIVAL&nbsp;&nbsp;<font size="4em"><strong>일반축제 | 문화관광축제</strong></font>
				</h2>
			</c:if>
			
			<c:if test="${requestScope.category=='classic' }">
				<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
					<img src="./images/main/category_classic.png" />
				</div>
				<h2  id="categoryHeader">
					CLASSIC&nbsp;&nbsp;<font size="4em"><strong>클래식 | 오페라 | 무용</strong></font>
				</h2>
			</c:if>
			
			<c:if test="${requestScope.category=='ect' }">
				<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
					<img src="./images/main/category_traditional.png"/>
				</div>
				<h2  id="categoryHeader">
					TRADITIONAL&nbsp;&nbsp;<font size="4em"><strong>전통행사 | 기타행사</strong></font>
				</h2>
			</c:if>
			

		<table style="padding-right: 20px; margin-left: 20px; margin-right: -15px;">
			<tr>
				<td style="width: 850px; text-align: right;">
					<c:choose>
						<c:when test="${sessionScope.detailKeyword!=null||requestScope.selectPlace!=null||requestScope.categoryCheck!=null||requestScope.datepicker!=null }">
							<h5>
								<a href="${pageContext.request.contextPath}/event_detail_search.do?order=issuePoint&detailKeyword=${sessiontScope.detailKeyword}&selectPlace=${requestScope.selectPlace}&categoryCheck=${requestScope.categoryCheck}&datepicker=${requestScope.datepicker}">화제순</a> | 
								<a href="${pageContext.request.contextPath}/event_detail_search.do?order=startDate&detailKeyword=${requestScope.detailKeyword}&selectPlace=${requestScope.selectPlace}&categoryCheck=${requestScope.categoryCheck}&datepicker=${requestScope.datepicker}">종료임박순</a> | 
								<a href="${pageContext.request.contextPath}/event_detail_search.do?order=avgStar&detailKeyword=${requestScope.detailKeyword}&selectPlace=${requestScope.selectPlace}&categoryCheck=${requestScope.categoryCheck}&datepicker=${requestScope.datepicker}">별점순</a>
							</h5>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.keyword!=null&&sessionScope.keyword!=''}">
									<h5>
										<a href="${pageContext.request.contextPath}/event_search_keyword.do?order=issuePoint">화제순</a> | 
										<a href="${pageContext.request.contextPath}/event_search_keyword.do?order=startDate">종료임박순</a> | 
										<a href="${pageContext.request.contextPath}/event_search_keyword.do?order=avgStar">별점순</a>
									</h5>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${requestScope.category!=null }">
											<h5>
												<a href="${pageContext.request.contextPath}/event_list_move.do?category=${requestScope.category }&order=issuePoint&pageNo=1">화제순</a> | 
												<a href="${pageContext.request.contextPath}/event_list_move.do?category=${requestScope.category }&order=startDate&pageNo=1">종료임박순</a> | 
												<a href="${pageContext.request.contextPath}/event_list_move.do?category=${requestScope.category }&order=avgStar&pageNo=1">별점순</a>
											</h5>
										</c:when>
										<c:otherwise>
											<h5>
												<a href="${pageContext.request.contextPath}/event_search_keyword.do?category=${requestScope.category }&order=issuePoint">화제순</a> | 
												<a href="${pageContext.request.contextPath}/event_search_keyword.do?category=${requestScope.category }&order=startDate">종료임박순</a> | 
												<a href="${pageContext.request.contextPath}/event_search_keyword.do?category=${requestScope.category }&order=avgStar">별점순</a>
											</h5>
										</c:otherwise>
									</c:choose>
								</c:otherwise>		
							</c:choose>
						</c:otherwise>
					</c:choose>		
					

				</td>
			</tr>
		</table>
	
	
		<div class="row" id="MainContents" style="padding: 0; overflow: visible;">
			<c:choose>
				<c:when test="${eventList!=null&&eventList.size()!=0}">
					<c:forEach items="${eventList}" var="event" varStatus="status">
						
						
						<div class="col-sm-6 col-md-4 list-item" style="padding: 10px 0; width: 281px; height: 399px;">
							<span class="border-top" style="position: absolute; width: 100%; padding: 0; margin: 0; 
																						border: 2px solid #6dbd96; z-index: 1; display: none;"></span>
							<span class="border-bottom" style="position: absolute; width: 100%; padding: 0; margin: 379px 0 0 0; 
																						border: 2px solid #6dbd96; z-index: 1; display: none;"></span>
							<span class="border-right" style="position: absolute; height: 382px; padding: 0; margin: 0; 
																						border: 2px solid #6dbd96; z-index: 1; display: none;"></span>
							<span class="border-left" style="position: absolute; height: 382px; padding: 0; margin: 0 0 0 279px; 
																						border: 2px solid #6dbd96; z-index: 1; display: none;"></span>
			
							<h4 style="color: #FF7575; padding: 0; margin: 12px 20px 0 215px ; width: 50px; height: 45px; position: absolute;
									z-index: 1; text-align: right; display: none;">
								<span class="glyphicon glyphicon-heart"></span>
								<span style="display: inline-block; font-weight: bold;">${event.count}</span>
							</h4>
			
							<div class="thumbnail"  style="padding: 0; border-radius: 0;">
								<a href="${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId}">
								<span class="imageTone" style="padding: 0; width: 279px; height: 45px; position: absolute; 
																						background-color: rgba( 255, 255, 255, 0.8); display: none;"></span>
								<span class="imageTone" style="padding: 0; width: 279px; height: 279px; position: absolute; 
																						background-color: rgba( 255, 255, 255, 0.5); display: none;"></span>
								</a>
								<div class="imageDiv" style="height: 279px; width: 279px; overflow: hidden; text-align: center; vertical-align: middle;">
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
						     	 <div class="textDiv" style="padding: 5px;">
							     	 <h5 style="width: 260px; margin-left: 5px;
							     	 					overflow: hidden; text-overflow:ellipsis; white-space:nowrap; word-wrap:normal;">
							     	 		<strong>${status.count + (pageNo-1)*perPage}위</strong>
							     	 		<a onclick="href='${pageContext.request.contextPath}/event_detail.do?eventId=${event.eventId }'">${event.eventTitle } </a>
							     	 </h5>
							     	 <h5>&nbsp;${event.eventStartDate } ~ ${event.eventEndDate }</h5>
							     	 <hr style="margin: 0 0 5px 0;"/>
							     	 <h5 style="margin-top: 0; margin-bottom: 5px; color: #6dbd96; font-size: medium;">&nbsp;
									     <c:if test="${event.eventAvgStar>=5 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
										</c:if>
										<c:if test="${event.eventAvgStar>=4.5&&event.eventAvgStar<5 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star-empty"></span>
										</c:if>
										<c:if test="${event.eventAvgStar>=4&&event.eventAvgStar<4.5 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>				     	
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=3.5&&event.eventAvgStar<4 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star-empty"></span>				     	
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=3&&event.eventAvgStar<3.5 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=2.5&&event.eventAvgStar<3 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star-empty"></span>
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=2&&event.eventAvgStar<2.5 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star"></span>
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=1.5&&event.eventAvgStar<2 }">
											<span class="glyphicon glyphicon-star"></span>
									     	<span class="glyphicon glyphicon-star-empty"></span>
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=1&&event.eventAvgStar<1.5 }">
											<span class="glyphicon glyphicon-star"></span>
										</c:if>			     	
										<c:if test="${event.eventAvgStar>=0.5&&event.eventAvgStar<1}">
											<span class="glyphicon glyphicon-star-empty"></span>
										</c:if>		     		
							     	 &nbsp;<strong>
							     	 <c:choose>
							     	 	<c:when test="${event.eventAvgStar>=0&&event.eventAvgStar<0.5}">
							     	 		<span style="margin-left: -10px;">${event.eventAvgStar}</span>&nbsp;
							     	 		<span style="font-size: small;">평가해주세요</span>
								     	 </c:when>
								     	 <c:otherwise>
								     	 	${event.eventAvgStar}
								     	 </c:otherwise>
							     	 </c:choose>
							     	 	</strong></h5>
							     	</div>
						    </div>	
						 </div>
						 
						 	<c:choose>
						 		<c:when test="${ status.count%3 != 0 }">
						 			<div class="col-sm-6 col-md-1" style="padding: 10px 0; width: 20px; display: inline-block;"></div>
						 		</c:when>
						 		<c:otherwise>
						 			<br/>
						 		</c:otherwise>
						 	</c:choose>
						 	
						 </c:forEach>   
				</c:when>
				<c:otherwise>
					<div class="row" id="noEventList" style="padding: 50px; text-align: center; color: #84709c; font-weight: bold;">
						<br/>
						<img src="${pageContext.request.contextPath}/images/event/noEventList.png"/>
						<br/><br/>
						<span class="glyphicon glyphicon-warning-sign"></span>
						검색 결과가 없습니다. 검색 조건을 바꾸거나 다른 키워드로 검색하세요.<br/><br/>
					</div>
				</c:otherwise>
			</c:choose>

			 
		</div>		
		<br/>
		<div id="pagenation" style="margin-bottom: 20px; text-align: center; font-size: large; font-family: 'Arial'; ">
			${pageLink }
		</div>
			<form id="frm" method="post">
			<input type="hidden" name="pageNo" id="pageNo"/>
			<input type="hidden" name=category id="category" value="${sessionScope.category }"/>
			</form>
			<br/>	
	</div>

	<div class="col-md-2"></div>

</div>

</body>
</html>