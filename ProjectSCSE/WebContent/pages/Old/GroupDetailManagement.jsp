<%@page import="java.util.List"%>
<%@page import="com.scse.entity.Group"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.button{
	font-family: 'Nanum Gothic', serif;
}
</style>
</head>
<script>
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
			console.log("학생등록");
			$('#searchGo').modal('show');
			var groupNum = $(this).attr("data-groupNum");
			$("#groupNumberSending").val(groupNum);
		});

		$("#goSearch").on("click", function() {
			$("#studentName").val();
		});
		$(".delGroup").on("click",function() {
					var gN = $(this).attr("data-name");
					if (confirm(gN
							+ "그룹을 삭제하시겠습니까? 그룹 내 모든 정보가 삭제 됩니다.")) {
						alert("삭제가 완료되었습니다.");
						var groupNumbering = $(this)
								.attr("data-value");
						var groupNum = document
								.getElementById(groupNumbering).value;
						location.href = "del_group.scse?groupNum="
								+ groupNum;
					}
					return;
				});

		$(".delStudent").on("click",function() {
			console.log("진입");
			var numbering = $(this).attr("data-value");
			var checkElements = document.getElementsByName("check"+ numbering);
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
			location.href = "my_group_management_detail.scse?"+re;
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
			location.href = "my_group_management_detail.scse?"+re;
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
			$.post("message_send_ajax.scse", {"messageTarget":targetID, "messageTitle":$("#messageTitle").val(),
				"messageContent":$("#messageContent").val()},function(jsonObj){
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
</script>

<script type="text/javascript">
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
			console.log("??");
			var group_name = $(this).attr("data-name");
			var group_num = $(this).attr("data-groupnum");
			$("#utgroupName").val(group_name);
			$("#utGroupNum").val(group_num);
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
	<c:if test="${empty requestScope.list }">
		<script type="text/javascript">
		$(document).ready(function(){
			$("#GroupCreationModal").modal("show");	
		});
		</script>
	</c:if>
	<div id="tabs" style="position: relative;">
		<ul>
			<c:forEach items="${requestScope.list }" varStatus="groupNumbering" var="group">
				<li><a href="#tabs-${groupNumbering.count}" id="groupNameShow">${group.groupName }</a></li>
			</c:forEach>
		</ul>
		<!-- 탭1 내용 -->

		<%
			List<Group> grouplist = (List<Group>) request.getAttribute("list");
			int i = 1;
			for (Group gl : grouplist) {
		%>
		<div id="tabs-<%=i%>">
			<!-- 조원명단 -->
			<input type="hidden" value="<%=gl.getGroupNum()%>" id="<%=i%>">
			<table class="ui table segment">
				<thead>
					<tr>
						<th style="text-align: center">아이디</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">소속학교</th>
						<th style="text-align: center">최종진도</th>
						<th style="text-align: center">메시지</th>
						<th style="text-align: center">선택</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.list }" varStatus="status" var="list" begin="<%=i-1 %>" end="<%=i-1 %>">
						<c:forEach items="${list.studentList}" var="student" varStatus="st">
							<c:choose>
								<c:when test="${not empty student.userId }">
								<tr style="text-align: center">
									<td>${student.userId }</td>
									<td>
									<a href="${pageContext.request.contextPath }/go_performance.scse?sName=${student.sName }&userId=${student.userId }&schoolNum=${student.schoolNum}&gN=${list.groupNum}">
									${student.sName }
									</a></td>
									<td>${student.schoolName }</td>
									<td>${student.chapNum }-${student.quizNum }</td>
									<td><a href="javascript:void(0)"><div class="circular ui button tiny message" data-value="${student.userId }">메시지</div></a></td>
									<td><input type="checkbox" value='${student.userId }' class="checkbox<%=i %>" name="check<%=i %>"></td>
								</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<div class="medium ui buttons">
				<div class="ui small positive NewGroup button">그룹등록</div>
				<div class="ui small orange updateGroup button" data-type="<%=gl.getGroupType()%>" data-groupNum="<%=gl.getGroupNum()%>" data-name="<%=gl.getGroupName()%>" data-value="<%=i%>">그룹수정</div>
				<div class="ui small red delGroup button" data-groupNum="<%=gl.getGroupNum()%>" data-name="<%=gl.getGroupName()%>" data-value="<%=i%>">그룹삭제</div>
			</div>
			<div class="medium ui buttons">
				<div class="ui small positive newStudent button" data-groupNum="<%=gl.getGroupNum()%>" data-name="<%=gl.getGroupName()%>" data-value="<%=i%>">학생등록</div>
				<div class="ui small red delStudent button" data-groupNum="<%=gl.getGroupNum()%>" data-name="<%=gl.getGroupName()%>" data-value="<%=i%>">학생삭제</div>
				<div class="ui small button"><a href="watch_my_student_9mode.scse?groupNum=<%=gl.getGroupNum() %>&groupName=<%=gl.getGroupName() %>"><i class="youtube play icon"></i>접속 중인 아이들 화면 보기</a></div>
			</div>
		</div>
		
		<%
			i = i + 1;
			}
		%>
		
		
		
		
	</div>


	<!-- 학생등록모달 -->
	<div class="ui modal small search" id="searchGo">
		<i class="close icon"></i>
		<div class="content">
			<div class="ui action input">
				<input type="text" id="searchStudent" placeholder="학생이름입력">
				<input type="text" id="searchSchool" placeholder="학교이름입력">
				<input type="hidden" id="groupNumberSending">
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
			<div class="ui button">취소하기</div>
			<div class="ui button" id="registerStudent">등록하기</div>
		</div>
	</div>

	<!-- 메시지 보내기 모달 -->

	<div class="ui small modal" id="messageModal">
		<i class="close icon"></i>
		<div class="header" style="background: #FF6666">메시지보내기</div>
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

	<!-- 그룹생성 모달 -->
	
	
	<div class="ui small modal" id="GroupCreationModal">
		<i class="close icon"></i>
		<div class="header">그룹생성하기</div>
		<div class="content">
			<form method="post" action="new_Group.scse" id="form">
		<div class="ui form segment">
			<div class="three fields">
				<div class="field">
					<label>그룹이름</label>
					<input placeholder="새롭게 등록할 그룹 이름을 써주세요." class="" type="text" id="groupName" name="groupName">
					<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck">그룹이름을 입력해주세요.</div>
					<div class="ui red pointing above ui label formCheck" id="exists">이미 존재하는 그룹명입니다.</div>
				</div>
				<div class="field">
					<label>그룹타입</label>
					<div class="ui selection dropdown selectType">
						<input type="hidden" name="groupType" id="groupType">
						<div class="default text">그룹유형</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" data-value="1">학교</div>
							<div class="item" data-value="2">가정</div>
						</div>
						<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck">그룹타입을 선택해주세요.</div>
					</div>
				</div>
			</div>
		</div>
	</form>
		</div>
		<div class="actions">
			<div class="ui negative button">취소</div>
			<div class="ui positive submit right labeled icon button">
				생성 <i class="checkmark icon"></i>
			</div>
		</div>
	</div>
	
	
	<!-- 그룹수정 모달 -->
	
	
	<div class="ui small modal" id="GroupModify">
		<i class="close icon"></i>
		<div class="header">수정하기</div>
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
			<div class="ui negative button">취소</div>
			<div class="ui positive goUpdate right labeled icon button">
				수정<i class="checkmark icon"></i>
			</div>
		</div>
	</div>


</body>
</html>