<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

$(function(){
	
	//스탬프 라디오 버튼 클릭시 기존에 있던 eventId를 table에서 지운다 @OA
	$("input[type='radio']").on("change", function(){
		$("input[name='eventId']").remove();
	});
	
	
});

//메인스탬프 등록 버튼 누르기전 체크 @OA
function formCheck() {
	if($("input[type='radio']:checked").val()==null||$("input[type='radio']:checked").val().trim()==""){
		alert("스탬프를 선택해 주세요");
		return false;
	}
}
//스탬프 라디오 버튼 클릭시 eventId를 table에 추가한다. @OA
function mainStamp(stampNum) {
	var eventId = $("input[type='radio']:checked").attr('alt');
	$("<input type='hidden' name='eventId'>").attr('value', eventId).appendTo($("tbody"));
}

</script>
</head>
<body>

		<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
			STAMP<font size="4em"><strong>&nbsp;내 스탬프</strong></font>
		</h2>
		<br/>
	    <div style="margin: 0 30px;">
		<center>
		<c:choose>
		<c:when test="${not empty stampList }">
		<form id="mainStampForm" action="${pageContext.request.contextPath}/stamp_main_stamp.do" method="post" onsubmit="return formCheck();">
						<table id="listTable" style="table-layout:fixed;">
<!-- 						<table id="listTable" class="table table-hover" style="table-layout:fixed; border:1px solid #FFFFFF;"> -->
						  <c:forEach items="${stampList }" var="stamp" varStatus="status"> 
								<c:if test="${(status.index%3)==0}">
									<tr class="body">
								</c:if>
									<td>
										<center>
										<img width="200px" src="${pageContext.request.contextPath}/images/test/${stamp.stampImage}"/>
										<br/>
										<span style="font-weight: bold; font-size: medium;">${stamp.eventTitle}</span>
										<br/>
										(${stamp.stampGetDate})
										<br/>
										<input type="radio" name="stampNum" alt="${stamp.eventId}" value="${stamp.stampNum}" 
													onclick="mainStamp('${stamp.stampNum}');" style="margin-top: 10px;"/>
										</center> 
									</td>
								<c:if test="${(status.index%3)==2}">
									</tr>
								</c:if>
						  </c:forEach>
						  <tr>
						  <td colspan="4"><center><br/><br/><br/><input type="submit" class="btn btn-default" value="메인스탬프 지정"></center></td>
						  </tr>
						</table>
			 </form>
			 </c:when>
			 <c:otherwise>
			 		<label style="color: #3a9e8b;"><span class="glyphicon glyphicon-bullhorn"></span> 현재 보유 중인 스탬프가 존재하지 않습니다.</label>
			 </c:otherwise>
			 </c:choose>
		</center>
		</div>	
</body>
</html>