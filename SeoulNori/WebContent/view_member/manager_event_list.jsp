<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">MY EVENT<font size="4em"><strong>&nbsp;담당 행사</strong></font>
</h2>
<br/>

	<div style="margin: 0 30px;">
	<center>
		<c:choose>
					<c:when test="${sessionScope.userId!=null&&sessionScope.member.memberStatus=='승인' }">
			
			<c:forEach items="${manager.eventList}" var="event" varStatus="status">
			<div style="width: 100%; text-align: left; padding-left: 5px;">
				<span class="glyphicon glyphicon-tags" style="font-size: x-large; font-weight: bold; color: mediumslateblue;"></span>&nbsp
				<span style="font-size: x-large; font-weight: bold; color: mediumslateblue;">${event.eventTitle}</span>&nbsp;
									<a href="${pageContext.request.contextPath }/event_detail.do?eventId=${event.eventId}" id="goEventDetail" style="color: black;">
				<input type="button" class="btn btn-default btn-xs" value="GO" 
							style="font-size: x-small; border-radius: 10px; vertical-align: text-bottom;"/>
				</a>
			</div>
			<br/>
			<table width="100%"  class="table table-hover" style="border-bottom: 1px solid #ddd;">
						<tr>
								<td>분류</td>
					<td>
			<c:if test="${event.categoryNum =='A02070100'|| event.categoryNum =='A02070200'}">
		 		축제
		 	</c:if>
			<c:if test="${event.categoryNum =='A02080200'||event.categoryNum =='A02080300'||event.categoryNum =='A02081000'}">
		 		공연
		 	</c:if>
		 	<c:if test="${event.categoryNum=='A02080500'||event.categoryNum=='A02080600'||event.categoryNum=='A02080700'}">
		 		전시
		 	</c:if>
		 	<c:if test="${event.categoryNum=='A02080900'||event.categoryNum=='A02080400'||event.categoryNum=='A02080800'}">
		 		클래식
		 	</c:if>
		 	<c:if test="${event.categoryNum=='A02080100'||event.categoryNum=='A02081300'}">
		 		전통
		 	</c:if>
			</td>
		</tr>
						<tr>  
		 					<td>평균별점</td>
		 					<td>
		   						<span style="margin: 0;"> <font color="#00CC99">
				<!-- 별점 로직 나오면 차후 eventDetail.eventAvgStar로 가져오면됨. -->
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
				<c:if test="${event.eventAvgStar>=3.5&&even.eventAvgStar<4 }">
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
				<c:if test="${event.eventAvgStar>=2&&even.eventAvgStar<2.5 }">
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
			    	</font>
				<c:if test="${event.eventAvgStar>=0&&event.eventAvgStar<0.5}">						
				</c:if>			     	
		     	</span>	 &nbsp;${event.eventAvgStar }
		 						</td>
							</tr>
							<tr>
		 						<td>기간</td>
		 						<td>${event.eventStartDate }~${event.eventEndDate }</td>
							</tr>
					</table>
					</c:forEach>	
			</c:when>
		<c:otherwise>
						<div id="progressArea">
							<div class="progress progress-striped active" >
		 	  					<div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
		 	   						<span class="sr-only">50% Complete</span>
		 	  					</div>
		    				</div>
		    				<label style="color: #3a9e8b;">
		    				<span class="glyphicon glyphicon-time"></span> 행사담당자 승인 절차가 진행 중입니다.
		    				</label>
	        				<br/><br/><br/>
		  				</div>
					</c:otherwise>
				</c:choose>
	</center>
	</div>
</body>
</html>