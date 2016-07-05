<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


</style>
<script type="text/javascript" src="./js/pageForRecord2.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
 $(function(){
	
	 $("#reOrder").click(function(){
		 location.replace("${pageContext.request.contextPath}/findTravelRecordList2.do?continentalName="+$('#continentalName').val()+"&lineup="+$('#lineup').val());
	 }); 
	
	 
 });
</script>
<body>

<div style="height: 70px;"></div>

<div style="color: white; text-align: center; font-size: 25px;">MY TRAVEL LIST</div>

<div style="height: 10px;"></div>

<div style="width:95%; height:100%; margin: 0 auto; background-color: white; border-radius:10px" id="media">

<table id="recordListTable">
	<tr bgcolor="orange">
		<td align="center" width="40px">번호</td>
		<td align="center" width="60px">카테고리</td>
		<td align="center" width="150px">제목</td>
		<td align="center" width="40px">추천</td>
		<td align="center">작성자</td>
	</tr>
	<c:forEach items="${travelRecordList}" var="list">
	<tr>
			<td align="center">${list.recordNum }</td>
			<td align="center">${list.continentalName }</td>
			<td><a href="${pageContext.request.contextPath}/selectRecord2.do?recordNum=${list.recordNum }">${list.recordTitle }</a></td>
			<td align="center">${list.recommend }</td>
			<td align="center">${list.recordWriter }
			<input type="hidden" value="${list.recordStartTime }">
			<input type="hidden" value="${list.recordHit }"></td>
			
			
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="7" align="center" id="paging">${pageLink }
			<form id="frm" method="post">
				<input type="hidden" name="pageNo" id="pageNo"/>
				<input type="hidden" name="continentalName" id="continentalForPage" value="${param.continentalName }"/>
				<input type="hidden" name="lineup" id="lineupForPage" value="${param.lineup }"/>
			</form>
		</td>
	</tr>
</table>

<table align="center">
	<tr>
		<td align="center">
			<select name="continentalName" id="continentalName">
				<option value="allContinental">지역 선택</option>
				<option value="Asia">아시아</option>
				<option value="Europe">유럽</option>
				<option value="SouthAmerica">남아메리카</option>
				<option value="NorthAmerica">북아메리카</option>
				<option value="Oceania">오세아니아</option>
				<option value="Africa">아프리카</option>
			</select>
		</td>
		<td align="center">
			<select name="lineup" id="lineup">
				<option value="default">정렬 기준 선택</option>
				<option value="recordHit">조회수</option>
				<option value="recommend">추천수</option>
				<option value="recordStartTime">등록일</option>
			</select>
		</td>
		<td align="center"><input type="button" id="reOrder" value="정렬"/></td>
	</tr>
</table>

</div>
</body>