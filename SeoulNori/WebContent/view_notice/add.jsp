<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

 function addCheck() {
	
	 if($("#noticeTitle").val()==null||$("#noticeTitle").val().trim()==""){
		 alert("제목은 반드시 입력하셔야합니다.");
		 return false;
	 }
	 
	 return true;
}
</script>
</head>
<body>
<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
		<div class="col-md-8" id="mainDiv">
			<h2 style="color: #4f8c70;">
				NOTICE <font size="4em"><strong>공지사항 등록</strong></font> 
			</h2>
			<div class="row" style="padding: 18px 0 20px 0;">
				<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/notice_add.do" onsubmit="return addCheck();">
				
				<div style="border-bottom: 2px solid #4f8c70; border-top: 2px solid #4f8c70; 
										color: #4f8c70; padding-top: 3px;">
					<table class="table" style="width: 853px; border: 0; margin-bottom: 0;">
						<tr>
							<td style="padding-top: 13px; border: 0; text-align: right;">
								<label for="noticeTitle">작성자</label>
							</td>
							<td style="border: 0;">
								<input type="text" class="form-control" readonly="readonly" 
									value="${sessionScope.member.nickname} (${sessionScope.member.userId})"
									style="width: 300px;">
							</td>					
						</tr>
						<tr>
							<td style="padding-top: 13px; border: 0; text-align: right;">
								<label for="noticeTitle">글제목</label>
							</td>
							<td style="border: 0;">
								<input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
							</td>					
						</tr>
						<tr>
							<td style="padding-top: 13px; text-align: right; border: 0;">
								<label for="noticeContent">내용</label>
							</td>
							<td style="border: 0;">
								<textarea class="form-control" id="noticeContent" name="noticeContent"
													rows="10" cols="100" style="resize: none; overflow-y: scroll;"></textarea>
							</td>					
						</tr>
						<tr>
						<td style="padding-top: 8px; text-align: right; border: 0;">
							<label for="noticeImage">파일</label>
						</td>
						<td style="padding-top: 7px; border: 0;">
							<input type="file" name="noticeImage" id="noticeImage">
						</td>
					</tr>
					</table>
				</div>
				
				<br/>
				<table style="width: 853px; margin-top: -10px;" >
					<tr>
						<td align="right">
							<c:if test="${sessionScope.member.memberType=='admin' }">
								<input type="hidden" name="noticeNum" value=${notice.noticeNum }>
								<input type="submit" class="btn btn-default" value="등록"
												style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;">&nbsp;&nbsp;
								<input type="button" class="btn btn-default" value="취소"
												style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;"
												onclick="location.href='${pageContext.request.contextPath}/notice_list.do'">
							</c:if>
						</td>
						
					</tr>
				</table>
				</form>
			</div>
		</div>
	<div class="col-md-2"></div>
</div>
</body>
</html>