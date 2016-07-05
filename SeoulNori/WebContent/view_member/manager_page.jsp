<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		
		if($("#memberStatus").val()=="대기"){
			$("#progressArea").show();
			$("#memberStatusY").hide();
		} 
		
	});
	
</script>
</head>
<body>
	<div class="row" style="width: 1280px;">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<c:choose>
				<c:when test="${sessionScope.userId!=null&&sessionScope.member.memberType=='manager' }">
			 		<h2 style="margin-bottom: 20px; color:#6C47A3">
						MANAGER
						<font size="4em"><strong>행사 관리 페이지</strong></font>
			  		</h2>
			 		<br/>	
			  		<div class="memberStutusY">
			    		<div>
			 				${member.nickname }님 &nbsp;
			    			<input type="hidden" id="memberStatus" value="${sessionScope.member.memberStatus }"/>
			     			<a href="${pageContext.request.contextPath }/member_myInfo_move.do">
		      					<input type="button" class="btn btn-default" value="내 정보 수정">
		      				</a>
		      				<br/>
		      				<br/>
						</div>
		   				<br/>
		    			<table width="100%"  class="table table-hover">
		    				<thead>
		    					<tr>
		      						<th colspan="2">
		      							<h4>내 행사 정보</h4>
		      						</th>
		     					</tr>
		    				</thead>
		     				<c:forEach items="${member.eventList}" var="event" varStatus="status">
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
			    					<td>행사명</td>	
		       						<td>
		       							${event.eventTitle }
		       							<a href="${pageContext.request.contextPath }/event_detail.do?eventId=${event.eventId}" id="goEventDetail" style="color: black;">
											<input type="button" class="btn btn-default btn-xs" value="GO" 
														style="font-size: x-small; border-radius: 10px; vertical-align: text-bottom;"/>
										</a>
									</td>
		      					</tr>
		      					<tr>  
		        					<td>평균별점</td>
		        					<td>
		          						<h4 style="margin: 0">
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
											<c:if test="${eventl.eventAvgStar>=3.5&&even.eventAvgStar<4 }">
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
											<c:if test="${event.eventAvgStar>=0&&event.eventAvgStar<0.5}">						
											</c:if>			     	
									     	 &nbsp;${even.eventAvgStar }</h4>	
		        						</td>
		      						</tr>
		      						<tr>
		        						<td>기간</td>
		        						<td>${event.eventStartDate }~${event.eventEndDate }</td>
		      						</tr>
		     					</c:forEach>
		    				</table>
		  				</div>	
					</c:when>
					<c:otherwise>
						<div id="progressArea" style="display:none;">
							<div class="progress progress-striped active" >
		 	  					<div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
		 	   						<span class="sr-only">50% Complete</span>
		 	  					</div>
		    				</div>
		    				<h5>회원가입 승인 절차가 진행 중입니다.</h5>
	        				<br/><br/><br/>
		  				</div>
					</c:otherwise>
				</c:choose>
			</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>