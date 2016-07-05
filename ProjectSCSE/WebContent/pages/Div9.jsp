<%@page import="com.scse.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#cctv{
	margin: 0 auto;
	width: 1000px;
	overflow-y: scroll;
	overflow-x: auto;
}
.items {
	vertical-align: middle;
	width: 450px;
	height: 420px;
	border: 1px solid black;
}
.img {
	width: 500px;
	height: 400px;
}

.msg{
	position: relative;
	top: 94%;
}
</style>
<script type="text/javascript">
$(function(){
    
  
    	$("#loginUser").on("click", function(){
    		location.reload();
    	});
    });

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	//개인메시지 전송하기
	$(".messageSubmit").on("click", function(){
		var targetID = $("#targetVal").val();
		console.log("아이디"+targetID);
		console.log("제목"+$("#messageTitle").val());
		console.log("내용"+$("#messageContent").val());
		
		$.post("message_send_ajax.scse", {"messageTarget":targetID, "messageTitle":$(".messageTitle").val(),
			"messageContent":$(".messageContent").val()},function(jsonObj){
				if(!jsonObj.status){
					alert("메시지전송에 실패했습니다.");
				}
			} ,"json");
		$(".messageTitle").val("");
		$(".messageContent").val("");
		
	});
	
	//개인메시지 보내기창 띄우기
	$(".message").on("click", function(){
		var targetID = $(this).attr("data-value");
		$("#targetVal").val(targetID);
		$("#messageModal").modal('show');
	});
	
	$('.img').on("mouseenter", function(){
		$(this).css("cursor", "pointer");
	});
	
	reloader();
	setInterval(reloader, 1000 * 10);
	
	function reloader(){
		var d = Math.floor((Math.random() * 10) + 1);
		$(".img").show();
		$(".img").each(function(index, item){
			var src = $(this).attr("src");
			$(this).attr("src", src + d);			
		});
		console.log("Reloading...");
		var imgs = $('img');
		for(var i=0, j=imgs.length; i<j; i++){
			imgs[i].onerror = function(e){
				this.style.display ="none";
			};
		};
		
	};
	
	$("#help").on("click", function(){
		console.log("help");
		//$("#HelpModal").modal("show");
	});
	
	$(".img").on("click", function(){
		var targetID = $(this).attr("data-userId");
		$.post("message_send_ajax.scse", {"messageTarget":targetID, "messageTitle": "",
			"messageContent": false },function(jsonObj){
				if(jsonObj.status){
					alert("해당 학생에게 제어 요청이 전송되었습니다.");
				}
			} ,"json");
		$(".messageTitle").val("");
		$(".messageContent").val("");
	});
});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h3 class="ui black header"> ${requestScope.GroupName } 그룹의 화면 </h3>
	<div class="ui blue small button" id="loginUser" style="margin-bottom: 2%;">접속인원 다시 체크하기<i class="refresh icon"></i></div>
	<br/>
	<div class="ui secondary segment" style="text-align: center">
	<span>현재 보이는 학생들의 화면은 20초마다 이미지 형태로 새로고침형태로 갱신 되고 있습니다. 조금 더 향상된 관리 기능을 원하시면 학생 컴퓨터에 ThinVCN을 <a href="javascript:void(0)" id="help">설치해주세요.</a>&nbsp;<br/>
	<span>학생 컴퓨터에 ThinVCN이 설치되어 있다면, 이미지 클릭시 상세제어 화면으로 접속됩니다. (기본포트: 5050) </span><a href="http://www.cybelesoft.com/downloads/ThinVNCSetup.zip">ThinVCN 다운로드</a></span>
	</div>
	<table id="cctv">
	<%	User user = (User) session.getAttribute("user");
		String userID = user.getUserId();
		List<User> ulist = (List<User>) request.getAttribute("list");
		int i = 1;
		for(User u:ulist){
	%>
		<%if(u.getCheckConnect()=='y') {%>
			<%if(!u.getUserId().equals(userID)) { %>
			<%if(i%2 ==1) {%>	
				<tr>
			<% } %>
					<td>	
					<div class="ui ribbon label">이름: <%=u.getsName() %>&nbsp; 마지막 접속 시간: <%=u.getFinalAccess() %></div>
						<div>
							<a href="http://<%=u.getIp() %>:5050" target="_blank">
								<img data-userId="<%=u.getUserId()%>" class="img" src="${pageContext.request.contextPath }/watch/<%=u.getUserId()%>.png?">
							</a>
						</div>
						<div style="position: relative;">
							<a href="javascript:void(0)">
								<div class="circular ui button tiny message" data-value="<%=u.getUserId() %>">메시지</div>
							</a>
						</div>
					</td>
		<%if(i%2==0){ %>
			</tr>
		<% } %>
	
			<% } %>
		<% } %>
	<% i++; } %>	
	</table>



	<!-- 메시지 보내기 모달 -->
	<div class="ui small modal" id="messageModal">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">메시지보내기</div>
		<div class="content">
			<div class="ui large form segment">
				<div class="two fields">
					<div class="field" style="width: 30%">
						<label>메시지 제목</label>
						<input type="hidden" id="targetVal">
						<input placeholder="메시지제목" type="text" id="messageTitle">
					<div class="ui red pointing above ui label formCheck" id="messageTitleFormCheck">메세지 제목을 입력해주세요.</div>
					
					</div>
							
					<div class="field" style="width: 70%">
						<label>메시지 내용</label>
						<input placeholder="메시지내용" type="text" id="messageContent">
					<div class="ui red pointing above ui label formCheck" id="messageContentFormCheck">메세지 내용을 입력해주세요.</div>
					
					</div>
				</div>
			</div>
		</div>
		<div class="actions">
			<div class="ui negative button">취소</div>
			<div class="ui positive right labeled icon button messageSubmit" id="messageSubmit">
				전송 <i class="checkmark icon"></i>
			</div>
		</div>
	</div>


	<!-- ThinVCN 사용법 모달 -->
	<div class="ui modal" id="HelpModal">
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">ThinVCN 설치법</div>
		<div class="content">
			<table class="ui table segment">
				<tr>
					<th>ThinVCN 설치하기</th>
				<tr>
					<td><a href="http://www.cybelesoft.com/downloads/ThinVNCSetup.zip">ThinVCN 다운로드</a></td>
				<tr>
					<td>
						<span class="actions">
						<span class="small ui button">확인</span>
						</span>
					</td>
			</table>
		</div>
	</div>
</body>
</html>