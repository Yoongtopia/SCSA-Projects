<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var ok = $("<span class='glyphicon glyphicon-ok'>");
		var alert = $("<span class='ui-icon-alert'>");
		
		$("#joinModal").modal("show");
		$(".close-nori").click(function(){
			location.href="${pageContext.request.contextPath}/seoulnori.do";
		});
		
		$("#idChkBtn").click(function(){
			var alert = $("<span class='glyphicon glyphicon-ok'>");		
			$("#alert1").text("");
			if($("#email1").val()==""){
				$("#alert1").attr("value","false").css("color","green").append(alert.text("  이메일 주소를 입력해주세요"));
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
							$("#alert1").css("color","blue").append(ok.text("  사용가능한 이메일 주소입니다"));	
							$("#submitChk").attr("value","true");
							$("#nickname").focus();
						}else{
							$("#alert1").attr("value","false").css("color","red").append(alert.text("  이미 사용 중인 이메일 주소입니다"));
							$("#email1").focus();
						}
					}, "json");			
		});
		
		if($("#alert1").val()=="false"){
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
		
		$("#inputPassword2").blur(function(){
			if($("#inputPassword").val()!=$("#inputPassword2").val()){
				$("#alert2").attr("value","false").css("color","red").append(alert.text("  비밀번호를 다시 입력해주세요"));
				$("#inputPassword").focus();
			}else{	
				$("#alert2").text("");
			}	
		});
		
			
		$("#date").blur(function(){
			if($("#month").val()==2){
				if($("#date").val()==30||$("#date").val()==31){
					$("#alert3").attr("value","false").css("color","red").append(alert.text("  다시 선택해주세요"));
					$("#date").val("").focus();	
				} else{
					$("#alert3").text("");
				}
			} else if($("#month").val()==4||$("#month").val()==6||$("#month").val()==9||$("#month").val()==11){
				if($("#date").val()==31){
					$("#alert3").attr("value","false").css("color","red").append(alert.text("  다시 선택해주세요"));
					$("#date").val("").focus();
				} else{
					$("#alert3").text("");
				}
			} else {
				
				return true;
			}
		});
		
		$("#date").click(function(){
			$("#alert3").text("");
		});
			
	/* 	$("#date").click(function(){
			var year = $("#year").val();
			var month = $("#month").val();
			var date = $("#date").val();
			
			$("#birthday").val(year+month+date);
		});
			 */
				
		
		$("#email3").change(function(){
			if($("#email3 option:selected").val()==""){
				$("#email2").removeAttr("readonly");
		 		$("#email2").val("").focus();
		 	}else{
		  	$("#email2").val($("#email3>option:selected").val());
		 	};
		 });
	
			
	});
		
	
	//dialog
	$(document).on("hidden.bs.modal", function (e) {
	    $(e.target).removeData("bs.modal");
	});	

	//formCheck
	function formCheck(){
		var year = $("#year").val();
		var month = $("#month").val();
		var date = $("#date").val();
		
		
		
		$("#birthday").val(year+month+date);
		
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
				$("#inputPassword2").val()=="" ||  $("#birthday").val()=="" || 
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

/* seoulnori 시작 */

.close-nori {
  float: right;
  font-size: 21px;
  font-weight: bold;
  line-height: 1;
  color: #ffffff;
/*   text-shadow: 0 1px 0 #ffffff; */
/*   opacity: 0.2; */
  filter: alpha(opacity=20);
}

.close-nori:hover,
.close-nori:focus {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
  opacity: 0.5;
  filter: alpha(opacity=50);
}

button.close-nori {
  padding: 0;
  cursor: pointer;
  background: transparent;
  border: 0;
  -webkit-appearance: none;
}

.form-control-nori-join:focus {
  border-color: #FFFFFF;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
}

.input-group-nori-join {
  position: relative;
  display: table;
  border-collapse: separate;
  margin-bottom: 15px;
}

.input-group-nori-join.col {
  float: none;
  padding-right: 0;
  padding-left: 0;
}

.input-group-nori-join .form-control-nori-join {
  width: 100%;
  margin-bottom: 0;
}

.input-group-nori-join-lg > .form-control-nori-join,
.input-group-nori-join-lg > .input-group-nori-join-addon,
.input-group-nori-join-lg > .input-group-nori-join-btn > .btn {
  height: 45px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.33;
  border-radius: 2px; 
}

select.input-group-nori-join-lg > .form-control-nori-join,
select.input-group-nori-join-lg > .input-group-nori-join-addon,
select.input-group-nori-join-lg > .input-group-nori-join-btn > .btn {
  height: 45px;
  line-height: 45px;
}

textarea.input-group-nori-join-lg > .form-control-nori-join,
textarea.input-group-nori-join-lg > .input-group-nori-join-addon,
textarea.input-group-nori-join-lg > .input-group-nori-join-btn > .btn {
  height: auto;
}

.input-group-nori-join-sm > .form-control-nori-join,
.input-group-nori-join-sm > .input-group-nori-join-addon,
.input-group-nori-join-sm > .input-group-nori-join-btn > .btn {
  height: 30px;
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
  border-radius: 2px; 
}

select.input-group-nori-join-sm > .form-control-nori-join,
select.input-group-nori-join-sm > .input-group-nori-join-addon,
select.input-group-nori-join-sm > .input-group-nori-join-btn > .btn {
  height: 30px;
  line-height: 30px;
}

textarea.input-group-nori-join-sm > .form-control-nori-join,
textarea.input-group-nori-join-sm > .input-group-nori-join-addon,
textarea.input-group-nori-join-sm > .input-group-nori-join-btn > .btn {
  height: auto;
}

.input-group-nori-join-addon,
.input-group-nori-join-btn,
.input-group-nori-join .form-control-nori-join {
  display: table-cell;
}

.input-group-nori-join-addon:not(:first-child):not(:last-child),
.input-group-nori-join-btn:not(:first-child):not(:last-child),
.input-group-nori-join .form-control-nori-join:not(:first-child):not(:last-child) {
  border-radius: 0;
} 

.input-group-nori-join-addon,
.input-group-nori-join-btn {
  width: 1%;
  white-space: nowrap;
  vertical-align: middle;
}

.input-group-nori-join-addon {
  padding: 6px 12px;
  font-size: 14px;
  font-weight: normal;
  line-height: 1;
  text-align: center;
  background-color: #eeeeee;
  border: 1px solid #cccccc;
  border-radius: 2px; 
}

.input-group-nori-join-addon.input-sm {
  padding: 5px 10px;
  font-size: 12px;
  border-radius: 2px; 
}

.input-group-nori-join-addon.input-lg {
  padding: 10px 16px;
  font-size: 18px;
   border-radius: 2px; 
}

.input-group-nori-join-addon input[type="radio"],
.input-group-nori-join-addon input[type="checkbox"] {
  margin-top: 0;
}

.input-group-nori-join .form-control-nori-join:first-child,
.input-group-nori-join-addon:first-child,
.input-group-nori-join-btn:first-child > .btn,
.input-group-nori-join-btn:first-child > .dropdown-toggle,
.input-group-nori-join-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
} 

.input-group-nori-join-addon:first-child {
  border-right: 0;
}

.input-group-nori-join .form-control-nori-join:last-child,
.input-group-nori-join-addon:last-child,
.input-group-nori-join-btn:last-child > .btn,
.input-group-nori-join-btn:last-child > .dropdown-toggle,
.input-group-nori-join-btn:first-child > .btn:not(:first-child) {
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
} 

.input-group-nori-join-addon:last-child {
  border-left: 0;
}

.input-group-nori-join-btn {
  position: relative;
  white-space: nowrap;
}

.input-group-nori-join-btn > .btn {
  position: relative;
}

.input-group-nori-join-btn > .btn + .btn {
  margin-left: -4px;
}

.input-group-nori-join-btn > .btn:hover,
.input-group-nori-join-btn > .btn:active {
  z-index: 2;
}


/* seoulnori 끝 */

.form-control-nori-join:-moz-placeholder {
  color: #999999;
}

.form-control-nori-join::-moz-placeholder {
  color: #999999;
}

.form-control-nori-join:-ms-input-placeholder {
  color: #999999;
}

.form-control-nori-join::-webkit-input-placeholder {
  color: #999999;
}

.form-control-nori-join {
  display: inline-block;
  width: 100%;
  height: 34px;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.428571429;
  color: #555555;
  vertical-align: middle;
  background-color: #ffffff;
  border: 1px solid #cccccc;
  border-radius: 2px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
          transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.form-control-nori-join-border {
  display: inline-block;
  width: 100%;
  height: 34px;
  padding: 6px 12px 0 12px;
  font-size: 14px;
  line-height: 1.428571429;
  color: #555555;
  vertical-align: middle;
  background-color: #ffffff;
  border: 1px solid #cccccc;
  border-left: 0;
  border-radius-top-right: 2px;
  border-radius-bottom-right: 2px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
          transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.form-control-nori-join:focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6);
}


</style>

</head>

<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-5">

		<h2 style="margin-bottom: 20px;">
			JOIN US
		</h2>
<form id="form" method="post" action="${pageContext.request.contextPath}/member_join.do" >


<div id="joinForm">
	<label>이메일(아이디)<span style="color: red;">*</span></label><br/>
 	<div class="input-group-nori-join" >
 	    <span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-mail-open"></span></span>
	  	<input type="text" id="email1" class="form-control-nori-join" style="border-right: 0; border-left:0;" name="email1" value="" placeholder="email">
		<span class="input-group-nori-join-addon" style="border-right: 0; border-left:0;padding:6px 5px;">@</span>
		<input id="email2"  class="form-control-nori-join" style="border-right: 0; border-left:0;" name="email2" readonly="readonly"  placeholder="xxxx.xxx"value="" type="text" >
		<span class="input-group-nori-join-addon" style="border-right: 0; border-left:0;background-color:#ffffff;padding:6px 0;"></span>
		<select id="email3"  class="form-control-nori-join"  style="border-right: 0;">
			<option value="" >이메일 선택</option>
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
		<span class="input-group-nori-join-btn" >
       		<input type="button" class="btn btn-default" id="idChkBtn" value="중복체크" >
       	</span>
	</div>
	<label for="nickname" >닉네임<span style="color: red;">*</span></label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-person"></span></span>
	  	<input type="text" class="form-control-nori-join" style="border-left:0;"  id="nickname" value="" name="nickname" placeholder="닉네임"/>
	</div>
	<label for="password" >비밀번호<span style="color: red;">*</span></label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-locked"></span></span>
	  	<input type="password" class="form-control-nori-join" style="border-left:0;" id="inputPassword" value="" name="password" placeholder="*********">
	</div>
	<label for="password" >비밀번호 확인<span style="color: red;">*</span></label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-locked"></span></span>
	  	<input type="password" class="form-control-nori-join"  style="border-left:0;" id="inputPassword2" value="" placeholder="******" >
	</div>
	<label>생년월일<span style="color: red;">*</span></label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-calendar"></span></span>
  		<select class="form-control-nori-join"  id="year" value="" name="year"  style="border-right: 0;">
	  		<c:forEach begin="1930" end="2014" var="a">
	  			<option value="${a}">${a}</option>
	  		</c:forEach>
	  	</select>
	  	<!-- <input type="text" class="form-control-nori-join"  style="border-right: 0; border-left:0;text-align:right;" id="year" value="" name="year" maxlength="4"  placeholder="YYYY"/> -->
	  	<span class="input-group-nori-join-addon" style="border-right: 0;border-left:0;">년</span>
	  	<select class="form-control-nori-join"  id="month" value="" name="month"  style="border-right: 0;">
	  		<c:forEach begin="1" end="12" varStatus="status">
	  			<option value="${status.count }">${status.count }</option>
	  		</c:forEach>
	  	</select>
	  <!-- 	<input type="text" class="form-control-nori-join"  style="border-right: 0; border-left:0;text-align:right;" id="month" value="" name="month" maxlength="2" placeholder="MM"/> -->
	  	<span class="input-group-nori-join-addon" style="border-right: 0;border-left:0;">월</span>
        <select class="form-control-nori-join"  id="date" value="" name="date"  style="border-right: 0;">
	  		<c:forEach begin="1" end="31" varStatus="status">
	  			<option value="${status.count }">${status.count }</option>
	  		</c:forEach>
	  	</select>
       <!--  <input type="text" class="form-control-nori-join"  style="border-right: 0; border-left:0;text-align:right;" id="date" value="" name="date" maxlength="2" placeholder="DD"/> -->
        <span class="input-group-nori-join-addon" >일</span>
	</div>
	<label>성별<span style="color: red;">*</span></label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-pin-s"></span></span>
	  	<span class="form-control-nori-join-border" >
	  	<input type="radio" id="man" value="1" name="gender"  class="gender"  /> &nbsp;<label>남성</label> &nbsp;&nbsp;&nbsp;
        <input type="radio" id="woman" value="2" name="gender"  class="gender"  /> &nbsp;<label>여성</label>
        </span>
	</div>
	<label>결혼정보<span style="color: red;">*</span></label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-heart"></span></span>
		<span class="form-control-nori-join-border" >
	  	<input type="radio" id="single" value="미혼" name="marriage" class="marriage" /> &nbsp;<label>미혼</label>&nbsp;&nbsp;&nbsp;
      <input type="radio" id="married" value="기혼" name="marriage" class="marriage"  /> &nbsp;<label>기혼</label>
      </span>
	</div>
	<label>자녀정보</label><br/>
	<div class="input-group-nori-join">
		<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-plus"></span></span>
		<span class="form-control-nori-join-border" >
	  	<input type="radio" id="withC" value="자녀없음" name="children" class="children"  checked="checked" /> &nbsp;없음 &nbsp;&nbsp;&nbsp;
      <input type="radio" id="withoutC" value="자녀있음" name="children" class="children"  /> &nbsp;있음
      </span>
	</div>

	<br/>
	</div>
	
	<div id="findEventArea">
		<label>담당 행사<span style="color: red;">*</span></label>
		<div class="input-group-nori-join" >
			<span class="input-group-nori-join-addon" style="border-right: 0;"><span class="ui-icon ui-icon-flag"></span></span>
			<input type="text" id="eventTitle" value="" name="eventTitle" readonly="readonly"  class="form-control-nori-join" style="border-right: 0; border-left:0; ">
			<span class="input-group-nori-join-btn" >
				<input type="button" class="btn btn-default" id="findEvent" value="행사찾기" style="border-radius: 0;"/>
			</span>
		</div>		
	</div>
	<table>
		<tr>
			<td>
				<input type="button" onclick="formCheck();" class="btn btn-default" value="회원가입" >
				<input type="hidden" id="inputUserId" name="userId" value="">
				<input type="hidden" id="birthday" name="birthday" value="">
				<input type="hidden" id="memberType" name="memberType" value="">
				<input type="hidden" id="eventId" name="eventId" value="">
				<input type="hidden" id="memberStatus" name="memberStatus" value="">
				<input type="hidden" id="memberStamp" name="memberStamp" value="">
			</td>
		</tr>
	</table>
	<br/><br/>
	
</form>
</div>
	<div class="col-md-3" >
		<p id="alert1" style="margin-top:105px;"></p>
		<p id="alert2" style="margin-top:250px;"></p>
		<p id="alert3" style="margin-top:400px;"></p>
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