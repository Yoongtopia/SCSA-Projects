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
			
	$("#inputPassword2").blur(function(){
		if($("#inputPassword").val()==$("#inputPassword2").val()){
			$("#alert3").text("");
		}else{	
			$("#alert3").text("비밀번호를 다시 입력해주세요");
		}	
	});
		
	//dialog
	$(document).on("hidden.bs.modal", function (e) {
	    $(e.target).removeData("bs.modal");
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

	<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
		MY INFO<font size="4em"><strong>&nbsp;내 정보 수정</strong></font>
	</h2>
	<br/>
<div style="margin: 0 30px;">		

 	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#withdrawalModal">탈퇴</button>
 
		
<form method="post" action="${pageContext.request.contextPath}/member_update.do">

<div id="myInfo">
<h4 style="margin-bottom: 20px;">
			회원 정보
		</h4>
<table  class="table table-bordered" style="width: 100%;">
 <tr>
  <td><label>Email(ID)</label></td>
  <td><input id="userId" class="form-control" readonly="readonly"
								name="userId" value="${member.userId }" type="text"><td><label>닉네임</label></td>
  <td><input id="nickname" class="form-control" name="nickname" value="${member.nickname }" type="text" >
 </tr>
 <tr>
 <td><label>비밀번호</label></td>
 <td colspan="3"><input type="password" class="form-control" id="inputPassword" value="" name="password" /></td>
 </tr>
 <tr>
  <td><label>비밀번호 확인</label></td>
  <td colspan="3"><input type="password" class="form-control"  id="inputPassword2" value="" />
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
	  <c:when test="${member.marriage == '미혼' }"> 
		 <input type="radio" id="single" value="미혼" name="marriage" checked="checked" style="margin:0; vertical-align:middle"/>&nbsp;<label>미혼</label>&nbsp;&nbsp;&nbsp;
         <input type="radio" id="married" value="기혼" name="marriage" style="margin:0; vertical-align:middle"/>&nbsp;<label>기혼</label>
	  </c:when>
	  <c:otherwise> 
	    <input type="radio" id="single" value="미혼" name="marriage" style="margin:0; vertical-align:middle"/>&nbsp;<label>미혼</label>&nbsp;&nbsp;&nbsp;
        <input type="radio" id="married" value="기혼" name="marriage" checked="checked" style="margin:0; vertical-align:middle"/>&nbsp;<label>기혼</label>
	  </c:otherwise>
  </c:choose>
  </td>
 
  <td><label>자녀정보</label></td>
  <td>
   <c:choose>
	  <c:when test="${member.children =='자녀있음'}"> 
		<input type="radio" id="withC" value="자녀없음" name="children"vertical-align:middle"/>&nbsp;없음&nbsp;&nbsp;&nbsp;
     	<input type="radio" id="withoutC" value="자녀있음" name="children"  checked="checked" vertical-align:middle" />&nbsp;있음 </c:when>
	  <c:otherwise> 
	   <input type="radio" id="withC" value="자녀없음" name="children" checked="checked" vertical-align:middle"/>&nbsp;없음&nbsp;&nbsp;&nbsp;
       <input type="radio" id="withoutC" value="자녀있음" name="children" vertical-align:middle"/>&nbsp;있음 </c:otherwise>
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
<c:if test="{sessionScope.member.memberType =='member'}">
<a href="${pageContext.request.contextPath}/member_mypage.do">
</c:if>
<c:if test="{sessionScope.member.memberType =='manager'}">
<a href="${pageContext.request.contextPath}/manager_page.do">
</c:if>
<input type="button" class="btn btn-default" value="취소"></a>
</td>
</tr>
</table>
</div>
</form>
</div>
<br/><br/><br/>

<!-- Modal -->
	<div class="modal-nori fade" id="withdrawalModal" tabindex="-1" role="dialog" aria-labelledby="withdrawalModalLabel" aria-hidden="true">
	  <div class="modal-nori-dialog">
	    <div class="modal-nori-content" style="height:100%">
	      <div class="modal-nori-header">
	        <button type="button" class="close-nori" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <span class="modal-nori-title" id="withdrawalModalLabel" contenteditable="false" style="font-size: 1.5em;">탈퇴 확인</span>
	       </div>
	   
	      <div class="moda-noril-body" contenteditable="false">
	      	<div class="form-nori-group">
				 <label for="email" style="margin: 30px;">탈퇴 하시겠습니까?</label>
			</div>
		 </div>	
	      <div class="modal-nori-footer">
	      	<a href="${pageContext.request.contextPath}/member_delete.do?userId=${requestScope.Smember.userId}"> 
	         <button type="button" class="btn btn-primary" id="withdrawalModalBtn" contenteditable="false">탈퇴</button></a>
	         <button type="button" class="btn btn-default" id="resetwithdrawalBtn" data-dismiss="modal" contenteditable="false">취소</button>
	      </div>
	    
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>