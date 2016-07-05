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
		
	$("#selectType").change(function(){
	 if($("#selectType option:selected").val()=="all"){
		 location.href="${pageContext.request.contextPath}/admin_page.do?pageNo=1";
		/*  $.getJSON("${pageContext.request.contextPath}/member_list_ajax.do", 
			 function(jsonObj){
		 		table(jsonObj);
		 }); */
						
	 }else{
	   $.getJSON("${pageContext.request.contextPath}/order_by_type.do", 
	    {"memberType":$("#selectType option:selected").val()},
	    	function(jsonObj){
	 		 table(jsonObj);
	   });
	 }
	});
	
	$("#searchMemberBtn").click(function(){
		if($("#selectSearchType option:selected").val()=="byUserId"){
			userId = $("#searchMember").val();
		}else {
			nickname = $("#searchMember").val();
		}
		$.getJSON("${pageContext.request.contextPath}/member_search.do",
				{"userId":$("#searchMember").val(), "nickname":$("#searchMember").val()},
				 function(jsonObj){
			 		table(jsonObj);
		 });
	
	});
});

function table(jsonObj){
    if(jsonObj.memberList.length!=0){
	     $(".body").remove();
	     $(jsonObj.memberList).each(function(index, item) {
	    	  var a = $("<a/>").attr("href",
				"${pageContext.request.contextPath }/member_view.do?&myInfo=no&userId="+(item.userId)).text( item.userId );	
			  var td1 = $("<td/>").append(a); 
			  var td2 = $("<td/>").text(item.nickname);
			  var td3 = $("<td/>").text( item.memberType );
			  var td4 = $("<td/>").text( item.memberStatus );
			  var td5 = $("<td/>").text( index+1 );
			  var tr = $("<tr/>").attr("class","body" ).append(td5, td3, td1, td2, td4);
			  $("#listTable").append(tr);
			});
		 } else {
		  var tr = $("<tr/>").attr("class","body" ).append($("<td/>").text( "목록없음" ));
		  $("#listTable").append(tr);
		 }
}

function pagelist(cpage){
	
	
	document.getElementById("pageNo").value=cpage;
	var frm = document.getElementById("frm");
	frm.action="admin_page.do";
	frm.submit();
}

</script>

<body>
<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
	MEMBER LIST<font size="4em"><strong>&nbsp;회원 목록</strong></font>
</h2>
<br/>

<div style="margin: 0 30px;">

	<table style="width: 100%;">
		<tr>
			<td style="padding: 0; vertical-align: baseline;">
				<select id="selectType" style="height: 30px;">
				<option value="all" >전체보기</option>
				<option value="admin">관리자</option>
				<option value="member">일반회원</option>
				<option value="manager">행사담당자</option>
				</select>
			</td>
			<td style="text-align: right; vertical-align: text-bottom;">
				<select id="selectSearchType" style="display: inline-block; height: 30px;">
				<option>선택</option>
				<option value="byUserId">아이디</option>
				<option value="byNickname">닉네임</option>
				</select>
				<div class="form-group" style="display: inline-block;">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchMember" 
								style="width: 180px; height: 30px;">
				</div>
				<button type="button" id="searchMemberBtn" class="btn btn-default btn-sm"
								style="margin-bottom: 2px;">검색</button>
			</td>
		</tr>
	</table>

	
	<table id="listTable" class="table table-hover" style="border-bottom: 1px solid #ddd;">
	<tr style="background-color: #f5f5f5;">
	<th>번호</th>
	<th>회원분류</th>
	<th>아이디</th>
	<th>닉네임</th>
	<th>활동상태</th>
	</tr>
	
	<c:forEach items="${memberList }" var="member" varStatus="status">
	<tr class="body">
	<td>${status.count }</td>
	<td>${member.memberType }</td>
	<td><a href="${pageContext.request.contextPath }/member_view.do?userId=${member.userId }&myInfo=no">${member.userId }</a></td>
	<td>${member.nickname }</td>
	<td>${member.memberStatus }</td>
	</tr>
	</c:forEach>
	
	</table>
	
	<br/>
		<div id="pageArea" style="text-align: center;">
		<div id="pagenation" style="text-align: center; font-size: large; font-family: 'Arial'">
			${pageLink }
		</div>
		<form id="frm" method="post">
			<input type="hidden" name="pageNo" id="pageNo" />
			<%-- <input type="hidden" name=category id="category" value="${sessionScope.category }"/> --%>
		</form>
	</div>
	<br/>	
		

</div>


</body>