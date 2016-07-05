<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/item.css" rel="stylesheet" media="screen">
<link href="./css/menu.css" rel="stylesheet" media="screen">
<link href="./css/semantic.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="./css/semantic.css">

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
  
  body{
  	    font-family: 'Nanum Gothic';
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
	
	.count{
		width:50px;
	}
	
	#date{
		width:70px;
	}
	
	#time{
		width:100px;
	}
	
	#conti{
		margin-left:200px;
	
	}
	
	a{
		color:black;
	}
	
	th{
		text-align:center;
		background-color: #39ABB9;
		color:white;
		width:100px;
		height: 40px;
	}	
	
	#frm{
		margin:0
	}
	#rtitle{
		width:300px;
	}
</style>
<script type="text/javascript" src="./js/pageForRecord.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 $(function(){	
	 $("#reOrder").click(function(){
		 location.replace("${pageContext.request.contextPath}/findTravelRecordList.do?continentalName="+$('#continentalName').val()+"&lineup="+$('#lineup').val());
	 });
	
	 /* var continentalNameForSetting = param.continentalName;
	 var lineupForSetting = param.lineup;
	 
	 if(continentalNameForSetting != null){
		 document.continentalName.value=continentalNameForSetting;
	 };
	 
	 if(lineupForSetting != null){
		 document.lineup.value=lineupForSetting;
	 } */
	 
	 $("#continentalName > option[value="+'<c:out value="${ param.continentalName }"/>'+"]").attr("selected","selected");
	 $("#lineup > option[value="+'<c:out value="${ param.lineup }"/>'+"]").attr("selected","selected");
		 
 });
</script>
<body class="container-blue2">
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
		<div class="container">
			<div class="row">
				<div class="span12 centered">
					<h2 class="wow bounceInLeft animated" style="visibility: visible;">
					TRAVEL BOARD</h2>
					<p class="subheader wow bounceInRight animated"
						style="visibility: visible;">
						UPLOAD YOUR TRAVEL LOG</p>
				</div>
			</div>
		</div>
<div id="rlist">
  
<table id="conti">
	<tr>
		<td>
			<select name="continentalName" id="continentalName">
				<option value="allContinental" 
					
				>
					대륙을 선택해 주세요
				</option>
				<option value="Asia">아시아</option>
				<option value="Europe">유럽</option>
				<option value="SouthAmerica">남아메리카</option>
				<option value="NorthAmerica">북아메리카</option>
				<option value="Oceania">오세아니아</option>
				<option value="Africa">아프리카</option>
			</select>
		</td>
		<td>
			<select name="lineup" id="lineup">
				<option value="default">정렬 기준을 선택해 주세요</option>
				<option value="recordHit">조회수</option>
				<option value="recommend">추천수</option>
				<option value="recordStartTime">등록일</option>
			</select>
		</td>
		<td><input type="button" id="reOrder" value="재정렬"/></td>
	</tr>
</table>

<table id="recordListTable">
	<tr>
		<th class="count">카테고리</th>
		<th class="count">추천수</th>		
		<th id="rtitle">제목</th>
		<th id="date">작성자</th>
		<th id="time">작성일자</th>
		<th class="count">조회수</th>
		
	</tr>
	<c:forEach items="${travelRecordList}" var="list">
		<c:if test="${list.openPublic!='false'}"> 
		<tr>
			<td>
				<c:forEach items="${list.continentalName }" var="conti" varStatus="status">
					${conti}<c:if test="${not status.last }">,</c:if>
				</c:forEach>
			</td>
			<td>${list.recommend }</td>	
			<td><a href="${pageContext.request.contextPath}/selectRecord.do?recordNum=${list.recordNum }">${list.recordTitle }</a></td>
			<td>${list.recordWriter }</td>
			<td>${list.recordStartTime }</td>
			<td>${list.recordHit }</td>
		</tr>
	</c:if>
	</c:forEach>
	
	<tr>
		<td colspan="7" align="center" id="paging">${pageLink }
			<form id="frm" method="post">
				<input type="hidden" name="pageNo" id="pageNo"/>
				<input type="hidden" name="continentalName" id="continentalForPage" value="${param.continentalName }"/>
				<input type="hidden" name="lineup" id="lineupForPage" value="${param.lineup}"/>
			</form>
		</td>
	</tr>
</table>
</div>
</body>