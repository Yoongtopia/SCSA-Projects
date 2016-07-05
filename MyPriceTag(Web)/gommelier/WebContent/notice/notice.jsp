<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	font-weight: bold;
}
.page{
	width: 1100px;
}
.row1{
	position: relative;
	top: 10px;
	width: 850px;
	background-color: white;
	border-radius: 10px;
	padding: 20px;
	margin: 5px;
	
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
.table{
	margin-bottom: 0px;
	border-bottom: solid 2px #FF6600;
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
		
		/* checkbox선택 + 삭제버튼 상태 변경*/
		$btn = $("#delete_button");
		$(":checkbox").click(function() {
			if($("input:checkbox[name='notice_num']").is(':checked') == true){
				$btn.removeAttr("disabled");
			}else{
				$btn.attr('disabled','disabled');
			}
		});
		
		/*전체 버튼 선택 + 삭제버튼 상태 변경 */
		$(".total").click(function(){
	 		if( $(this).is(":checked") == true ){
			$(".notice_num").prop("checked", true);
			$btn.removeAttr("disabled");
	 		}
	 		else{
	 		$(".notice_num").prop("checked", false);
	 		$btn.attr('disabled','disabled');
	 		}
		});
		
		
		
	});
	
		function pagelist(cpage){
			
			document.getElementById("pageNo").value = cpage;
			var frm = document.getElementById("frm");
			frm.action = "notice_list.do";
			
			frm.submit();
			
		}
	

</script>
</head>
<body>

	<form method="post" action="${pageContext.request.contextPath}/notice_remove.do">
		<div class="page">
			<div class="row1" align="center">
				<div class='title' align="left">
					<span id="title1"><b>NOTICE</b></span>&nbsp;
					<span id="title2"><b>공지사항</b></span>
				</div>
				<br>
				<table class="table table-striped">
				  <thead>
					<tr class="head" align="center">
						<c:if test="${user.user_status == 3}"> 
						<th width="7%"><input type="checkbox" class="total" name="notice_all_num" value=${notice.notice_num }></th>
						</c:if>
						<th width="10%">번 호</th>
						<th width="22%">제 목</th>
						<th width="13%">작 성 자</th>
						<th width="15%">등 록 일</th>
					</tr>
				  </thead>
					<c:choose>
						<c:when test="${not empty noticeList }">
							 <c:forEach items="${noticeList}" var="notice" varStatus="status">
				          <tr>
				          	<c:if test="${user.user_status == 3}"> 
				           	 <td><input type="checkbox" class="notice_num" name="notice_num" value="${notice.notice_num }"></td>
				            </c:if>
				             <td>${notice.notice_num}</td>
				             <td><a style="color: #003366;" href="${pageContext.request.contextPath}/notice_detail_by_num.do?notice_num=${notice.notice_num }">${fn:substring(notice.notice_title, 0, 15)} 
				             ${fn:length(notice.notice_title) > 15? '...':''}</a></td>  			            
				             <td>${notice.user_id }</td>
				             <fmt:parseDate value="${notice.notice_date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
							 <td><fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일"/></td>
			         	  </tr>
			         	  
			         	  	
			           </c:forEach>
			          </c:when>
			         </c:choose>
			         
				</table>
				
				<br/>
				<br/>
				
					<c:if test="${user.user_status == 3}">
						<div class="row2" align="center">
							<a href="${pageContext.request.contextPath}/move_notice_register_form.do">
							<button type="button" class="btn btn-warning btn-sm">
							<i class="large pencil icon"></i>글쓰기</button></a>&nbsp;&nbsp;
				
							<button type="submit" class="btn btn-warning btn-sm" id="delete_button" disabled="disabled">
							<i class="large trash icon"></i>삭  제</button>
						</div>
					</c:if>
			</div>
		
	
		</div>
	</form>
				<br/>
				<div align="center">${pageLink}
					<form id="frm" method="post">
						<input type="hidden" name="pageNo" id="pageNo"/>
					</form>
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
