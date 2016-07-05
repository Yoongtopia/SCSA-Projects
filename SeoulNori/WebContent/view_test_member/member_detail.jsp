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
	
	
	
	$("#password2").blur(function(){
		if($("#password").val()==$("#password2").val()){
		}else{	
			$("#alert3").text("비밀번호를 다시 입력해주세요");
		}	
	});
	
	
	

	
	
	
	
});

</script>

<style>
#findEventArea, #joinForm {
 display: none;
}
</style>

</head>

<body>

<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
		<div class="row" id="MainImage" style="padding: 0; margin-bottom: 20px;">
			<img src="../images/test/exhibition.jpg" width="853px" />
		</div>
		<h2 style="margin-bottom: 20px;">
			My Info
		</h2>
		
	<a href="${pageContext.request.contextPath}/member_delete.do?userId=${member.userId}">
 	<input type="button" class="btn btn-default" value="탈퇴"></a>	
		
<form method="post" action="${pageContext.request.contextPath}/member_update.do">

<div id="myInfo">
<table  class="table table-bordered" style="width: 853px;">
 <tr>
  <td><label>Email(ID)</label></td>
  <td><input id="userId" class="form-control" readonly="readonly"
								name="userId" value="${member.userId }" type="text"><td><label>닉네임</label></td>
  <td><input id="nickname" class="form-control" name="nickname" value="${member.nickname }" type="text" >
 </tr>
 <tr>
 <td><label>비밀번호</label></td>
 <td colspan="3"><input type="password" class="form-control" id="password" value="" name="password" /></td>
 </tr>
 <tr>
  <td><label>비밀번호 확인</label></td>
  <td colspan="3"><input type="password" class="form-control"  id="password2" value="" />
  <span id="alert3"></span></td>
 </tr>
 <tr>
  <td><label>생년월일</label></td>
  <td><input type="text" class="form-control" readonly="readonly" id="year" value="${member.birthday }" name="birthday" maxlength="4" />
  </td>
  <td><label>성별</label></td>
  <td>
  <c:choose>
	  <c:when test="${member.gender }==1"> 남자  </c:when>
	  <c:otherwise> 여자 </c:otherwise>
  </c:choose>
  </td>
 </tr>
 <tr>
  <td><label>결혼정보</label></td>
  <td>
  <c:choose>
	  <c:when test="${member.marriage }=='미혼"> 
		 <input type="radio" id="single" value="미혼" name="marriage" checked="checked" /><label>미혼</label>
         <input type="radio" id="married" value="기혼" name="marriage" /><label>기혼</label>
	  </c:when>
	  <c:otherwise> 
	    <input type="radio" id="single" value="미혼" name="marriage" /><label>미혼</label>
        <input type="radio" id="married" value="기혼" name="marriage" checked="checked" /><label>기혼</label>
	  </c:otherwise>
  </c:choose>
  </td>
 
  <td><label>자녀정보</label></td>
  <td>
   <c:choose>
	  <c:when test="${member.children }=='자녀있음'"> 
		<input type="radio" id="withC" value="자녀있음" name="children"/>없음
     	<input type="radio" id="withoutC" value="자녀없음" name="children"  checked="checked" />있음 </c:when>
	  <c:otherwise> 
	   <input type="radio" id="withC" value="자녀있음" name="children" checked="checked" />없음
       <input type="radio" id="withoutC" value="자녀없음" name="children" />있음 </c:otherwise>
  </c:choose>
 </td>
 </tr>
</table>

<table>
<tr>
<td>
<input type="submit" id="updateBtn" class="btn btn-default" value="수정">

		
<input type="hidden" name="gender" value="${member.gender }">
<input type="hidden" name="memberType" value="${member.memberType }">
<input type="hidden" name="mainStamp" value="${member.mainStamp }">
<input type="hidden" name="memberStatus" value="${member.memberStatus }">
<input type="hidden" name="stampCount" value="${member.stampCount }">
<a href="${pageContext.request.contextPath}/member_list.do">
<input type="button" class="btn btn-default" value="취소"></a>
</td>
</tr>
</table>
</div>
</form>
</div>
	<div class="col-md-2"></div>

</div>

</body>
</html>