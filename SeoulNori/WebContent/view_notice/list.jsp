<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	/* $(function() {
		
		var browserHeight = document.documentElement.clientHeight;
		var bodyHeight = document.getElementById("mainBody").getBoundingClientRect().height;
		$("#seoulnoriFooter").css("display", "block");
		if(browserHeight-bodyHeight >= 120){
			$("#mainDiv").css("height", "694px");	
			$("#seoulnoriFooter").css("display", "block");
		}
	}); */
	
	function pagelist(cpage){
		
		document.getElementById("pageNo").value=cpage;
		var frm = document.getElementById("frm");
		frm.action="notice_list.do";

		frm.submit();
	}

</script>



<title>Insert title here</title>
</head>
<body>
<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
		<div class="col-md-8" id="mainDiv">
			<h2 style="margin-bottom: -20px; color: #4f8c70;">
				NOTICE <font size="4em"><strong>공지사항</strong></font> 
			</h2>
		
			<div class="row" style="padding: 20px 0 20px 0; " >
			
				<table style="width: 860px; margin-bottom: 10px; margin-top: -15px;" >
					<tr>
						<td align="right">
							<form method="post" action="${pageContext.request.contextPath }/notice_search.do?">
								<div>
									<input type="text" class="form-control" name="noticeTitle" 
												style="width: 150px; height: 31px; display: inline-block; border-color: #4f8c70;">
									<button type="submit" class="btn btn-default btn-sm" 
													style="font-size: small; color: #4f8c70; border-color: #4f8c70;" >검색</button>&nbsp;&nbsp;
								</div>
							</form>
						</td>				
					</tr>					
				</table>
				
				<div style="margin-bottom: 20px;">
					<table class="table table-hover" 
								style="border-bottom: 2px solid #4f8c70; border-top: 2px solid #4f8c70; color: #4f8c70;">
						<!-- style="border:1px solid black; border-right-color:white; border-left-color: white; width: 800px;"  cellspacing="0"> -->
						<tr style="border-bottom: 1px solid #4f8c70;">
							<th style="width: 125px; text-align: center;">글번호</th>
							<th style="width: 398px; text-align: center;">제목</th>
							<th style="width: 165px; text-align: center;">작성자</th>
							<th style="width: 165px; text-align: center;">등록일</th>
						</tr>
						<c:choose>
							<c:when test="${noticeList!=null&&noticeList.size()>0 }">
								<c:forEach items="${noticeList }" var="notice" varStatus="status">
									<tr>
										<td style="text-align: center; width: 125px; vertical-align: middle;"> ${notice.noticeNum}</td>
										<td style="padding: 8px 15px 8px 25px; width: 398px; vertical-align: middle;">
											<div style="display:inline-block; width: 348px;">
												<a href="${pageContext.request.contextPath }/notice_detail.do?noticeNum=${notice.noticeNum}"
														style="color: #4f8c70;">
													<strong>${notice.noticeTitle}</strong>
												</a>
											</div>
										</td>
										<td style="text-align: center; width: 165px; vertical-align: middle;">${notice.member.nickname }</td>
										<td style="text-align: center; width: 165px; vertical-align: middle;">${notice.noticeRegDate }</td>
									</tr>
									
								</c:forEach>
								</table><br/>
									<div align="center">${pageLink }
										<form id="frm" method="post">
										<input type="hidden" name="pageNo" id="pageNo"/>
										</form>
									</div>
							</c:when>
							<c:otherwise>
								<tr><td colspan="5" align="center">공지사항이 존재하지 않습니다.</td>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				
				<div style="text-align: right; margin-top: -10px;">
					<c:if test="${sessionScope.member.memberType=='admin' }">
						<button class="btn btn-default"
										style="border-color: #4f8c70; color: #4f8c70; font-weight: bold;" 
										onclick="location.href='${pageContext.request.contextPath}/notice_add_form.do'">새 글 작성</button>
					</c:if>
				</div>
				
			</div>
			
			<%-- <c:if test="${sessionScope.member.memberType=='admin' }">
				<button onclick="location.href='${pageContext.request.contextPath}/notice_add_form.do'">NEW</button>
			</c:if> --%>
			
		</div>
	<div class="col-md-2"></div>
</div>
</body>
</html>