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
	 /* QnA �ۼ� �α��� üũ @ sy */
	//�α׾ƿ� ���� @ sy
	if( $("#memberIdCheck").val() == null ||  $("#memberIdCheck").val() == "" ){
		$("#sendQnaForm").attr("disabled", "disabled").val("������ ����Ϸ��� �α����� �ּ���.");
		$("#sendQnaBtn").attr("disabled", "disabled");
	// �α��� ���� @ sy
	} else {
		// QnA �Ŵ��������� �ش� ��� ����� �ƴ� �� & �������� �� @ sy 
		if(  $("#memberTypeCheck").val() != "member" && $("#rightEventManager").val() == "N"){
			$("#sendQnaForm").attr("disabled", "disabled").val("���� ��� ����� ������ �Ϸ���� �ʾҽ��ϴ�..");	
		}	
	} // end if
	
	
	
	//��� ��ư�� �����ٰ� ����ϰ� ������ ������� Ŭ���ϸ� �����·� ���ƿ´�
	$("#contentReviewListDiv").click(function(){
		$("#sendReply").hide();
		$("#sendQna").show();
	});
	
});

/* QnA ���� @ sy */
function deleteQna(eventQnaNum) {
	$.getJSON("${pageContext.request.contextPath}/qna_delete.do",
			{ "eventQnaNum" : eventQnaNum, "eventId" : $("#eventIdOACheck").val() },
			function(jsonObj) {
				if(jsonObj.status){
					alert("Q&A�� �����Ǿ����ϴ�.");
					$("#"+jsonObj.talkId).hide();
					if(jsonObj.emptyList == "true"){
						var noQna =  $('<div style="margin-top: 130px; text-align: center; color: gray;"><div/>')
						.html("��ϵ� Q&A�� �����ϴ�.:)");
						$("#contentReviewListDiv").append( noQna );
					}
				} else {
					alert("fail");
				}
			});
}

/* QnA �亯 ��� �� �ٲٱ� @sy */
function addReplyForm(eventQnaNum) {
	$.getJSON("${pageContext.request.contextPath}/qna_check_reply.do",
						{ "eventQnaNum" : eventQnaNum },
						function(jsonObj) {
							if(jsonObj.status == "true"){
								alert("�̹� �亯�� ����� �������Դϴ�");
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
	QNA<font size="4em"><strong>&nbsp;�븮 QNA</strong></font>
</h2>
<br/>

	<div style="margin: 0 30px;">
	<center>
		<c:choose>
					<c:when test="${sessionScope.userId!=null&&sessionScope.member.memberStatus=='����' }">
    <div class="row" id="contentReviewList" style="padding: 20px;">
			
			<div id="contentReviewListDiv" style="border: 1px solid #ddd; border-bottom: 0;
									background-color: #F5F5F5; height: 340px; width: 500px;
									overflow-y: scroll; padding: 20px 0;">
			
			<c:choose>
				<c:when test="${ qnaList != null && qnaList.size() != 0 }">
					<!-- Q&A�� ���� �� -->
					<c:forEach items="${qnaList}" var="qna">
						
						<c:choose>
							<c:when test="${qna.member.memberType == 'member'}">
								<!-- ȸ���� �ø� ������ -->
								<table class="qnaQuestion" id="qnaTalk${qna.eventQnaNum}">
									<tr>
										<td class="qnaRightFirstTd">
											<div class="well qnaRightDiv">
												<b>${qna.member.nickname}</b><br/>
												${qna.eventQnaContent}
													<a href="#" style="font-size: smaller; font-weight: bold;"
														id="replyQna" onclick="return addReplyForm('${qna.eventQnaNum}');">���</a>			
												<br/>
												<span style="font-size: smaller;">${qna.eventQnaRegDate}</span>
												<c:if test="${sessionScope.member.userId == qna.member.userId }">
													<a href="#contentReviewList" style="font-size: smaller; font-weight: bold;" 
														id="deleteQna" onclick="deleteQna('${qna.eventQnaNum}');">����</a>
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
								<!-- �̺�Ʈ�Ŵ��� Ȥ�� �����ڰ� �亯�� �� -->
								<table class="qnaAnswer" id="qnaTalk${qna.eventQnaNum}">
									<tr>
										<td class="qnaLeftFirstTd">
											<img src="${pageContext.request.contextPath}/images/event/leftTriangle.png"/>
										</td>
										<td class="qnaLeftSecondTd">
											<div class="well qnaLeftDiv">
												<b>${qna.member.nickname} | �������</b><br/>
												${qna.eventQnaContent}
												<br/>
												<span style="font-size: smaller;">${qna.eventQnaRegDate}</span>
												<c:if test="${sessionScope.member.userId == qna.member.userId }">
													<a href="#contentReviewList" style="font-size: smaller; font-weight: bold;"
														id="deleteQna" onclick="deleteQna('${qna.eventQnaNum}');">����</a>
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
					<!-- Q&A�� ���� �� -->
					<div style="margin-top: 130px; text-align: center; color: gray;">
						��翡 ���� �ñ��� ����<br/>Q&A�� �����ּ���:)
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
					<input type="submit" id="sendQnaBtn" class="btn btn-default qnaRegBtn" value="������"/>
				</form>
			</div> 
			
			<div id="sendReply" class="qnaRegArea" style="display: none;" >
				<form method="post" action="${pageContext.request.contextPath}/add_qna_reply_manager_page.do">
					<textarea id="sendReplyForm" name="eventReplyContent" 
										class="form-control qnaRegForm" style="height: 60px;"></textarea>
					<input type="submit" id="sendReplyBtn"  value="��۴ޱ�"
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
		    					<span class="glyphicon glyphicon-time"></span> ������� ���� ������ ���� ���Դϴ�.</label>
	        				<br/><br/><br/>
		  				</div>
					</c:otherwise>
				</c:choose>
			</center>
	</div>

</body>
</html>