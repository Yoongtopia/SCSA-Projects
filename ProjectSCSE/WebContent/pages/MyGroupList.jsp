<%@page import="com.scse.entity.School"%>
<%@page import="java.util.List"%>
<%@page import="com.scse.entity.Group"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.MyGroup {
	width: 250px;
	height: 250px; border : 1px solid black;
	border: 1px solid black;
	
}
.groupDetail {
	text-align: center;
	vertical-align: middle;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그룹홈</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/isotope.pkgd.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootplus/js/bootstrap.js"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/bootplus/css/bootplus.css">

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".delGroup").on("click",function() {
			var gN = "${param.groupName}";
			if (confirm(gN
					+ "그룹을 삭제하시겠습니까? 그룹 내 모든 정보가 삭제 됩니다.")) {
				alert("삭제가 완료되었습니다.");
				var groupNum = $(this).attr('data-del');
				location.href = "del_group.scse?groupNum="+ groupNum;
			}
			return;
		});
		
		
		//그룹수정버튼누르면
		$(".updateGroup").on("click", function(){
			var number = $(this).attr('data-num');
			var gn = $(this).attr('data-gn');
			$("#utgroupName").val(gn);
			$("#utGroupNum").val(number);
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
		
		$(".goUpdate").on("click", function(){
			$("#form2").submit();
		});
		
		
		
		
		var $container = $('#container');
		$container.isotope({
			itemSelector : '.MyGroup',
			mansory : {
				columnWidth : 50
			}
		});
		
		$("#home").on("click", function(){
			$container.isotope({ filter: '.h' });
		});
		$("#school").on("click", function(){
			$container.isotope({ filter: '.s' });
		});
		$("#all").on("click", function(){
			$container.isotope({ filter: '*' });
		});
	});
</script>
</head>
<body>
<div style="font-size:x-large; font-family: 'Nanum Gothic'; margin-left:50px; margin-top: 30px; font-weight:bold">
<i class="users icon"></i>내 그룹 보기
</div>


	<div class="ui buttons" style="margin-top:15px;"align="center">
		<div class="ui button" id="home" style="width:300px"><i class="purple home icon"></i>가정 그룹만 보기</div>
		<div class="ui button" id="school" style="width:300px"><i class="red book icon"></i>학교 그룹만 보기</div>
		<div class="ui button" id="all" style="width:300px"><i class="yellow users icon"></i>전체 보기</div>
	</div>
	<div id="container" style="width: 800px; margin: 0 auto; margin-top:30px; margin-left: 10%;">
		<%List<Group> glist = (List<Group>) request.getAttribute("mygroup"); 
		for(Group g:glist){
		if(g.getGroupType()=='h'){%>
		<%School school = g.getGroupSchool(); %>
		<div class="card hovercard MyGroup h" style="border-radius: 10%;">
			<div style="width: 240px; height: 100px"></div>
			<div class="avatar">
				<a href='my_group_info.scse?groupNum=<%=g.getGroupNum() %>&groupName=<%=g.getGroupName()%>'><img src="${pageContext.request.contextPath }/assets/image/home.png" alt="가정그룹" /></a>
			</div>
			
			<div class="info">
				<div class="title" style="font-weight:bold; font-family: 'Nanum Gothic';"><%=g.getGroupName() %></div>
				<div class="desc" style="font-weight:bold; font-family: 'Nanum Gothic';"><%=school.getSchoolName() %></div>
				<div class="desc">
					<div class="ui small buttons" style="margin-top:10px;">
					  <div class="ui purple updateGroup button " data-num='<%=g.getGroupNum() %>' data-gn='<%=g.getGroupName() %>'>수정</div>
					  <div class="ui red delGroup button" data-del='<%=g.getGroupNum() %>'>삭제</div>
					</div>
				</div>
			</div>	
		</div>
	<% } else { %>
	<%School school = g.getGroupSchool(); %>
		<div class="card hovercard MyGroup s" style="border-radius: 10%;">
			<div style="width: 240px; height: 100px"></div>
			<div class="avatar">
				<a href='my_group_info.scse?groupNum=<%=g.getGroupNum() %>&groupName=<%=g.getGroupName()%>'><img src="${pageContext.request.contextPath }/assets/image/School.png" alt="학교그룹" /></a>
			</div>
			
			<div class="info">
				<div class="title" style="font-weight:bold; font-family: 'Nanum Gothic';"><%=g.getGroupName() %></div>
				<div class="desc" style="font-weight:bold; font-family: 'Nanum Gothic';"><%=school.getSchoolName() %></div>
				<div class="desc">
					<div class="ui small buttons" style="margin-top:10px;">
					  <div class="ui purple updateGroup button " data-num='<%=g.getGroupNum() %>' data-gn='<%=g.getGroupName() %>'>수정</div>
					  <div class="ui red delGroup button" data-del='<%=g.getGroupNum() %>'>삭제</div>
					</div>
				</div>
			</div>	
		</div>
	<% } %>


	<% } %>


	</div>
	
	
	
	
	
	<!-- 그룹수정모달 -->
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
</body>
</html>