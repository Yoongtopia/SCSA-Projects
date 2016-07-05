<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function() {
	$(".formCheck").hide();
	$(".blue.button").on("click", function() {
		$.post("group_name_check_ajax.scse", {
			"groupName" : $("#groupName").val()
		}, check, "json");
	});

	function check(jsonObj) {
		if (jsonObj.status) {
/* 			$("span").remove();
			$("<span/>").attr("class", "check text-info").text(
					"\'"
					+$("#groupName").val()+"\'"+"는 사용가능 합니다.").insertAfter("#groupName");
			$(".submit.button").removeAttr("disabled"); */
			alert("사용할 수 있습니다.")
		} else {
			/* $("span").remove();
			$("<span/>").attr("class", "check text-danger").text(
					"같은 이름의 그룹이 존재합니다. 다른 이름을 선택하세요.").insertAfter("#groupName");
			$(".submit.button").attr("disabled", "disabled"); */
			alert("같은 이름의 그룹이 존재합니다. 다른 이름을 선택하세요.")
			$("#groupName").val("");
		}
	}
});
</script>

<script type="text/javascript">
function groupFormCheck() {
		if ($("#groupName").val() == "") {
			$("#groupNameFormCheck").show();
			$("#groupName").focus();
			event.preventDefault();
			return false;
		}else{
			$("#groupNameFormCheck").hide();			
		}
		
		if ($("#groupName").val() == "") {
			$("#groupNameFormCheck").show();
			$("#groupName").focus();
			event.preventDefault();
			return false;
		}else{
			$("#groupNameFormCheck").hide();			
		}
		if ($("selectType#item").val() == "") {
			 $("#groupNameFormCheck").show();
			 event.preventDefault();
			 return false;  
		}else{
			 $("#groupNameFormCheck").hide();
		}  	
		
		
		
		
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<table class="ui segment table">
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹타입</th>
				<th>그룹이름</th>
				<th>학교명</th>
				<th>학교주소</th>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.groupList }" var="group" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<c:choose>
						<c:when test="${group.groupType eq 'h'.charAt(0)}">
							<td>가정</td>
						</c:when>
						<c:when test="${group.groupType eq 's'.charAt(0)}">
							<td>학교</td>
						</c:when>
						<c:otherwise>
							<td>-</td>
						</c:otherwise>
					</c:choose>
					<td class="groupDetail" id="${group.groupNum }">${group.groupName }</td>
					<td>${group.groupSchool.schoolName }</td>
					<td>${group.groupSchool.schoolAddress }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="my_group_management_detail.scse"><div class="ui button small">그룹관리</div></a>
	<form method="post" action="new_Group.scse">
		<div class="ui form segment">
			<div class="two fields">
				<div class="field">
					<label>그룹이름</label>
					<input placeholder="그룹이름을 써주세요" type="text" id="groupName" name="groupName">
					<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck">그룹이름을 입력해주세요.</div>
				</div>
				<div class="field">
					<label>&nbsp;</label> <a class="ui small blue button">Check</a>
				</div>
			</div>
			<div class="field">
				<label>그룹타입</label>
				<div class="ui selection dropdown selectType">
					<input type="hidden" name="groupType" id="groupType">
					<div class="default text">학교타입</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item" data-value="1">학교</div>
						<div class="item" data-value="2">가정</div>
					</div>
					<div class="ui red pointing above ui label formCheck" id="groupNameFormCheck">그룹타입을 선택해주세요.</div>

				</div>
			</div>
			<input type="submit" class="ui blue submit button" value="그룹만들기" onsubmit="javascript:groupFormCheck();">
		</div>
	</form>






</body>
</html>