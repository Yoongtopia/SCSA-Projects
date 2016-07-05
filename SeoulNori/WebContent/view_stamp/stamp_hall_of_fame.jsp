<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">
$(function(){

	
	console.log($("#1").val());
	console.log($("#2").val());
	console.log($("#3").val());
	$("#first").html($("#1").val());
	$("#second").html($("#2").val());
	$("#third").html($("#3").val());
	
});

</script>
<style type="text/css">

th{
text-align: center;
}

td{
text-align: center;
}

#first{
text-align: center;
font-weight: bold;
font-size: 1.5em;
}
#second{
text-align: right;
font-weight: bold;
}
#third{
text-align: left;
font-weight: bold;
}

</style>
</head>
<body>
<input type="hidden" id="list" value="${memberList }">
<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8" id="mainDiv">
		<div style="width: 100%; padding: 20px; border: 1px solid #ddd;">
			<img src="${pageContext.request.contextPath}/images/main/hallof.png" 
						style="width: 102px; height: 144px; margin-top: -20px;"/>
			<h3 style="margin-bottom: 20px; font-weight: 600; letter-spacing: -2px; display: inline-block;
								vertical-align: top; margin-top: 10px; margin-left: -10px; color: #553b75; ">서울노리 명예의 전당</h3>
		<center>
			<table width="300px">
				<tr bordercolor="white">
					<td colspan="3">
					<img src="./images/test/podium.png" width="360px" style="margin-top: -50px;"/>
					</td>
				</tr>
				<tr bordercolor="white">
					<c:choose>
							<c:when test="${memberList!=null&&memberList.size()>0 }">
							<td id="second" width="120px">2등 없음</td>
							<td id="first" width="120px">1등 없음</td>
							<td id="third" width="120px">3등 없음</td>
								<c:forEach items="${memberList }" var="member" varStatus="status">
									<input type="hidden" id="${status.count}" value="${member.nickname}님 ">
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="3">스탬프 목록이 존재하지 않습니다.</td>
							</c:otherwise>
					</c:choose>
				</tr>	
				</table>
				
				<br/><br/>
				
				<table id="listTable" class="table" style="table-layout:fixed; border-bottom: 1px solid #ddd;">
				 <thead>
				  <tr style="background-color: gold; color: maroon;">
				    <th>순위</th>
					<th colspan="2">닉네임</th>
					<th>스탬프 갯수</th>
				  </tr>
				</thead>
					<c:choose>
					<c:when test="${memberList!=null&&memberList.size()>0 }">
				
					<c:forEach items="${memberList }" var="member" varStatus="status">
					<tr bordercolor="white">
							<td>${status.count}</td>
							<td style="text-align: center;"><img src="${pageContext.request.contextPath}/images/test/${member.mainStamp}.png" width="50px"></td>
							<td style="text-align: left;">${member.nickname}</td>
							<td>${member.stampCount}개</td>
							
					</tr>	
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr bordercolor="white">
						<td colspan="4">스탬프 목록이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>
				
				</table>
		</center>
			
	</div>
	</div>
	<div class="col-md-2"></div>
</div>


</body>
</html>