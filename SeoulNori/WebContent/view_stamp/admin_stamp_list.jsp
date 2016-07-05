<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function mouseEnter(count){
		$.post("${pageContext.request.contextPath}/stamp_review_ajax.do", 
			    {"eventId":$("#event"+count).val(), "userId":$("#user"+count).text()},
		    	function(jsonObj){
			    	if(jsonObj.status){
			    		var br = $("<br/>");
			    		var image = $("<img src='${pageContext.request.contextPath}/images/test/'jsonObj.review.reviewImage>");
			    		var div = $("<div/>").attr("id", count).text(jsonObj.review.reviewContent).append(br, br, image);
			    		$("#td"+count).append(div);
				    	
			    	}else{
			    		
			    	}
		  		}, "JSON"); 
		
		//$("#"+count).removeAttr("style");	
		
	}
	
	function mouseLeave(count){
		 $("#"+count).remove();
		// $("#"+count).attr("style","display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;");	
	}
</script>

<body>
<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
	STAMP LIST<font size="4em"><strong>&nbsp;스탬프 관리</strong></font>
</h2>
<div style="margin: 0 0 0 30px  ;">


<br/>
<center>
	<table  class="table table-hover" style="border-bottom:1pxl solid #ddd;">
		<tr style="background-color: #f5f5f5;">
				<th>스탬프</th>
				<th>행사</th>
				<th>획득내용</th>
				<th>아이디</th>
				<th>발급날짜</th>
				<th>on/off</th>
				<th>변경</th>
		</tr>
		  <c:forEach items="${stampList }" var="stamp" varStatus="status">
		  <tr onmouseenter="mouseEnter('${status.count}')" onmouseleave="mouseLeave('${status.count}')" style="cursor:hand" >
			<td style="text-align: center; vertical-align: top"><img width='45px' height='45px'  src="${pageContext.request.contextPath}/images/test/${stamp.stampImage}"/></td>
			<td style="vertical-align: top;"><a href="${pageContext.request.contextPath }/event_detail.do?eventId=${stamp.eventId}">${stamp.event.eventTitle }</a></td>
			<td id="td${status.count}" style="vertical-align: top;">${stamp.stampContent }</td>
			<td id="user${status.count}" style="vertical-align: top;">${stamp.userId }</td>
			<td style="vertical-align: top;">${stamp.stampGetDate }</td>
			<td style="vertical-align: top;">
				<c:choose>
				<c:when test="${stamp.stampStatus==1 }">on</c:when>
				<c:otherwise>off</c:otherwise>
				</c:choose>
			</td>
		    <td style="vertical-align: top;"><a href="${pageContext.request.contextPath}/stamp_changeStamp.do?userId=${stamp.userId }&eventId=${stamp.eventId}&stampNum=${stamp.stampNum }"><button class="btn btn-default">변경</button></a></td>
		  </tr>
		  <input type="hidden" id="event${status.count}" value="${stamp.eventId }">
		  </c:forEach>
		
		
	<%-- 	
		
		
		<c:choose>
			<c:when test="${ stampList!=null&&stampList.size()>0 }">					
				<c:forEach items="${stampList }" var="stamp" varStatus="status">
					<tr onmouseenter="mouseEnter('${status.count}')" onmouseleave="mouseLeave('${status.count}')" style="cursor:hand">
						<td><img width='45px' height='45px'  src="${pageContext.request.contextPath}/images/test/${stamp.stampImage}"/></td>
						<td >${stamp.event.eventTitle }
						<input type="hidden" id="event${status.count}" value=${stamp.eventId }>
						</td>
						<td>${stamp.stampContent}</td>
						<td id="user${status.count}">${stamp.userId }</td>
						<td>${stamp.stampGetDate }</td>
						<td>
						<c:choose>
						<c:when test="${stamp.stampStatus==1 }">보이기 상태</c:when>
						<c:otherwise>감추기 상태</c:otherwise>
						</c:choose>
						</td>
						<td><a href="${pageContext.request.contextPath}/stamp_changeStamp.do?userId=${stamp.userId }&eventId=${stamp.eventId}&stampNum=${stamp.stampNum }"><button>바꾸기</button></a></td>
					</tr>
					<tr style="display:none;" id="tr${status.count}">
						<td colspan="7" id="td${status.count}">
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="5" align="center">스탬프 목록이 존재하지 않습니다.</td>
			</c:otherwise>
		</c:choose> --%>
	</table>

</center>
</div>
</body>
</html>