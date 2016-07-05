<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	 /* QnA 작성 로그인 체크 @ sy */
	//로그아웃 상태 @ sy
	if( $("#memberIdCheck").val() == null ||  $("#memberIdCheck").val() == "" ){
		$("#sendQnaForm").attr("disabled", "disabled").val("질문을 등록하려면 로그인해 주세요.");
		$("#sendQnaBtn").attr("disabled", "disabled");
	// 로그인 상태 @ sy
	} else {
		// QnA 매니저이지만 해당 행사 담당자 아닐 때 & 관리자일 때 @ sy 
		if(  $("#memberTypeCheck").val() != "member" && $("#rightEventManager").val() == "N"){
			$("#sendQnaForm").attr("disabled", "disabled").val("아직 행사 담당자 승인이 완료되지 않았습니다..");	
		}	
	} // end if
	
	
	
	//답글 버튼을 눌렀다가 취소하고 싶을때 빈공간을 클릭하면 원상태로 돌아온다
	$("#contentReviewListDiv").click(function(){
		$("#sendReply").hide();
		$("#sendQna").show();
	});
	
});

/* QnA 삭제 @ sy */
function deleteQna(eventQnaNum) {
	$.getJSON("${pageContext.request.contextPath}/qna_delete.do",
			{ "eventQnaNum" : eventQnaNum, "eventId" : $("#eventIdOACheck").val() },
			function(jsonObj) {
				if(jsonObj.status){
					alert("Q&A가 삭제되었습니다.");
					$("#"+jsonObj.talkId).hide();
					if(jsonObj.emptyList == "true"){
						var noQna =  $('<div style="margin-top: 130px; text-align: center; color: gray;"><div/>')
						.html("등록된 Q&A가 없습니다.:)");
						$("#contentReviewListDiv").append( noQna );
					}
				} else {
					alert("fail");
				}
			});
}

/* QnA 답변 등록 폼 바꾸기 @sy */
function addReplyForm(eventQnaNum) {
	$.getJSON("${pageContext.request.contextPath}/qna_check_reply.do",
						{ "eventQnaNum" : eventQnaNum },
						function(jsonObj) {
							if(jsonObj.status == "true"){
								alert("이미 답변을 등록한 질문글입니다");
							} else {
								var sendReplyForm = document.getElementById("sendReplyForm");
								$("#sendReply").show();
								$("#sendQna").hide();
								sendReplyForm.focus();
								$("#eventQnaNumMod").val(eventQnaNum);
							}
						});
	return false;
}




</script>
<style type="text/css">
	textarea{ resize: none; }
	.qnaQuestion { width: 480px; }
	.qnaRightFirstTd {
		padding-right: 0;
		padding-left: 130px; 
		width: 450px;
	}
	.qnaRightSecondTd { 
		vertical-align: top;
		padding: 20px 10px 5px 0; 
	}
	.qnaRightDiv {
		background-color: #FFF; 
		border-right: 0; 
		padding: 10px 15px; 
		width: 320px; 
		text-align: left; 
		box-shadow: 3px 2px 3px silver; 
		font-size: small;"
	}
	.qnaLeftFirstTd { 
		vertical-align: top;
		padding: 20px 0 5px 10px; 
	}
	.qnaLeftSecondTd { padding-left: 0; }
	.qnaLeftDiv {
		background-color: #E8F4EE; 
		border-left: 0; 
		padding: 10px 15px; 
		width: 320px; 
		box-shadow: 3px 2px 3px silver; 
		font-size: small;"
	}
	.qnaRegArea {
		border: 1px solid #ddd;
		border-top: 0;
		background-color: #F5F5F5;
		height: 60px;
		width: 500px;
	}
	.qnaRegForm {
		width: 428px;
		height: 60px;
		margin: 0;
		display: inline-block;
		border-radius: 0;
	}
	.qnaRegBtn {
		background-color: #eee; 
		width:70px; 
		height: 60px; 
		margin: 0 -4px 0 -4px; 
		padding: 7px 6px; 
		display: inline-block; 
		border-radius: 0;
	}
	
	
</style>
</head>
<body>
<input type="hidden" id="eventIdOACheck" value="${event.eventId}">
<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
	QNA<font size="4em"><strong>&nbsp;노리 QNA</strong></font>
</h2>
<br/>

	<div style="margin: 0 30px;">
	<center>
		<c:choose>
					<c:when test="${sessionScope.userId!=null&&sessionScope.member.memberStatus=='승인' }">
    <div class="row" id="contentReviewList" style="padding: 20px;">
			
			<div id="contentReviewListDiv" style="border: 1px solid #ddd; border-bottom: 0;
									background-color: #F5F5F5; height: 340px; width: 500px;
									overflow-y: scroll; padding: 20px 0;">
			
			<c:choose>
				<c:when test="${ qnaList != null && qnaList.size() != 0 }">
					<!-- Q&A가 있을 때 -->
					<c:forEach items="${qnaList}" var="qna">
						
						<c:choose>
							<c:when test="${qna.member.memberType == 'member'}">
								<!-- 회원이 올린 질문글 -->
								<table class="qnaQuestion" id="qnaTalk${qna.eventQnaNum}">
									<tr>
										<td class="qnaRightFirstTd">
											<div class="well qnaRightDiv">
												<b>${qna.member.nickname}</b><br/>
												${qna.eventQnaContent}
													<a href="#" style="font-size: smaller; font-weight: bold;"
														id="replyQna" onclick="return addReplyForm('${qna.eventQnaNum}');">답글</a>			
												<br/>
												<span style="font-size: smaller;">${qna.eventQnaRegDate}</span>
												<c:if test="${sessionScope.member.userId == qna.member.userId }">
													<a href="#contentReviewList" style="font-size: smaller; font-weight: bold;" 
														id="deleteQna" onclick="deleteQna('${qna.eventQnaNum}');">삭제</a>
												</c:if>
											</div>
										</td>
										<td class="qnaRightSecondTd">
											<img src="${pageContext.request.contextPath}/images/event/rightTriangle.png"/>
										</td>
									</tr>
								</table>
								
							</c:when>
							<c:otherwise>
								<!-- 이벤트매니저 혹은 관리자가 답변한 글 -->
								<table class="qnaAnswer" id="qnaTalk${qna.eventQnaNum}">
									<tr>
										<td class="qnaLeftFirstTd">
											<img src="${pageContext.request.contextPath}/images/event/leftTriangle.png"/>
										</td>
										<td class="qnaLeftSecondTd">
											<div class="well qnaLeftDiv">
												<b>${qna.member.nickname} | 행사담당자</b><br/>
												${qna.eventQnaContent}
												<br/>
												<span style="font-size: smaller;">${qna.eventQnaRegDate}</span>
												<c:if test="${sessionScope.member.userId == qna.member.userId }">
													<a href="#contentReviewList" style="font-size: smaller; font-weight: bold;"
														id="deleteQna" onclick="deleteQna('${qna.eventQnaNum}');">삭제</a>
												</c:if>
											</div>
										</td>
									</tr>
								</table>
								
							</c:otherwise>
						</c:choose>
						
					</c:forEach>					
				</c:when>
				
				<c:otherwise>
					<!-- Q&A가 없을 때 -->
					<div style="margin-top: 130px; text-align: center; color: gray;">
						행사에 대해 궁금한 점은<br/>Q&A로 남겨주세요:)
					</div>
				</c:otherwise>
			</c:choose>
			</div>
			<input type="hidden" id="memberIdCheck" value="${member.userId}" />
			<input type="hidden" id="memberTypeCheck" value="${member.memberType}" />
			<input type="hidden" id="rightEventManager" value="${rightEventManager}" />
			
 			<div id="sendQna" class="qnaRegArea">
				<form method="post" id="submitQnaForm" action="${pageContext.request.contextPath}/add_qna_manager_page.do">
					<textarea id="sendQnaForm" name="eventQnaContent" 
										class="form-control qnaRegForm" style="height: 60px;"></textarea>
					<input type="hidden" name="sendQnaEventId" value="${event.eventId}"/>
					<input type="submit" id="sendQnaBtn" class="btn btn-default qnaRegBtn" value="보내기"/>
				</form>
			</div> 
			
			<div id="sendReply" class="qnaRegArea" style="display: none;" >
				<form method="post" action="${pageContext.request.contextPath}/add_qna_reply_manager_page.do">
					<textarea id="sendReplyForm" name="eventReplyContent" 
										class="form-control qnaRegForm" style="height: 60px;"></textarea>
					<input type="submit" id="sendReplyBtn"  value="답글달기"
								class="btn btn-default qnaRegBtn" style="background-color: #E8F4EE;"/>
					<input type="hidden" name="sendReplyEventId" value="${event.eventId}"/>
				</form>
			</div>
	
		</div>
		<br/><br/><br/>
		</c:when>
			<c:otherwise>
						<div id="progressArea">
							<div class="progress progress-striped active" >
		 	  					<div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
		 	   						<span class="sr-only">50% Complete</span>
		 	  					</div>
		    				</div>
		    					<label style="color: #3a9e8b;">
		    					<span class="glyphicon glyphicon-time"></span> 행사담당자 승인 절차가 진행 중입니다.</label>
	        				<br/><br/><br/>
		  				</div>
					</c:otherwise>
				</c:choose>
			</center>
	</div>

</body>
</html>