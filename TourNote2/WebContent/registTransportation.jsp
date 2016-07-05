<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript">
	$(function(){
		$("#registTransportation").click(function(){
			var registForm=document.registForm;
			registForm.action="${pageContext.request.contextPath}/registTransportationByAdmin.do";
			registForm.submit();
		});
		
		$("#returnManagerPage").click(function(){
			var registForm=document.registForm;
			registForm.action="${pageContext.request.contextPath}/goManagerPage.do";
			registForm.submit();
		});
	});
	
	
	function registCheck(){
		if($("#transportationName").val()==null || $("#transportationName").val()==""){
			alert("교통수단 이름을 입력해 주세요");
			$("#transportationName").focus();
			return false;
		}
		
		if($("#countryName").val()==null || $("#countryName").val()==""){
			alert("국가명을 입력해 주세요");
			$("#countryName").focus();
			return false;
		}
		return true;
	};
</script>
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

	#update {
		text-align:center;
    	font-family: 'Nanum Gothic';
		color:black;
		margin-bottom: 100px;
		margin-left:350px;
		background-color: white;
		
	}
	
	#update td{
		width:500px;
		height:30px;
		border-bottom: 1px solid silver;
	}
	
	#cont {
		height:500px;
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
</style>

<body class="container-mint">
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
				<div class="span12 centered">
				<br><br>
					<h2 class="wow bounceInLeft animated" style="visibility: visible;  font-family: 'Nanum Gothic';">
					교통정보 등록</h2>
				</div>
			</div>
		</div>

<form method="post" name="registForm" onsubmit="return registCheck()">
<table id="update">
	<tr>
		<th>교통수단타입</th>
		<td>
			<select name="transportationType">
				<option value="airplane">비행기</option>
				<option value="train">기차</option>
				<option value="bus">버스</option>
				<option value="ship">배</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>교통수단 이름</th>
		<td><input type="text" name="transportationName" id="transportationName"/></td>
	</tr>
	<tr>
		<th>국가명</th>
		<td><input type="text" name="countryName" id="countryName"/></td>
	</tr>
	<tr>
		<th>도시명</th>
		<td><input type="text" name="cityName" id="cityName"/></td>
	</tr>
	<tr>
		<th>링크</th>
		<td><input type="text" name="link"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="registTransportation" value="등록"/>
			<button id="returnManagerPage">돌아가기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>