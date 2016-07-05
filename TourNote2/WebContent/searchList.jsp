<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
<style>
   @font-face {
  font-family: 'Nanum Gothic';
  font-style: normal;
  font-weight: 700;
  src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.eot);
  src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.eot?#iefix) format('embedded-opentype'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.woff2) format('woff2'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.woff) format('woff'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.ttf) format('truetype');
  }
  @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 400;
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.eot);
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.eot?#iefix) format('embedded-opentype'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.woff2) format('woff2'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.woff) format('woff'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.ttf) format('truetype');
  }
  @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 800;
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.eot);
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.eot?#iefix) format('embedded-opentype'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.woff2) format('woff2'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.woff) format('woff'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.ttf) format('truetype');
  }

	#recordListTable {
		margin-left:200px;
		width:900px;
		text-align:center;
    	font-family: 'Nanum Gothic';
		color:black;
		margin-bottom: 100px;
		background-color: white;
	}
		
	#recordListTable td{
		height:30px;
		border-bottom: 1px solid silver;
	}
	
	#title{
	}
	
	a{
		color:black;
	}
	
	th{
		text-align:center;
		background-color: #39ABB9;
		color:white;
		height: 40px;
	}	
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- <script type="text/javascript">
 $(function(){
	 $("#reOrder").click(function(){
		$.post("${pageContext.request.contextPath}/findTravelRecordList.do",
				{"continentalName":$("#continentalName").val(), "order":$("#order").val()},
			function(jsonObj){
					$(".remove").remove();
				$(jsonObj.travelRecordList).each(function(index, item){
			 		
					var td1 = $("<td/>").attr("class", "list").text(item.recordNum);	
			 		var td2 = $("<td/>").attr("class", "list").text(item.continentalName);	
			 		var a = $("<a/>").attr("href", "${pageContext.request.contextPath}/selectRecord.do?recordNum="+item.recordNum).text(item.recordTitle);
			 		var td3 = $("<td/>").attr("class", "list").append(a);
			 		var td4 = $("<td/>").attr("class", "list").text(item.recordHit);	
			 		var td5 = $("<td/>").attr("class", "list").text(item.recommend);	
			 		var td6 = $("<td/>").attr("class", "list").text(item.recordWriter);	
			 		var td7 = $("<td/>").attr("class", "list").text(item.recordStartTime);
			 		var tr = $("<tr/>").attr("class", "remove").append(td1, td2, td3, td4, td5, td6, td7);
			 				
			 		$("#recordListTable").append(tr);
			 				
			 	});
			});		
	}); 
 });
</script>	
 -->
 <body class="container-white">

	 <nav class="sidenav" style="top: 60%; position: fixed;">   
		 <a href="${pageContext.request.contextPath }#top" class="n1"><img src="./images/mainPage/sideButton1.png" width="40px"/><span>TOP</span></a>
		 <c:choose>
			<c:when test="${sessionScope.member!=null && sessionScope.recordNum!=null }">		 
		 		<a href="${pageContext.request.contextPath }/upload_detail.do#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:when>
   	 		<c:otherwise>
		 		 <a href="${pageContext.request.contextPath }#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:otherwise>
		</c:choose> 
		 <a href="${pageContext.request.contextPath }#2" class="n1"><img src="./images/mainPage/sideButton3.png" width="40px"/><span>TRAVEL BOARD</span></a> 
		 <a href="${pageContext.request.contextPath }#3" class="n1"><img src="./images/mainPage/sideButton4.png" width="40px"/><span>MY TRAVEL</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice" class="n1"><img src="./images/mainPage/sideButton5.png" width="40px"/><span>NOTICE</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna" class="n1"><img src="./images/mainPage/sideButton6.png" width="40px"/><span>Q&A</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_faq.do?boardCategory=faq" class="n1"><img src="./images/mainPage/sideButton7.png" width="40px"/><span>FAQ</span></a> 
   	 </nav>
		<div class="container ">
			<div class="row">
				<div class="span12 centered" style="margin-top:30px">
					<h2 class="wow bounceInLeft animated" style="visibility: visible;">
					SEARCH LIST</h2>
				</div>
			</div>
		</div>

<table id="recordListTable">
	<tr>
		<th width="70">글번호</th>
		<th width="100">카테고리</th>
		<th>제목</th>
		<th width="70">조회수</th>
		<th width="70">추천수</th>
		<th width="100">작성자</th>
		<th width="150">작성일자</th>
	</tr>
	<c:choose>
		<c:when test="${not empty RecordList}">
			<c:forEach items="${ RecordList}" var="list">
				<tr class="remove">
					<td>${list.recordNum}</td>
					<td>
						<c:forEach items="${list.continentalName }" var="conti" varStatus="status">
							${conti}<c:if test="${not status.last }">,</c:if>
						</c:forEach>			
					</td>
					<td><a href='${pageContext.request.contextPath}/selectRecord.do?recordNum=+${list.recordNum}'>${list.recordTitle }</a></td>
					<td>${list.recordHit }</td>
					<td>${list.recommend}</td>
					<td>${list.recordWriter}</td>
					<td>${list.recordStartTime}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
				
		</c:otherwise>
	</c:choose>
</table>
</body>