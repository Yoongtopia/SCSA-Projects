<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	$(function() {
		var tabs = $("#tabs").tabs();
		tabs.find(".ui-tabs-nav").sortable({
			axis : "x",
			stop : function() {
				tabs.tabs("refresh");
			}
		});
	});
</script>
<!-- 공지관련 스크립트 -->
<script type="text/javascript">
$(document).ready(function(){
	$(".formCheck").hide();
	/* $(".noticeSend").on("click", function(){
		$.post("notice_send_ajax.scse",
				{"groupNum" : $(".groupNum").val(), 
				 "leaderId" : $(".leaderId").val(),
				 "noticeTitle" : $(".noticeTitle").val(),
				 "noticeContent" : $(".noticeContent").val()
				},
				function(jsonObj){
					if(jsonObj.status){								
						$(".groupNum").val("");
						$(".leaderId").val("");
						$(".noticeTitle").val("");
						$(".noticeContent").val("");											
					}
		},"json");			
		location.href = location.href;
	}); */
	
		$(".blank").hide();
		
		//공지수정버튼 누르기
		$(".noticeUpdate").on("click", function() {
			var number = $(this).attr('value');
			console.log(number);
			
			var newNoticeContent = document.getElementById("newNoticeContent2" + number);
			var blankSave = document.getElementById("blankSave" + number);
			var hideCancelButton=document.getElementById("blankCancel"+number);
			
			newNoticeContent.style.display = "";
			blankSave.style.display = "";
			hideCancelButton.style.display="";
			
			var hideNoticeContent = document.getElementById("hideNoticeContent" + number);
			var hideButton = document.getElementById("hideUpdateButton" + number);
			var hideDeleteButton=document.getElementById("hideDeleteButton"+number);
			
			hideNoticeContent.style.display = "none";
			hideButton.style.display = "none";
			hideDeleteButton.style.display="none";
		});
		
	//공지저장버튼누르기
	$(".save").on("click", function() {
		var noticeNum = $(this).attr('value');

		var newNoticeContent = document.getElementById("newNoticeContent" + noticeNum).value;
	
		$.post("notice_update_ajax.scse", {
			"noticeTitle" : "updated",
			"noticeContent" : newNoticeContent,
			"noticeNum" : noticeNum
		}, function(jsonObj) {
			if (jsonObj.status) {
				alert("수정이 완료되었습니다.");
				location.href = location.href;
			}
		}, "json");
		location.href = location.href;
	});

	$(".cancel").on("click", function() {
		var number = $(this).attr('value');
		
		var newNoticeContent = document.getElementById("newNoticeContent2" + number);
		
		newNoticeContent.style.display = "none";
		
		var hideNoticeContent = document.getElementById("hideNoticeContent" + number);
	
		hideNoticeContent.style.display = "";
	});	
});
</script>
<!-- 멤버관련 스크립트 -->
<script type="text/javascript">
var re = "re";
$(function() {
	$("#tabs").tabs();
	$(".formCheck").hide();
	$(".dropdown").dropdown();

});

$(document).ready(function() {
	
	$(".submit").on("click", function(){
		if($("#groupType").val()==""){
			$("#groupNameFormCheck").show();
		}
		$("#form").submit();
	});
	
	
	//신규학생등록 띄움
	$(".newStudent").on("click", function() {
		$('.ui.modal.search').modal('show');
	});

	//검색버튼 클릭
	$("#goSearch").on("click", function() {
		$("#studentName").val();
	});
	
	//그룹삭제
	$(".delGroup").on("click",function() {
				var gN = "${param.groupName}";
				if (confirm(gN
						+ "그룹을 삭제하시겠습니까? 그룹 내 모든 정보가 삭제 됩니다.")) {
					alert("삭제가 완료되었습니다.");
					var groupNum = "${param.groupNum}";
					location.href = "del_group.scse?groupNum="+ groupNum;
				}
				return;
			});

	//학생삭제
	$(".delStudent").on("click",function() {
		console.log("진입");
		var checkElements = document.getElementsByName("check");
		for (var i = 0; i < checkElements.length; i++) {
			if (checkElements[i].checked) {
				console.log(checkElements[i].value);
				$.post("del_student_from_group_ajax.scse",	{
							"userId" : checkElements[i].value
						},function(jsonObj) {
							if (jsonObj.status) {
								console.log("DeleteSuccess");
							} else {
								console.log("DeleteFail");
							}
			}, "json");
			}
		}
		location.href = location.href;
	});
	
	
	//학생검색하기
	$("#exeSearch").on("click", function(){
		$(".searchResult").remove();
		$(".blank").hide();
		$.post("search_student_from_school_ajax.scse", 
				{"sName":$("#searchStudent").val(), "schoolName":$("#searchSchool").val()}, function(jsonObj){
					if(jsonObj.status){
						$(jsonObj.list).each(function(index, item){
							var td1 = $("<td/>").text(item.userId);
							var td2 = $("<td/>").text(item.sName);
							var td3 = $("<td/>").text(item.schoolName);
							var td4 = $("<td/>").text(item.grade);
							var td5 = $("<td/>").html("<input type='checkbox' value='"+item.userId+"' class='checkStudent' name='checkStudent'>");
							var tr = $("<tr/>").attr("class", "searchResult").append(td1, td2, td3, td4, td5);
							$("#targetUser").append(tr);
						});
					} else {
							var td1 = $("<td/>").text("검색결과가 없습니다.");
							var tr = $("<tr/>").attr("class", "searchResult").append(td1);
							$("#targetUser").append(tr);
					}
			} ,"json");
	});
	
	//검색으로 나온 학생 등록하기.
	$("#registerStudent").on("click", function(){
		var groupNumber = $("#groupNumberSending").val();
		console.log(groupNumber);
		var checkElements = document.getElementsByName("checkStudent");
		for (var i = 0; i < checkElements.length; i++) {
			if (checkElements[i].checked) {
			 	$.post("registration_student_in_group.scse",	{
							"userId" : checkElements[i].value, "groupNum":groupNumber
						},function(jsonObj) {
							if (jsonObj.status) {
								console.log("성공");
							} else{
								console.log("실패");
							}
			}, "json"); 
			console.log(checkElements[i].value);
			}
		}
		location.href = location.href;
	});
	
	//개인메시지 보내기창 띄우기
	$(".message").on("click", function(){
		var targetID = $(this).attr("data-value");
		$("#targetVal").val(targetID);
		$("#messageModal").modal('show');
	});
	
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
	
	$(".NewGroup").on("click", function(){
		$("#GroupCreationModal").modal("show");
	});
});
$(document).ready(function(){
	$(".submit").addClass("disabled");
	$("#groupName").on("blur", function(){
		$.post("group_name_check_ajax.scse", {
			"groupName" : $("#groupName").val()
		}, check, "json");
	})
	
	function check(jsonObj){
		if(jsonObj.status){
			$(".submit").removeClass("disabled");
			$("#exists").hide();
		} else {
			$(".submit").addClass("disabled");
			$("#exists").show();
		}
	}
	
	//그룹수정버튼누르면
	$(".updateGroup").on("click", function(){
		$("#utgroupName").val("${param.groupName}");
		$("#utGroupNum").val("${param.groupNum}");
		$("#GroupModify").modal("show");
	});
	
	//그룹수정이름에서 blur 했을 경우
	$("#utgroupName").on("change", function(){
		$.post("group_name_check_ajax.scse", {
			"groupName" : $(this).val()
		}, check2, "json");
		
		if($("#utType").val()==""){
			$(".goUpdate").addClass("disabled");
			$("#typeFormCheck2").show();
		}	
	});
	
	function check2(jsonObj){
		if(jsonObj.status){
			$(".goUpdate").removeClass("disabled");
			$("#exists2").hide();
		} else {
			$(".goUpdate").addClass("disabled");
			$("#exists2").show();
		}
	}
	
	$(".goUpdate").on("click", function(){
		$("#form2").submit();
	});
});	
</script>
</head>
<body>
	<div style="height: 30px;"></div>
	<div class="ui ribbon blue label" style="font-size: large; margin-left: 25px; font-weight: bold;">${requestScope.name } 관리</div>
	<!-- 탭관리 -->
	<div id="tabs">
		<!-- 탭헤더 -->
		<ul>
			<li><a href="#tabs-1">멤버관리</a></li>
			<li><a href="#tabs-2">알림장</a></li>
		</ul>
		<!-- 탭컨텐츠 -->
		<!-- 1번 탭 , 멤버관리 -->
		<div id="tabs-1">
			<!-- 조원명단 -->
			<h3 class="ui header">멤버 목록</h3>
			<input type="hidden" value="${param.groupNum }">
			<table class="ui table padded segment">
				<thead>
					<tr>
						<th style="text-align: center">아이디</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">최종진도</th>
						<th style="text-align: center">성취도</th>
						<th style="text-align: center">메시지</th>
						<th style="text-align: center">최근접속일자</th>
						<th style="text-align: center">선택</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty requestScope.memberList }">
							<c:forEach items="${requestScope.memberList}" var="student" varStatus="st">
								<tr style="text-align: center">
									<td>${student.userId }</td>
									<td>${student.sName }</td>
									<td>챕터${student.chapNum } - ${student.quizNum } 번 문제</td>
									<c:choose>
									<c:when test="${student.chapNum !=0 }">
									<td><a href="${pageContext.request.contextPath }/go_performance.scse?groupName=${param.groupName }&sName=${student.sName }&userId=${student.userId }&schoolNum=${student.schoolNum}&gN=${param.groupNum}">
									<div class="circular ui tiny button">
									<i class="signal icon"></i>
									성취도보기</div></a></td>
									</c:when>
									<c:otherwise>
									<td><span class="ui inverted red block header" style="font-size: small">튜토리얼을 완료해야합니다.</span></td>
									</c:otherwise>
									</c:choose>
									<td><div class="circular ui button tiny message" data-value="${student.userId }">메시지</div></td>
									<td>${student.finalAccess }</td>
									<td><input type="checkbox" value='${student.userId }' class="checkbox" name="check"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td colspan="6">등록된 멤버가 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
		<div class="5 fluid ui buttons">
			<div class="medium ui buttons">
				<!-- <div class="ui small updateGroup button" style="margin-left:5px"><i class="teal edit icon"></i>그룹수정</div>
				<div class="ui small delGroup button" style="margin-left:5px"><i class="teal remove icon"></i>그룹삭제</div> -->
		<!-- 	</div>
			<div class="medium ui buttons"> -->
				<div class="ui small newStudent button" style="margin-left:180px"><i class="teal user icon"></i>학생등록</div>
				<div class="ui small delStudent button" style="margin-left:30px"><i class="teal remove circle icon"></i>학생삭제</div>
				<div class="ui small button" style="text-decoration:none; margin-left:30px"><a href="watch_my_student_9mode.scse?groupNum=${param.groupNum }&groupName=${param.groupName}" ><i class="teal desktop icon"></i>접속 중인 아이들 화면 보기</a></div>
			</div>
		</div>

		</div>
		<!-- 2번탭, 공지관리 -->
		<div id="tabs-2">
			<h3 class="ui header">알림장</h3>
				<input type="hidden" value="${param.groupNum}">
				<table class="ui table padded segment">
					<thead>
						<tr>
							<th style="text-align: center">번호</th>
							<th style="text-align: center; width: 60%;">내용</th>
							<th style="text-align: center">날짜</th>
							<th style="text-align: center">수정</th>
							<th style="text-align: center">삭제</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${not empty requestScope.noticeList}">
							<c:forEach items="${requestScope.noticeList}" var="notice" varStatus="numbering">
								<tr style="text-align: center">
										<td>${numbering.count }</td>

								<td id="hideNoticeContent${notice.noticeNum}">${notice.noticeContent}</td>
								<td class="blank" id="newNoticeContent2${notice.noticeNum}">
								<input type="text" id="newNoticeContent${notice.noticeNum }" maxlength="60" value="${notice.noticeContent }"> 
								</td>
								
								<td>${notice.noticeDate }</td>
								
								<td id="hideUpdateButton${notice.noticeNum }" align="center">
								<div class="ui tiny down noticeUpdate button" value="${notice.noticeNum }">
								<i class="edit icon"></i>수정	</div></td>
								
								<td class="blank" id="blankSave${notice.noticeNum }">
								<div class="ui tiny down save button" value="${notice.noticeNum }">
								<i class="save icon"></i>저장</div>
								</td>
								
								<td align="center" id="hideDeleteButton${notice.noticeNum}">								
								<div class="ui tiny down primary button">
								<a href="${pageContext.request.contextPath }/remove_notice.scse?noticeNum=${notice.noticeNum}&groupName=${param.groupName}&groupNum=${param.groupNum}">
								<i class="remove icon"></i>삭제
								</a>
								</div>								
								</td>		
																
								<td class="blank" id="blankCancel${notice.noticeNum }">
								<div class="ui tiny down cancel button" value="${notice.noticeNum }">
								<i class="undo icon"></i>취소</div>
								</td>								
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td colspan="6">등록된 알림장이 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- 공지작성 -->
			<form method="post" action="notice_send.scse" >
			<input type="hidden" name="groupName" value="${param.groupName }">
			<input type="hidden" name="groupNum" value="${param.groupNum }">
			<table class="ui table segment">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center">새로운 알림장 보내기</th>
					<tr>
						<th style="text-align: center">내용</th>
						<th style="text-align: center">보내기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 60%"><div class="ui icon input loading" style="width: 100%">
								<input type="text" name="noticeContent" class="noticeContent" placeholder="알림장 내용을 입력하세요.">
								<i class="icon"></i>
							</div>
							<div class="ui red pointing above ui label formCheck" id="noticeContentFormCheck">알림장 내용을 입력해주세요.</div></td>
						<td style="width: 10%">
							<input value="전송" type="submit" class="circular black tiny ui noticeSend button">
						</td>
				</tbody>
			</table>
			</form>
		</div>
	</div>
	
	<!-- 그룹수정 모달 -->
	
	
	<div class="ui small modal" id="GroupModify">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #fabb1b; font-family: 'Nanum Gothic'; font-size: large">수정하기</div>
		<div class="content">
			<form method="post" action="modify_group.scse" id="form2">
		<div class="ui form segment">
			<div class="three fields">
				<div class="field">
					<label>그룹이름</label>
					<input placeholder="새롭게 등록할 그룹 이름을 써주세요." class="" type="text" id="utgroupName" name="utgroupName">
					<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck2">그룹이름을 입력해주세요.</div>
					<div class="ui red pointing above ui label formCheck" id="exists2">이미 존재하는 그룹명입니다.</div>
				</div>
				<div class="field">
					<label>그룹타입</label>
					<div class="ui selection dropdown utgroupType">
						<input type="hidden" name="utgroupType" id="utType">
						<div class="default text">그룹유형</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" data-value="s">학교</div>
							<div class="item" data-value="h">가정</div>
						</div>
						<div class="ui red pointing above ui label formCheck" id="typeFormCheck2">그룹타입을 선택해주세요.</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="utGroupNum" id="utGroupNum">
	</form>
		</div>
		<div class="actions">
			<div class="ui goUpdate right labeled orange icon button">				
			수정<i class="checkmark icon"></i>
			</div>
			<div class="ui right labeled icon orange button">취소<i class="undo icon"></i></div>
		</div>
	</div>
	
	<div class="ui modal small search" id="searchGo">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #fabb1b; font-family: 'Nanum Gothic'; font-size: large">학생 등록하기</div>
		
		<div class="content" style="height: 60%; overflow-x: hidden; overflow-y:scroll;">
			<div class="ui action input">
				<input type="text" id="searchStudent" placeholder="학생이름입력">
				<input type="text" id="searchSchool" placeholder="학교이름입력">
				<input type="hidden" id="groupNumberSending" value="${param.groupNum }">
				<div class="ui icon button" id="exeSearch">
					<i class="search icon"></i>
				</div>
			</div>
			<table class="ui table segment">
				<thead>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>학교</td>
						<td>학년</td>
						<td>선택</td>
					</tr>
				</thead>
				<tbody id="targetUser">

				</tbody>
			</table>
		</div>
		<div class="actions">
			
			<div class="ui right labeled icon orange button" id="registerStudent">등록하기<i class="checkmark icon"></i></div>
		<div class="ui right labeled icon orange button">취소<i class="undo icon"></i></div>
		</div>
	</div>
	
</body>
</html>