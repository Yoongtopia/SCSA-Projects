<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
// 윈도우 창을 닫을 때 로그아웃 처리
   function closePage( event ){
      if( event.clientY < 0 ){
         location.href= "logout.scse";
      }
   }
 
   document.onkeydown = function() {
       // 새로고침 방지 ( Ctrl+R, Ctrl+N, F5 )
       if ( event.ctrlKey == true && ( event.keyCode == 78 || event.keyCode == 82 ) || event.keyCode == 116) {
            event.keyCode = 0;
            event.cancelBubble = true;
            event.returnValue = false;
            
       }
 
       // 창 닫기( Alt+F4 ) 방지 
       if ( event.altKey == true && (event.keyCode == 115)) { // F4 눌렀을 시
    	   event.keyCode = 0;
           event.cancelBubble = true;
           event.returnValue = false;
       }
 
       // 윈도우 창이 닫힐 경우
       if (event.keyCode == 505) { 
    	   location.href= "logout.scse";
      }
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.fullPage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/sui/javascript/semantic.js"></script>
<script type="text/javascript" src="assets/sui/javascript/jquery.address.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<link rel="stylesheet" href="assets/css/flick/jquery-ui-1.10.4.custom.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
*{
font-family: "Nanum Gothic", Calibri;
}
td{
	text-align: center;
	align: center;
	
}
</style>

<script type="text/javascript">
	//폼체크
 	function formCheck(){
		
 		$("#idFormCheck").hide();
 		$("#passwordFormCheck").hide();
		if($("#userIdforLogin").val()==""){
			$("#idFormCheck").show();
			return false;
		}
		if($("#passwordforLogin").val()==""){
			$("#passwordFormCheck").show();
			return false;
		}
		
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".dropdown").dropdown();
		$("#loadingLogin").hide();
		$("#idFormCheck").hide();
		$("#passwordFormCheck").hide();
		$("#loginGo").on("click", function() {
			$('#loginForm').modal('setting', {
				onDeny : function() {
					return false;
				},
				onApprove : function() {
					return false;
				}
			}).modal('show');
		});

		$("#registerGo").on("click", function() {
			$("#registerChoice").modal("show");
		});

		//엔터치면 로그인 되는 함수
        $(document).keypress(function(event){  // i called a clicked event in document here you can chnage it to any other event like.. input field keyup event or so....
           var keycode = (event.keyCode ? event.keyCode : event.which);
           if(keycode == '13'){
            	$('#loginSubmit').trigger('click');   
           }
        }); 
        
      //로그인
		$("#loginSubmit").on("click", function() {
			if(formCheck()==false){
				return false;
			}			
			
			$("#loginSubmit").hide();
			$("#loadingLogin").show();
			$.post("login_ajax.scse", {
				"userId" : $("#userIdforLogin").val(),
				"password" : $("#passwordforLogin").val()
			}, function(jsonObj) {
				if (jsonObj.status) {
					if(jsonObj.uType=="s") {
						if(jsonObj.chaMap.spiderman == null) {
							if(jsonObj.attendanceCheck == 7) {
								$.getJSON("${ pageContext.request.contextPath }/success_quest.scse", { "chaNum":52 });
								$("#SpiderManModal").modal("show");
							}
						}
					}
					location.href = location.href;
				} else {
					$("#loginSubmit").show();
					$("#loadingLogin").hide();
					$(".field.Login").addClass("error");
					$("#userId").val("");
					$("#password").val("");
					$("#targetHeader").html("<h3 class='ui header'>아이디 또는 암호가 올바르지 않습니다.</h3>");

					return false;
				}

			}, "json");
		});
      
		$.post("my_group_list_ajax.scse", function(jsonObj){
 			if(jsonObj.status){
 				$(jsonObj.list).each(function(index, item){
 					var a = $("<a/>").addClass("item").attr("href", "my_group_info.scse?groupNum="+item.groupNum+"&groupName="+item.groupName).text(item.groupName).css("text-align", "center");
 					$("#targetHeader").append(a);
 				});
 			}
 		}, "json");
 		//
		$("#goButtonWhenNotLogin").on("click", function() {
			$('#loginForm').modal('setting', {
				onDeny : function() {
					return false;
				},
				onApprove : function() {
					return false;
				}
			}).modal('show');
		});	
      
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="z-index: 9">
	<c:choose>
		<c:when test="${empty user }">
			<!-- 로그아웃 상태 헤더 -->
			<div class="ui orange inverted small menu" style="background-color: rgba(41,133,233,0.78)" >
				<a data-menuanchor="firstPage" class="item" href="ProjectSCSE.scse#firstPage" style="font-weight: bold;"> <i class="home icon"></i> 슬기로운 코딩!
				</a> <a href="ProjectSCSE.scse#secondPage" data-menuanchor="secondPage" class="item" style="font-weight: bold;"> <i class="question icon"></i> 슬기로운 코딩이란?
				</a> <a href="ProjectSCSE.scse#3rdPage" data-menuanchor="3rdPage" class="item" style="font-weight: bold;"> <i class="book icon"></i> 배경 스토리
				</a> <a data-menuanchor="4thPage" href="mailto:seulgibravo@gmail.com" class="item" style="font-weight: bold;"> <i class="mail outline icon"></i> 메일보내기
				</a>
				<div class="right menu">
					<a class="item" id="registerGo" style="font-weight: bold;"> <i class="user icon"></i> 회원가입
					</a> <a class="item" id="loginGo" style="font-weight: bold;"> <i class="home icon"></i> 로그인
					</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 로그인 했을 경우 헤더 헤더 -->
			<div class="ui orange inverted small menu" style="background-color: rgba(41,133,233,0.78);">
				<a class="item" href="ProjectSCSE.scse#firstPage" style="font-weight: bold;"> <i class="home icon"></i> 슬기로운 코딩!
				</a> <a href="ProjectSCSE.scse#secondPage" data-menuanchor="secondPage" class="item" style="font-weight: bold;"> <i class="question icon"></i> 슬기로운 코딩이란?
				</a> <a href="ProjectSCSE.scse#3rdPage" class="item" style="font-weight: bold;"> <i class="book icon"></i> 배경 스토리
				</a>
				<div class="right menu">
					<a class="item" style="font-weight: bold;"> <i class="user icon"></i> ${sessionScope.user.sName}님 안녕하세요! </a>
					<c:if test="${sessionScope.user.uType != 's'.charAt(0) }">					
					<div class="ui pointing dropdown link item">
				     <a href="my_group_home.scse"><i class="users sign icon" ></i><span style="font-weight: bold;">그룹관리</span></a><i class="dropdown icon"></i>
				      <div class="menu" id="targetHeader">
				      	<a class="item purple" href="my_group_home.scse" style="text-align: center; font-weight: bold; color: red;">그룹관리 홈으로</a>
				      </div>
				    </div>

					</c:if>
					<a class="item" id="myPage" href="myPage.scse"  style="font-weight: bold;"> <i class="edit sign icon"></i> 마이페이지 </a>
					<a class="item" id="logOut" href="logout.scse"  style="font-weight: bold;"> <i class="remove sign icon"></i> 로그아웃 </a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<!-- 모달모달 -->

	<!-- 로그인 모달 -->
	<div class="ui small block  modal" id="loginForm">
		<i class="close icon"></i>
		<div class="header" id="targetHeader" style="background: #fbbd1a; font-family: 'Nanum Gothic'" >슬기로운 코딩을 시작합니다.</div>
		<div class="content">
			<div class="ui form segment">
				<div class="field Login">
					<label>아이디</label>
					<div class="ui left labeled icon input">
						<input type="text" placeholder="아이디" id="userIdforLogin">
						<i class="user icon"></i>
						<div class="ui corner label">
							<i class="icon asterisk"></i>
						</div>
						<div class="ui red pointing above ui label" id="idFormCheck">아이디를 입력해주세요.</div>
					</div>
				</div>
				<div class="field Login">
					<label>비밀번호</label>
					<div class="ui left labeled icon input">
						<input type="password" placeholder="비밀번호" id="passwordforLogin">
						<i class="lock icon"></i>
						<div class="ui corner label">
							<i class="icon asterisk"></i>
						</div>
						<div class="ui red pointing above ui label" id="passwordFormCheck">암호를 입력해주세요.</div>
					</div>
				</div>
				<div align="right">
				<input type="button" value="로그인" id="loginSubmit" class="ui orange button">
				<div class="ui loading Login button" id="loadingLogin" style="width: 92px">loading</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 회원 가입용 모달 -->

	<div class="ui basic small modal" id="registerChoice" style="background: #fbbd1a; font-family: 'Nanum Gothic'" >
		
	
		<i class="close icon"></i>
		<div class="header">회원가입의 유형을 선택해주세요.</div>
		<div class="content">
			<div class="left">
				<table style="margin : auto">
					<tr>
						<td><a href="registerForm.scse?uType=t"><img width="130px" height="130px" class="circular ui image" src="assets/image/joinselection/teachers_icon.png"></a></td>
						<td><a href="registerForm.scse?uType=s"><img width="130px" height="130px" class="circular ui image" src="assets/image/joinselection/books_icon.png"></a></td>
						<td><a href="registerForm.scse?uType=p"><img width="130px" height="130px" class="circular ui image" src="assets/image/joinselection/parents_icon.png"></a></td>
					</tr>
					<tr>
						<td style="text-align: center">선생님</td>
						<td style="text-align: center">학생님</td>
						<td style="text-align: center">부모님</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
			<div id="cancel" class="ui negative red button">취소</div>
		</div>
	</div>
	
	
	<!-- 스파이더맨 모달 -->
	<div class="ui small modal" id="SpiderManModal" style="width:30%; margin-left: -17%;">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">스파이더맨 획득!</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th style="text-align: center;">일주일 꾸준히해서 스파이더맨을 드려요!</th>
				<tr>
					<td align="center" style="text-align: center;"><img width="150px" style="margin: 0 auto" height="150px" align="middle" class="ui image" src="${pageContext.request.contextPath }/assets/image/Character/spiderman.png"></td>		
				<tr>
					<td style="text-align: center; font-size: medium;">여러분의 친절한 이웃 스파이더맨</td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						<a href="character_list.scse"><div class="small ui button">캐릭터바꾸러가기</div></a>
						</span>
					</td>
			</table>
		</div>
	</div>
	
	
</body>
</html>