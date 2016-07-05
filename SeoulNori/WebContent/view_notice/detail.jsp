<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function imgResize(obj) {
		var objWidth = obj.width;
		var divWidth = 810;
		if(objWidth > divWidth){
			obj.width = divWidth;
		}
	}
</script>
</head>
<body>
<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
		<div class="col-md-8" id="mainDiv">
			<h2 style="color: #4f8c70;">
				NOTICE <font size="4em"><strong>공지사항</strong></font> 
			</h2>
			<div class="row" style="padding: 18px 0 20px 0;">
			
				<div style="border-bottom: 2px solid #4f8c70; border-top: 2px solid #4f8c70; 
										color: #4f8c70; padding-top: 3px;">
					<table class="table" style="width: 853px; border: 0; margin-bottom: 0;">
						<tr>
							<td colspan="6"  style="border: 0;">
								<h4 style="margin-top: 10px;">${notice.noticeTitle }</h4>
							</td>
						</tr>
						
						<tr>
							<th>작성자</th>
							<td> ${notice.member.nickname} (${notice.userId })</td>
							<th>등록날짜</th>
							<td>${notice.noticeRegDate }</td>
							<th>수정날짜</th>
							<td>${notice.noticeUpDate }</td>
							
						</tr>
						<tr>
							<td colspan="6" style="padding: 10px;">
								<div style="width: 833px; height: 500px; overflow-y: scroll;">
									<c:if test="${ notice.noticeImage != null }">
										<img src="${pageContext.request.contextPath}/images/notice/${notice.noticeImage}"
													onload="imgResize(this);"/>
										<br/><br/>
									</c:if>
									${notice.noticeContent }<br/>
								</div>
							</td>
						</tr>
			
					</table>
				</div>
				
				<br/>
				<table style="width: 853px; margin-top: -10px;" >
					<tr>
						<td align="right">
							<c:if test="${sessionScope.member.memberType=='admin' }">
								<button class="btn btn-default" 
												style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;" 
												onclick="location.href='${pageContext.request.contextPath}/notice_add_form.do'">새 글 작성</button>&nbsp;&nbsp;
							</c:if>
							<c:if test="${sessionScope.member.userId == notice.userId}">
								<button class="btn btn-default" 
												style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;"
												onclick="location.href='${pageContext.request.contextPath}/notice_update_form.do?noticeNum=${notice.noticeNum}'">수정</button>&nbsp;&nbsp;
							</c:if>
							<c:if test="${sessionScope.member.memberType == 'admin' }">
								<button class="btn btn-default" 
												style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;"
												onclick="location.href='${pageContext.request.contextPath}/notice_remove.do?noticeNum=${notice.noticeNum}'">삭제</button>&nbsp;&nbsp;
							</c:if>
							<button class="btn btn-default" 
											style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;"
											onclick="location.href='${pageContext.request.contextPath}/notice_list.do'">목록으로</button>
						</td>
						
					</tr>
				</table>
			</div>
		</div>
	<div class="col-md-2"></div>
</div>
</body>
</html>