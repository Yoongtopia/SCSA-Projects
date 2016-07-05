<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#member").change(function(){
		$("#joinForm").show();
		$("#findEventArea").hide();
	});
	
	$("#eventManager").change(function(){
		$("#findEventArea").show();
		$("#joinForm").show();
	});
	
	$("#findEvent").click(function(){
		open("view_test_member/popupTest.jsp", "행사 찾기", "width=400, height=200,left=300,top=70");//새창사이즈
		return false;
	});
	
	$("#eventManager").click(function(){
		open("view_test_member/event_manager_check.jsp", "행사담당자인증", "width=400, height=200,left=300,top=70");//새창사이즈
		return false;
	});
	
	$("#event").blur(function(){
		if($("#event").val()==""){
			$("#alert1").text("담당 행사를 선택해주세요");
			$("#event").val("").focus();
		}
		
	});
	
	
	$("#password2").blur(function(){
		if($("#password").val()==$("#password2").val()){
		}else{	
			$("#alert3").text("비밀번호를 다시 입력해주세요");
		}	
	});
	
	$("#year").blur(function(){
		if(isNaN($("#year").val())){
			alert("숫자만 입력가능합니다.");
		}else if($("#year").val()<1900 || $("#year").val()>2014){
			alert("유효하지 않은 값입니다.");
		}
	});
	
	
	$("#month").blur(function(){
		if(isNaN($("#month").val())){
			alert("숫자만 입력가능합니다.");
		}else if($("#month").val()<1 || $("#month").val()>12){
			alert("유효하지 않은 값입니다.");
		}
	});
	
	
	$("#date").blur(function(){
		var year = $("#year").val();
		var month = $("#month").val();
		var date = $("#date").val();
		
		if(isNaN($("#date").val())){
			alert("숫자만 입력가능합니다.");
		}else if($("#date").val()<1 || $("#date").val()>32){
			alert("유효하지 않은 값입니다.");
		}else if($("#date").val()<10){
			date="0"+$("#date").val();
		}
		$("#birthday").val(year+month+date);
	});
	
	$("#email3").change(function(){
		if($("select>option:selected").val()==""){
	 		$("#email2").removeAttr("readonly");
	 		$("#email2").val("");
	 	}else{
	  	$("#email2").val($("select>option:selected").val());
	 	};
	 });

	$("#email3").blur(function(){
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		var email3 = $("#email3").val();
		if(email2==null){
			$("#userId").val(email1+"@"+email3);
			alert($("#userId").val());
		} else {
			$("#userId").val(email1+"@"+email2);
		}
		
	});
	
});

</script>

<style>
#findEventArea, #joinForm {
 display: none;
}
</style>

</head>

<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
		<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
			<img src="../images/test/exhibition.jpg" width="853px" />
		</div>
		<h2 style="margin-bottom: 20px;">
			JOIN US
		</h2>
<form method="post" action="${pageContext.request.contextPath}/member_join.do">
<div id="selectMemberTypeArea">
<table class="table table-bordered" style="width: 853px;">
 <tr>
  <td>
  	<input type="radio" id="member" value="member" name="memberType" />
  	  <label>일반회원</label>
      <input type="radio" id="eventManager" value="eventManager" name="memberType" />
      <label>행사 담당자</label>
  </td>
 </tr>
</table>
</div>
<div id="findEventArea">
<table class="table table-bordered" style="width: 853px;">
 <tr>
  <td><label>담당 행사</label></td>
  <td><input type="text" id="event" value="" name="eventId" readonly="readonly"/>
  <button id="findEvent">행사찾기</button>
   <span id="alert1"></span>
  </td>
 </tr>
</table>
</div>
<div id="joinForm">
<table  class="table table-bordered" style="width: 853px;">
 <tr>
  <td><label>Email(ID)</label></td>
  <td><input id="email1" class="form-control"  name="email1" value="" type="text" >@
	<input id="email2"  class="form-control" name="email2" readonly="readonly" value="" type="text" > 
	<select id="email3">
		<option value="" >- 이메일 선택 -</option>
		<option value="naver.com">naver.com</option>
		<option value="daum.net">daum.net</option>
		<option value="nate.com">nate.com</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="yahoo.com">yahoo.com</option>
		<option value="empas.com">empas.com</option>
		<option value="korea.com">korea.com</option>
		<option value="dreamwiz.com">dreamwiz.com</option>
		<option value="gmail.com">gmail.com</option>
		<option value="" >직접입력</option>
	</select>
   <span id="alert2"></span></td>
 </tr>
 <tr>
  <td><label>닉네임(이름)</label></td>
  <td><input type="text" class="form-control"  id="nickname" value="" name="nickname" /></td>
 </tr>
 <tr>
  <td><label>비밀번호</label></td>
  <td><input type="password" class="form-control" id="password" value="" name="password" /></td>
 </tr>
 <tr>
  <td><label>비밀번호 확인</label></td>
  <td><input type="password" class="form-control"  id="password2" value="" />
  <span id="alert3"></span></td>
 </tr>
 <tr>
  <td><label>생년월일</label></td>
  <td><input type="text" class="form-control"  id="year" value="" name="year" maxlength="4" />년
      <input type="text" class="form-control"  id="month" value="" name="month" maxlength="2" />월
      <input type="text" class="form-control"  id="date" value="" name="date" maxlength="2" />일
  </td>
 <tr>
  <td><label>성별</label></td>
  <td><input type="radio" id="man" value="1" name="gender" /><label>남자</label>
      <input type="radio" id="woman" value="2" name="gender" /><label>여자</label>
  </td>
 </tr>
 <tr>
  <td><label>결혼정보</label></td>
  <td><input type="radio" id="single" value="미혼" name="marriage" /><label>미혼</label>
      <input type="radio" id="married" value="기혼" name="marriage" /><label>기혼</label>
  </td>
 </tr>
 <tr>
  <td><label>자녀정보</label></td>
  <td><input type="radio" id="withC" value="자녀있음" name="children" checked="checked" />없음
      <input type="radio" id="withoutC" value="자녀없음" name="children" />있음
  </td>
 </tr>
</table>

<table>
<tr>
<td>
<input type="submit" id="joinBtn" class="btn btn-default"value="회원가입">
<input type="hidden" id="userId" name="userId" value="">
<input type="hidden" id="birthday" name="birthday" value="">
<a href="${pageContext.request.contextPath}/member_list.do">
<input type="button" class="btn btn-default" value="리스트보기"></a>
</td>
</tr>
</table>
</div>
</form>
</div>
	<div class="col-md-2"></div>

</div>

</body>
</html>