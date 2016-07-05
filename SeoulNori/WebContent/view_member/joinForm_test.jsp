<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		
		$("#joinModal").modal("show");
		$(".close-nori").click(function(){
			location.href="${pageContext.request.contextPath}/seoulnori.do";
		});
		
		$("#idChkBtn").click(function(){
					
			if($("#email1").val()==""){
				$("#alert2").attr("value","false").css("color","green").text("이메일 주소를 입력해주세요");
				$("#email1").focus();
				return false;
			}
			
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var email3 = $("#email3").val();
			
			//선택입력
			if(email2==null){
				$("#inputUserId").val(email1+"@"+email3);
			} else {
				$("#inputUserId").val(email1+"@"+email2);
			}
		 		 	
			$.post("${pageContext.request.contextPath}/id_check.do",
					{"userId":$("#inputUserId").val()},
					function(jsonObj){
						if(jsonObj.status){
							$("#alert2").css("color","blue").text("사용가능한 이메일 주소입니다");	
							$("#submitChk").attr("value","true");
							$("#nickname").focus();
						}else{
							$("#alert2").attr("value","false").css("color","red").text("이미 사용 중인 이메일 주소입니다");
							$("#email1").focus();
						}
					}, "json");			
		});
		
		if($("#alert2").val()=="false"){
			$("#email1").focus();
		}
		
			
		$(".member").click(function(){
			$("#joinModal").modal("hide");
			$("#joinForm").show();
			$("#findEventArea").hide();
			$("#memberType").val("member");
			$("#memberStatus").val("승인");
		});
		
		$(".manager").click(function(){
			$("#joinModal").modal("hide");
			$("#findEventArea").show();
			$("#joinForm").show();
			$("#memberType").val("manager");
			$("#memberStatus").val("대기");
		});
		
		$("#findEvent").click(function(){
			open("view_member/joinform_popup.jsp", "행사 찾기", "width=400, height=200,left=300,top=70");//새창사이즈
			return false;
		});
		
			
		$("#event").blur(function(){
			if($("#event").val()==""){
				$("#alert1").text("담당 행사를 선택해주세요");
				$("#event").val("").focus();
			}
			
		});
		
		
		$("#inputPassword2").blur(function(){
			if($("#inputPassword").val()!=$("#inputPassword2").val()){
				$("#alert3").text("비밀번호를 다시 입력해주세요");
			}else{	
				$("#alert3").text("").focus();
			}	
		});
		
		$("#year").blur(function(){
			if(isNaN($("#year").val())){
				alert("숫자만 입력가능합니다.");
				$("#year").val("").focus();
			}else if($("#year").val()<1900 || $("#year").val()>2014){
				alert("유효하지 않은 값입니다.");
				$("#year").val("").focus();
			}
			
		});
			
		$("#month").blur(function(){
			if(isNaN($("#month").val())){
				alert("숫자만 입력가능합니다.");
				$("#month").val("").focus();
			}else if($("#month").val()<1 || $("#month").val()>12){
				alert("유효하지 않은 값입니다.");
				$("#month").val("").focus();
			}
		
		});
		
		
		$("#date").blur(function(){
			
			if(isNaN($("#date").val())){
				alert("숫자만 입력가능합니다.");
				$("#date").val("").focus();
			}else if($("#date").val()<1 || $("#date").val()>32){
				alert("유효하지 않은 값입니다.");
				$("#date").val("").focus();
			}
			
		});
		
		$("#email3").change(function(){
			if($("#email3 option:selected").val()==""){
				$("#email2").removeAttr("readonly");
		 		$("#email2").val("").focus();
		 	}else{
		  	$("#email2").val($("#email3>option:selected").val());
		 	};
		 });
	
		$("#date").blur(function(){
			var year = $("#year").val();
			var month = $("#month").val();
			var date = $("#date").val();
			
			if($("#date").val()<10){
				date="0"+$("#date").val();
			} 
			if($("#month").val()<10){
				month="0"+$("#month").val();
			}
			$("#birthday").val(year+month+date);
		
		});
		
		
		
	});
		
	
	//dialog
	$(document).on("hidden.bs.modal", function (e) {
	    $(e.target).removeData("bs.modal");
	});	

	//formCheck
	function formCheck(){
		if($("#memberType").val()=="manager"){
			if($("#eventId").val()==""){
				alert("행사를 선택하셔야합니다");
				return false;
			}
		}
		if($("#submitChk").val()=="false"){
			alert("아이디 중복 체크를 해주세요");
		}else{	
			if( $("#nickname").val()=="" || $("#inputPassword").val()=="" ||
				$("#inputPassword2").val()=="" || $("#birthday").val()=="" || 
				$(".gender> radio:checked").val()=="" || $(".marriage> radio:checked").val()=="" ||
				$(".children> radio:checked").val()==""){
				alert("빠짐없이 입력하셔야합니다");
				return false;
			} else {
				$("#form").submit();
			}
		}
				
	}
	
	
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

		<h2 style="margin-bottom: 20px;">
			JOIN US
		</h2>
<form id="form" method="post" action="${pageContext.request.contextPath}/member_join.do" >

<div id="findEventArea">
<table class="table table-bordered" style="width: 853px;" >
 <tr>
  <td><label>담당 행사<span style="color: red;">*</span></label></td>
  <td><input type="text" class="form-control" id="eventTitle" value="" name="eventTitle" readonly="readonly" style="width: 180px; display:inline-block"/>
  <button class="btn btn-default" id="findEvent" style="display:inline-block">행사찾기</button>
   <span id="alert1"></span>
  </td>
 </tr>
</table>
</div>
<div id="joinForm">
<table  class="table table-bordered" style="width: 853px;">
 <tr>
  <td><label>이메일(아이디))<span style="color: red;">*</span></label></td>
  <td><input id="email1" class="form-control"  name="email1" value="" type="text" style="width: 180px; display:inline-block" placeholder="이메일">
  	<span style="vertical-align: bottom;">@</span>
	<input id="email2"  class="form-control" name="email2" readonly="readonly" value="" type="text" style="width: 180px; display:inline-block"  > 
	<select id="email3"  class="form-control" style="width: 180px; display:inline-block" >
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
   <input type="button" class="btn btn-default" id="idChkBtn" value="중복체크">
   <span id="alert2"></span>
   <input type="hidden" id="submitChk" value="false"/>
   </td>
 </tr>
 <tr>
  <td><label>닉네임<span style="color: red;">*</span></label></td>
  <td><input type="text" class="form-control"  id="nickname" value="" name="nickname" placeholder="닉네임"/></td>
 </tr>
 <tr>
  <td><label>비밀번호<span style="color: red;">*</span></label></td>
  <td><input type="password" class="form-control" id="inputPassword" value="" name="password" placeholder="******"/></td>
 </tr>
 <tr>
  <td><label>비밀번호확인<span style="color: red;">*</span></label></td>
  <td><input type="password" class="form-control"  id="inputPassword2" value="" placeholder="******" />
  <span id="alert3"></span></td>
 </tr>
 <tr>
  <td><label>생년월일<span style="color: red;">*</span></label></td>
  <td><input type="text" class="form-control"  id="year" value="" name="year" maxlength="4" style="width: 80px; display:inline-block" placeholder="YYYY" /><span style="vertical-align: bottom;">년</span>&nbsp;
      <input type="text" class="form-control"  id="month" value="" name="month" maxlength="2" style="width: 80px; display:inline-block" placeholder="MM"/><span style="vertical-align: bottom;">월</span>&nbsp;
      <input type="text" class="form-control"  id="date" value="" name="date" maxlength="2" style="width: 80px; display:inline-block" placeholder="DD"/><span style="vertical-align: bottom;">일</span>&nbsp;
  </td>
 <tr>
  <td><label>성별<span style="color: red;">*</span></label></td>
  <td><input type="radio" id="man" value="1" name="gender"  class="gender"  /> &nbsp;<label>남성</label> &nbsp;&nbsp;&nbsp;
      <input type="radio" id="woman" value="2" name="gender"  class="gender"  /> &nbsp;<label>여성</label>
  </td>
 </tr>
 <tr>
  <td><label>결혼정보</label></td>
  <td><input type="radio" id="single" value="미혼" name="marriage" class="marriage" /> &nbsp;<label>미혼</label>&nbsp;&nbsp;&nbsp;
      <input type="radio" id="married" value="기혼" name="marriage" class="marriage"  /> &nbsp;<label>기혼</label>
  </td>
 </tr>
 <tr>
  <td><label>자녀정보</label></td>
  <td><input type="radio" id="withC" value="자녀없음" name="children" class="children"  checked="checked" /> &nbsp;없음 &nbsp;&nbsp;&nbsp;
      <input type="radio" id="withoutC" value="자녀있음" name="children" class="children"  /> &nbsp;있음
  </td>
 </tr>
</table>

<table>
<tr>
<td>
<input type="button" onclick="formCheck();" class="btn btn-default" value="회원가입">
<input type="hidden" id="inputUserId" name="userId" value="">
<input type="hidden" id="birthday" name="birthday" value="">
<input type="hidden" id="memberType" name="memberType" value="">
<input type="hidden" id="eventId" name="eventId" value="">
<input type="hidden" id="memberStatus" name="memberStatus" value="">
</td>
</tr>
</table>
</div>
</form>
</div>
	<div class="col-md-2"></div>
</div>

<!-- Modal -->
	<div class="modal-nori fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" aria-hidden="true">
	  <div class="modal-nori-dialog" style="t:height:auto;">
	    <div class="modal-nori-content" style="height:auto;">
	       <div class="modal-nori-header">
	        <button type="button" class="close-nori" data-dismiss="modal" aria-hidden="true">&times;</button>
	       <span>JOIN US</span>
	       </div>
	      <div class="modal-nori-body" contenteditable="false">
	      	<div class="form-group">
	      	<table align="center" width="300px">
		      	<tr height="50px">
			      	<td width="100px" align="center"><br/>
			      	<img width="85px" class="member" style="cursor: pointer;" src="${pageContext.request.contextPath}/images/join/member_icon.png" class="member" value="member" name="memberType" >
			      	<br/><br/><span class="member" style="cursor: pointer;">일반회원</span></td>
					<td width="100px" align="center"><br/>
					<img width="85px" class="manager" style="cursor: pointer;" src="${pageContext.request.contextPath}/images/join/manager_icon.png" class="manager" value="manager" name="memberType" >
					<br/><br/><span class="manager" style="cursor: pointer;">행사담당자</span></td>	
		 	</table>
			</div>
		 </div>	
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>