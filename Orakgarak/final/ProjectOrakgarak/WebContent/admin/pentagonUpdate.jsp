<%@page import="com.orakgarak.service.DCFService"%>
<%@page import="com.orakgarak.admin.BSmap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<script src="./js/modernizr.custom.js"></script>

<link rel="stylesheet" href="packaged/css/semantic.css">
<script>
$(document).ready(function(){
	
	$(document).on("click",".updateOne",function(){
		$.getJSON("${pageContext.request.contextPath}/updateAllPentagon.do",{"code":$(this).attr("code")},updateGo);
		
	});
	
	$("#updateAll").on("click",function() {
		
		$(".code").each(function(){
			
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateAllPentagon.do",
				data : {code:$(this).text()},
				cache : false,
				async : false,
				dataType : "JSON",
				success : updateGo
			});//end ajax
			
		});
		
	});//end click event
	
});//end ready()

function updateGo(jsonData) {
	var codeString = ".code:contains(" + jsonData.code + ")";
	$(codeString).next().next().next().text(jsonData.code + " : " + jsonData.status);
	$(codeString).next().next().next().next().text(jsonData.msg);
}//end updateGo



</script>
<style>
header{
	width: 450px;
	margin: 10px auto;
}
.updateOne, #updateAll{
	background-color: #D95C5C;
	color: #FFFFFF;
	border: none;
	border-radius: 3px;
	font-weight: 700;
	font-size: 15px;
}
</style>
<header>
<span>모든 펜타곤의 정보를 업데이트 합니다.</span>
<button id="updateAll">모든정보업데이트고고!</button>
</header>
<div align="center">
<table class="ui collapsing table segment">
<tr>
<th>종목코드</th>
<th>회사이름</th>
<th>업데이트여부</th>
<th>완료상황</th>
<th>비고</th>
</tr>

<% for(int i = 0; i<BSmap.COMPANY_COUNT ; i++) {%>

<tr>
<td class="code"><%= BSmap.codeForCompany[i] %></td>
<td><%= BSmap.nameForCompany[i] %></td>
<td><input type="submit" value="Update" class="updateOne" code="<%=BSmap.codeForCompany[i]%>"> </td>
<td><span class="updateStatus" code="<%=BSmap.codeForCompany[i]%>"></span></td>
<td><span class="msg"></span></td>
</tr>

<%}%>
</table>


</div>

	




<!-- 
<form action="adminUpdatePentagon.do">
모든펜타곤의 정보를 최신으로 업데이트합니다.
<input type="submit" value="업데이트!">
</form> -->