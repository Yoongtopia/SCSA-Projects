<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script>
<style type="text/css">

body{
	font-family: 맑은 고딕;
	background-color: #E6E6F0;
	font-size: 12px;
}
.page{
	width: 1100px;
}
.row{
	position:relative;
	top: 10px;
	width: 850px;
	background-color: white;
	border-radius: 10px;
	padding: 20px;
	margin: 5px;
	
}	
.table{
	margin-bottom: 0px;
	border-bottom: solid 2px #FF6600;
}
.head{
	background-color: #FF6600;
	color: white;
	font-family: 맑은 고딕;
	text-align: center;
}
.title{
	padding-left: 15px;
}
#title1{
	text-align: left;
	font-size: 35px;
	font-family: 맑은 고딕;
	color: #003366;
}
#title2{
	text-align: left;
	font-size: 18px;
	font-family: 맑은 고딕;
	color: #003366;
}
.table > tbody > tr > th{
	border-top:none;
	border-bottom: 1px solid #ddd;
}
.table>tbody>tr>td{
	border-top: none;
}
.btn-warning{
	border: #FF6600 1px solid; 
	background-color: #FF6600;
}
.btn-warning:HOVER{
	background-color: #EE9A00;
}

</style>



<script type="text/javascript">
	
	/* function sendForm(){

			url = "notice_remove.do";
			action = "deleteNotice";
		
		
		document.getElementById("noticeList").action = url;
		document.getElementById("action").value = action;
		document.getElementById("noticeList").submit();
		
	} */
	
	$(document).ready(function(){
		$("#delete_button").on("click",function(){
			confirm("정말로 삭제하시겠습니까?");
			/* location.href="${pageContext.request.contextPath}/notice_remove.do?notice_num="+${notice.notice_num }; */
		});
		
		
		/* $(".total").click(function(){
	 		if( $(this).is(":checked") == true ){
			$(".notice_num").prop("checked", true);
	 		}
	 		else{
	 		$(".notice_num").prop("checked", false);
	 		}
		}); */
		
		
	});
	
	
	

</script>
</head>
<body>

	
		<div class="page">
			<div class="row">
				<div class='title' align="left">
					<span id="title1">NOTICE</span>&nbsp;
					<span id="title2">공지 사항</span>
				</div>
				<br>
				<table class="table">
				  	<tr class="head">
						<th width="7%">번호:&nbsp;&nbsp;<span>${notice.notice_num}</span></th>
						<th width="40%">제목:&nbsp;&nbsp;<span>${notice.notice_title}</span></th>
						<th width="8%">작성자:&nbsp;&nbsp;<span>${notice.user_id }</span></th>
						<th width="15%"><fmt:parseDate value="${notice.notice_date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
						등록일:&nbsp;&nbsp;<span><fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일"/></span></th>					 
					</tr>
					
					 <tr>
						<td class="content" colspan="4">
						<br/>
				            ${notice.notice_content }
				        </td>
				     </tr>
			     </table> 
			     	
			     	
			         <c:if test="${user.user_status == 3}">
			        	<br>
						<div class="row2 text-center">
							<a href="${pageContext.request.contextPath}/move_notice_modify_form.do?notice_num=${notice.notice_num}">
							<button type="button" class="btn btn-warning btn-sm">
							<i class="large pencil icon"></i>수 정</button></a>&nbsp;&nbsp;
				
							<a href="${pageContext.request.contextPath}/notice_list.do">
							<button type="button" class="btn btn-warning btn-sm">
							<i class="large reply mail icon"></i>취 소</button></a>
							
						</div>	
						
					</c:if>
			         
			         
					<c:if test="${user.user_status != 3}">
						<br>
						<div class="row2 text-center">
							<a href="${pageContext.request.contextPath}/notice_list.do">
							<button type="button" class="btn btn-warning btn-sm" style="background-color: #FF6600">
							<i class="large reply mail icon"></i>확 인</button></a>
							
						</div>	
						
					</c:if>
					
			</div>
		</div>
	
	
	
	</body>
</html>
	
	
	<%-- <div>Gommelier - 공지사항</div>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성일자</td>
			<td>작성자</td>
		</tr>
		<c:forEach items="${noticeList }" var="notice">
			<tr>
				<td>${notice.notice_num }</td>
				<td><a href="${pageContext.request.contextPath}/notice_detail_by_num.do?notice_num=${notice.notice_num }">${notice.notice_title }</a></td>
				<td>${notice.notice_date }</td>
				<td>${notice.user_id }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><a href="${pageContext.request.contextPath}/move_notice_register_form.do">공지사항등록</a></td>
		</tr>
	</table> --%>
