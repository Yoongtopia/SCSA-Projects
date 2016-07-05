<%@page import="com.scse.entity.UserCharacter"%>
<%@page import="com.scse.entity.Character"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	<% Character userCharacter = (Character) session.getAttribute("characterInfo"); %>
	$('#<%=userCharacter.getChaNum()%>').attr("checked", "checked");
	
	
	
	<% List<Character> charlist = (List<Character>) request.getAttribute("list");
	for(Character cl:charlist){		%>
	$("#<%=cl.getChaName()%>").popup({
		    title: "<%=cl.getChaName() %>",
		    content: "<%=cl.getChaDesc()%>"	
		  });
	
	<% } %>
	
	
	<%
	List<UserCharacter> ulist = (List<UserCharacter>) request.getAttribute("mylist");
	for(Character cl:charlist){
		int checkValid = cl.getChaNum();
		for(UserCharacter ul:ulist){
			if(checkValid - ul.getChaNum() == 0){
					%> $('#<%=cl.getChaName() %>').removeClass("disabled");
					   $('.cha<%=cl.getChaNum()%>').removeAttr("disabled");
					
					<%
				break;
			}
		}
	}
	
	%>
	$("#submit").on("mouseenter", function(){
		var value = $(':radio[name="chaSelect"]:checked').attr("data-value");
		$("#show").text(value+"를 친구로 설정하기");
	});

	
	
	
});
</script>
</head>
<body>
<form method="post" action="character_change.scse">
	<table class="ui table padded" style="background:transparent; text-align: center;">
	<tr>
	<th colspan="4" align="center" style="font-size: x-large; font-family: 'Nanum Gothic'; font-weight: bold;background: transparent; ">
		<i class="trophy icon"></i>캐릭터 선택하기
	</th>
	</tr>
	<tr style="background: transparent;">
	<th colspan="4" align="center" style="background: transparent;">
	 <button type="submit" style="margin-left: 650px; width:300px" class="ui animated fade purple button fluid" id="submit">
      <div class="visible content">내 기본 캐릭터로 설정하기</div>
      <div class="hidden content" id="show"></div>
    </button>
	</th>
	</tr>
	<% List<Character> clist = (List<Character>) request.getAttribute("list");
		int i = 0;
		for(Character cl:clist){	
	%>
		<tr style="background: transparent;">
			<c:forEach items="${requestScope.list }" var="cha" begin="<%=i %>" end="<%=i+3 %>">
				<td width="200px"  style="font-weight: bold; font-size: large; background: transparent; text-align: center"><label for="${cha.chaNum }">
				<img class="character-${cha.chaNum } disabled ui image" id="${cha.chaName }" src="assets/image/Character/${cha.chaImg }" width="150px" height="150px" style="margin-left: 30px;" class="ui image"></label></td>
			</c:forEach>
		</tr>
		<tr style="background: transparent;">
			<c:forEach items="${requestScope.list }" var="cha" begin="<%=i %>" end="<%=i+3 %>">
				<td style="font-weight: bold; font-size: large; background: transparent;">
				<input type="radio" name="chaSelect" disabled="disabled" class="cha${cha.chaNum }" value="${cha.chaNum }" id="${cha.chaNum }" data-value="${cha.chaName }">${cha.chaName }</td>
			</c:forEach>
		</tr>
	<% i = i+4; } %>
	</table>
</form>
</body>
</html>