<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
		margin-left:340px;
		background-color: white;
		
	}
	
	#update td{
		width:500px;
		height:40px;
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
		height: 50px;
	}	
</style>
<script type="text/javascript">
	function formCheck(){
		// 비밀번호 입력했는지 체크
		if($("#password").val()==""||$("#password").val()==null){
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		
		//비밀번호 길이가 충분한지 체크
		if($("#password").val().length <5 || $("#password").val().length >15){
			alert("비밀번호의 길이는 6자 이상 14자 이하입니다");
			$("#password").focus();
			return false;
		}
		
		//비밀번호 확인창 입력했는지 체크
		if($("#password2").val()==""||$("#password2").val()==null){
			alert("비밀번호 확인 창을 입력해 주세요");
			$("#password2").focus();
			return false;
		}
		
		//비밀번호창과 확인창 일치하는지 체크
		if($("#password").val()!=$("#password2").val()){
			alert("비밀번호가 일치 하지 않습니다.");
			$("#password2").val("");
			$("#password2").focus();
			return false;
		}
		
		//이름 입력했는지 체크
		if($("#memberName").val()==""||$("#memberName").val()==null){
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		
		//전화번호 입력했는지 체크
		if($("#memberPhone").val()==""||$("#memberPhone").val()==null){
			alert("전화번호를 입력해 주세요");
			$("#memberPhone").focus();
			return false;
		}
		
		//전화번호 숫자로만 입력했는지 체크
		if(isNaN($("#memberPhone").val())){
			alert("전화번호는 숫자로만 입력해 주세요");
			$("#memberPhone").focus();
			return false;
		}
		
		//전화번호 길이가 적합한지 체크
		if($("#memberPhone").val().length >12 || $("#memberPhone").val().length <9){
			alert("전화번호를 확인해 주세요. 너무 길거나 짧습니다.");
			$("#memberPhone").focus();
			return false;
		}
		
		//이메일 입력했는지 체크
		if($("#memberEmail").val()==""||$("#memberEmail").val()==null){
			alert("메일 주소를 입력해 주세요");
			$("#memberEmail").focus();
			return false;
		}
		
		//이메일 형식이 일치하는지 체크
		var email = $("#memberEmail").val();
	    var atpos = email.indexOf("@");
	    var dotpos = email.lastIndexOf(".");
	    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=email.length) {
	        alert("이메일 주소가 유효하지 않습니다");
	        return false;
	    }
	    
		return true;
	}

</script>
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
					<h2 class="wow bounceInLeft animated" style="visibility: visible;font-family: 'Nanum Gothic';">
					내 정보수정</h2>
				</div>
			</div>
		</div>

<form method="post" action="${pageContext.request.contextPath}/updateMember.do" onsubmit="return formCheck()">
<table id="update">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="memberId" id="memberId" value="${member.memberId}" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="password" id="password" value="${member.password}"/>
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
			<input type="password" name="password2" id="password2" value="${member.password}"/>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="memberName" id="memberName" value="${member.memberName}"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="memberEmail" id="memberEmail" value="${member.memberEmail}"/></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td><input type="text" name="memberPhone" id="memberPhone" value="${member.memberPhone}"/></td>
	</tr>
	<tr>
		<th>등급</th>
		<td>
			<input type="text" name="memberRank" id="memberRank" value="${member.memberRank}" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정">
			<a href="updateMember.do"><button>마이페이지</button></a>
			<input type="hidden" name="memberStatus" value="${member.memberStatus}"/>	
		</td>
	<tr>
</table>
</form>
</body>