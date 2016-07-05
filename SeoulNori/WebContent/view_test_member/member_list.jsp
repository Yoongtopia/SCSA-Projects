<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
	$("#searchMemberBtn").click(function(){
		var userId  ;
		var nickname ;
		if($("#selectSearchType option:selected").val()=="byUserId"){
			userId = $("#searchMember").val();
		}else {
			nickname = $("#searchMember").val();
		}
		$.getJSON("${pageContext.request.contextPath}/member_search.do",
				{"userId":userId, "nickname":nickname},
				 function(jsonObj){
			 		table(jsonObj);
		 });
	
	});
});

$("#selectType").change(function(){
	 if($("option:selected").val()=="all"){
		 $.getJSON("${pageContext.request.contextPath}/member_list_ajax.do", 
				 function(jsonObj){
			 		table(jsonObj);
		 });
						
	 }else{
	   $.getJSON("${pageContext.request.contextPath}/order_by_type.do", 
	    {"memberType":$("option:selected").val()},
	    	function(jsonObj){
	 		 table(jsonObj);
	   });
	 }
	});

function table(jsonObj){
    if(jsonObj.memberList.length!=0){
	     $(".body").remove();
	     $(jsonObj.memberList).each(function(index, item) {
	    	  var a = $("<a/>").attr("href",
				"${pageContext.request.contextPath }/member_view.do?userId="+(item.userId)).text( item.userId );	
			  var td1 = $("<td/>").append(a); 
			  var td2 = $("<td/>").text(item.nickname);
			  var td3 = $("<td/>").text( item.memberType );
			  var td4 = $("<td/>").text( item.memberStatus );
			  var td5 = $("<td/>").text( index+1 );
			  var tr = $("<tr/>").attr("class","body" ).append(td5, td1, td2, td3, td4);
			  $("#listTable").append(tr);
			});
		 } else {
		  var tr = $("<tr/>").attr("class","body" ).append(td);
		  $("#listTable").append(tr);
		 }
}

</script>
</head>
<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
		<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
			<img src="../images/test/exhibition.jpg" width="853px" />
		</div>
		<h2 style="margin-bottom: 20px;">
			JOIN US
		</h2>

<label>회원분류</label>
<select id="selectType">
<option value="all" >전체보기</option>
<option value="admin">관리자</option>
<option value="member">일반회원</option>
<option value="eventManager">행사담당자</option>
</select>


<table id="listTable" class="table table-hover">
<tr>
<th>번호</th>
<th>아이디</th>
<th>닉네임</th>
<th>회원분류</th>
<th>활동상태</th>
</tr>

<c:forEach items="${memberList }" var="member" varStatus="status">
<tr class="body">
<td>${status.count }</td>
<td><a href="${pageContext.request.contextPath }/member_view.do?userId=${member.userId }">${member.userId }</a></td>
<td>${member.nickname }</td>
<td>${member.memberType }</td>
<td>${member.memberStatus }</td>
</tr>
</c:forEach>

</table>

<%-- <form role="search" style="text-align: right;" action="${pageContext.request.contextPath }/member_search.do" method="post" class="navbar-form navbar-right"> --%>
<select id="selectSearchType">
<option>선택</option>
<option value="byUserId">아이디</option>
<option value="byNickname">닉네임</option>
</select>
<div class="form-group">
<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchMember">
</div>
<button type="button" id="searchMemberBtn" class="btn btn-default">검색</button>
<!-- </form> -->

</div>
</body>
</html>