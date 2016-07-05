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
			

	//dialog
	$(document).on("hidden.bs.modal", function (e) {
	    $(e.target).removeData("bs.modal");
	});	
	

});

</script>


</head>

<body>


	<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
		MEMBER INFO<font size="4em"><strong>&nbsp;회원 정보 보기</strong></font>
	</h2>
	<br/>
		
<div style="margin: 0 30px;">		
<form method="post" action="${pageContext.request.contextPath}/manager_update_memberStatus.do">

<div id="memberInfo">
  <h4 style="margin-bottom: 20px;">
			${member.nickname } 님의 회원 정보
	<input name="nickname" value="${requestScope.member.nickname }" type="hidden" >
	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#withdrawalModal">강퇴</button>
	<input type="submit" id="updateBtn" class="btn btn-default" value="수정">
	<a href="${pageContext.request.contextPath}/admin_page.do">
	<input type="button" class="btn btn-default" value="취소"></a>
	
  </h4>
  
<table  class="table table-bordered" style="width: 100%;">
 <tr>								
  <td><label>이메일</label></td>
  <td><label>${requestScope.member.userId }</label><input name="userId" value="${requestScope.member.userId}" type="hidden" >
  <td><label>회원타입</label></td>
  <td><label>${requestScope.member.memberType }</label><input type="hidden" name="memberType" value="${requestScope.member.memberType }">
 </tr>
 <tr>
  <td><label>생년월일</label></td>
  <td><label>${requestScope.member.birthday }</label><input type="hidden" value="${requestScope.member.birthday }" name="birthday" />
  </td>
  <td><label>성별</label></td>
  <td>
  <c:choose>
	  <c:when test="${requestScope.member.gender =='1'}"><label>남자 </label> </c:when>
	  <c:otherwise><label> 여자</label> </c:otherwise>
  </c:choose>
  </td>
 </tr>
 <tr>
  <td><label>결혼정보</label></td>
  <td>
  <c:choose>
	  <c:when test="${requestScope.member.marriage == '미혼' }"> <label>미혼</label> </c:when>
	  <c:otherwise> <label>기혼</label> </c:otherwise>
  </c:choose>
  </td>
  <td><label>자녀정보</label></td>
  <td>
   <c:choose>
	  <c:when test="${requestScope.member.children =='자녀있음'}"> <label>있음 </label></c:when>
	  <c:otherwise> <label> 없음</label></c:otherwise>
  </c:choose>
 </td>
 </tr>
 <tr>
  <td><label>활성화 상태</label></td>
  <td colspan="3">
    <c:choose>
	  <c:when test="${requestScope.member.memberStatus =='승인'}"> 
		<input type="radio" id="memberStatus" value="승인" name="memberStatus"  checked="checked" style="margin:0; vertical-align:middle" />&nbsp;승인&nbsp;&nbsp;&nbsp;
     	<input type="radio" id="memberStatus" value="대기" name="memberStatus"  style="margin:0; vertical-align:middle" />&nbsp;대기 
      </c:when>
	  <c:otherwise> 
	  	<input type="radio" id="memberStatus" value="승인" name="memberStatus"  style="margin:0; vertical-align:middle"/>&nbsp;승인&nbsp;&nbsp;&nbsp;
     	<input type="radio" id="memberStatus" value="대기" name="memberStatus"  checked="checked"  style="margin:0; vertical-align:middle" />&nbsp;대기 
      </c:otherwise>
  </c:choose>
  </td>
 </tr>
</table>

<table>
<tr>
<td>


<input type="hidden" name="gender" value="${requestScope.member.gender }">
<input type="hidden" name="mainStamp" value="${requestScope.member.mainStamp }">
<input type="hidden" name="stampCount" value="${requestScope.member.stampCount }">
<input type="hidden" name="password" value="${requestScope.member.password }">


</td>
</tr>
</table>
</div>
</form>

<c:if test="${not empty requestScope.member.eventList }">
<h4 style="margin-bottom: 20px;">
			담당 행사 정보
</h4>
	<table  class="table table-bordered" style="width: 100%;">
	<tr>
		<td>행사번호</td>
		<td>행사명</td>
		<td>행사기간</td>
	</tr>
	<tr>

<c:forEach items="${requestScope.member.eventList}" var="event">
		<td>${event.eventId }</td>
		<td><a href="${pageContext.request.contextPath }/event_detail.do?eventId=${event.eventId }">${event.eventTitle }</a></td>
		<td>${event.eventStartDate }~${event.eventEndDate }</td>
</c:forEach>

	</tr>
	</table>
</c:if>

<c:if test="${requestScope.member.memberType == 'member' }">
<h4 style="margin-bottom: 20px;">
			스탬프 정보
</h4>
		<table  class="table table-bordered" style="width: 100%;">
		<tr>
		<td>선택</td>
		<td>이벤트</td>
		<td>획득날짜</td>
		<td>획득내용</td>
		<td>이미지</td>
		</tr>
		<tr>
<c:choose>
<c:when test="${not empty stampList}">
<c:forEach items="${stampList}" var="stamp">
		<td><input type="radio" value="${stamp.stampNum }" name="stampNum"></td>
		<td>${stamp.eventTitle }</td>
		<td>${stamp.stampGetDate }</td>
		<td>${stamp.stampContent }</td>
		<td><img src="${pageContext.request.contextPath}/images/test/${stamp.stampImage }" style="width:50px;"></td>
</c:forEach>
</c:when>
<c:otherwise>
		<td colspan="5">가진 스탬프가 없습니다.</td>
</c:otherwise>
</c:choose>
</tr>
</table>
</c:if>

</div>
<!-- Modal -->
	<div class="modal-nori fade" id="withdrawalModal" tabindex="-1" role="dialog" aria-labelledby="withdrawalModalLabel" aria-hidden="true">
	  <div class="modal-nori-dialog">
	    <div class="modal-nori-content" style="height:100%">
	      <div class="modal-nori-header">
	        <button type="button" class="close-nori" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <span class="modal-nori-title" id="withdrawalModalLabel" contenteditable="false" style="font-size: 1.5em;">ALERT</span>
	       </div>
	   
	      <div class="moda-noril-body" contenteditable="false">
	      	<div class="form-nori-group">
				 <label for="email" style="margin: 30px;">해당 회원을 강퇴하시겠습니까?</label>
			</div>
		 </div>	
	      <div class="modal-nori-footer">
	      	<a href="${pageContext.request.contextPath}/member_delete.do?userId=${requestScope.Smember.userId}"> 
	         <button type="button" class="btn btn-primary" id="withdrawalModalBtn" contenteditable="false">강퇴</button></a>
	         <button type="button" class="btn btn-default" id="resetwithdrawalBtn" data-dismiss="modal" contenteditable="false">취소</button>
	      </div>
	    
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>