<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
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

	#update {
		text-align:center;
    	font-family: 'Nanum Gothic';
		color:black;
		background-color: white;		
	}
	
	a{
		color:black;
	}
	
	th{
		text-align:center;
		background-color: #39ABB9;
		color:white;
		width:90px;
		height: 30px;
	}	

</style>

<body>

<div style="width:90%; height:100%; text-align: center;" id="media">
<form method="post" action="${pageContext.request.contextPath}/updateMember2.do">
<div style="height: 130px;"></div>

<div style="width:100%; color: white; font-size: 30px; text-align: center; margin-left: 20px;">MY INFO</div>

<div style="height: 20px;"></div>

<div style="width:100%; margin-left: 35px;">


<table id="update">
	<tr>
		<th>아이디</th>
		<td width="200px" height="30px">
			<input type="text" name="memberId" value="${member.memberId}"/>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td width="200px" height="30px">
			<input type="password" name="password" value="${member.password}"/>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td width="200px" height="30px">
		<input type="text" name="memberName" value="${member.memberName}"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td width="200px" height="30px">
		<input type="text" name="memberEmail" value="${member.memberEmail}"/></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td width="200px" height="30px">
		<input type="text" name="memberPhone" value="${member.memberPhone}"/></td>
	</tr>
	<tr>
		<th>등급</th>
		<td width="200px" height="30px">
			<input type="text" name="memberRank" value="${member.memberRank}" readonly="readonly"/>
		</td>
	</tr>

</table>

<div style="height: 30px;"></div>

<div style="width: 100%; text-align: center; margin-left: 30px;">

<table>
<tr>
<td width="70px">
<input type="hidden" name="memberStatus" value="${member.memberStatus}"/>
<input type="image" width="70px" src="./images/app_etc/app_modify.png"/>
</td>
<td width="20px"></td>
<td width="70px">
<a href="./app_myPage.jsp">
<img width="100px" src="./images/app_etc/app_back.png"/>
</a></td>
</tr>
</table>

</div>

</div>

</form>
</div>
</body>