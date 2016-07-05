<%@page import="java.util.List"%>
<%@page import="com.scse.entity.Group"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function() {
		$("#tabs2").tabs();
	
		
		$.post("my_group_management_detail.scse", {
			"groupNum" : $(this).attr("data-value")
		}, function(jsonObj) {
		}, "json");
	});
		
	
	$(document).ready(function(){
		$(".formCheck").hide();
		$(".noticeSend").on("click", function(){
			$.post("notice_send_ajax.scse",
					{"groupNum" : $(".groupNum").val(), 
					 "leaderId" : $(".leaderId").val(),
					 "noticeTitle" : $(".noticeTitle").val(),
					 "noticeContent" : $(".noticeContent").val()
					},
					function(jsonObj){
						if(jsonObj.status){								
							$(".groupNum").val("");
							$(".leaderId").val("");
							$(".noticeTitle").val("");
							$(".noticeContent").val("");											
						}
			},"json");			
			location.href = "my_group_management_detail.scse";
		});
	});
	
		$(document).ready(function(){
			$(".blank").hide();
			
			$(".noticeUpdate").on("click", function() {
				var number = $(this).attr('value');

				var newNoticeTitle = document.getElementById("newNoticeTitle2" + number);
				var newNoticeContent = document.getElementById("newNoticeContent2" + number);
				var blankSave = document.getElementById("blankSave" + number);
				var hideCancelButton=document.getElementById("blankCancel"+number);
				
				newNoticeTitle.style.display = "";
				newNoticeContent.style.display = "";
				blankSave.style.display = "";
				hideCancelButton.style.display="";
				
				var hideNoticeTitle = document.getElementById("hideNoticeTitle" + number);
				var hideNoticeContent = document.getElementById("hideNoticeContent" + number);
				var hideButton = document.getElementById("hideUpdateButton" + number);
				var hideDeleteButton=document.getElementById("hideDeleteButton"+number);
				
				hideNoticeTitle.style.display = "none";
				hideNoticeContent.style.display = "none";
				hideButton.style.display = "none";
				hideDeleteButton.style.display="none";
			});
			
			$(".save").on("click", function() {
				var noticeNum = $(this).attr('value');

				var newNoticeTitle = document.getElementById("newNoticeTitle" + noticeNum).value;
				var newNoticeContent = document.getElementById("newNoticeContent" + noticeNum).value;
			
				$.post("notice_update_ajax.scse", {
					"noticeTitle" : newNoticeTitle,
					"noticeContent" : newNoticeContent,
					"noticeNum" : noticeNum
				}, function(jsonObj) {
					if (jsonObj.status) {
						alert("수정이 완료되었습니다.");
						location.href = "my_group_management_detail.scse";
					}
				}, "json");
				location.href = "my_group_management_detail.scse";
			});

			$(".cancel").on("click", function() {
				var number = $(this).attr('value');

				var newNoticeTitle = document.getElementById("newNoticeTitle2" + number);
				var newNoticeContent = document.getElementById("newNoticeContent2" + number);
				
				newNoticeTitle.style.display = "none";
				newNoticeContent.style.display = "none";
				
				var hideNoticeTitle = document.getElementById("hideNoticeTitle" + number);
				var hideNoticeContent = document.getElementById("hideNoticeContent" + number);
			
				hideNoticeTitle.style.display = "";
				hideNoticeContent.style.display = "";
			});	
	});
</script>
<script>


$(document).ready(
		$(".noticeSend").on("click",function(){	
			
				if ($(".noticeTitle").val() == "") {
					$("#noticeTitleFormCheck").show();
					$(".noticeTitle").focus();
					//event.preventDefault();
					return false;
				}
				if ($(".noticeContent").val() == "") {
					$("#noticeContentFormCheck").show();
					$(".noticeContent").focus();
					//event.preventDefault();
					return false;
				}			
		})	
);
	
</script>


</head>
<body>
	<div id="tabs2" style="position:relative;">
		<ul>
			<c:forEach items="${requestScope.list2 }" varStatus="groupNumbering" var="group">
				<li><a href="#tabs2-${groupNumbering.count}" id="groupNameShow">${group.groupName }</a></li>
			</c:forEach>
		</ul>
		<!-- 탭1 내용 -->				
			<%
			List<Group> grouplist2 = (List<Group>) request.getAttribute("list2");
			int i2 = 1;
			for (Group gl : grouplist2) {
		%>
		<div id="tabs2-<%=i2%>">
			<!-- 공지리스트 -->
			<input type="hidden" value="<%=gl.getGroupNum()%>" id="<%=i2%>">
				<table class="ui table segment">
				<thead>
					<tr>
						<th style="text-align: center">번호</th>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">내용</th>
						<th style="text-align: center">날짜</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${requestScope.list2 }" varStatus="status" var="list2" begin="<%=i2-1 %>" end="<%=i2-1 %>">
						<c:forEach items="${list2.groupNotice}" var="notice" varStatus="numbering">
						<c:choose>
							<c:when test="${not empty notice.noticeTitle }">
							<tr style="text-align: center">
								<td>${numbering.count }</td>
																
								<td id="hideNoticeTitle${notice.noticeNum}">${notice.noticeTitle }</td>
								<td class="blank" id="newNoticeTitle2${notice.noticeNum}">
								<input type="text" id="newNoticeTitle${notice.noticeNum }" maxlength="60" value="${notice.noticeTitle }"> 
								</td>
								
								<td id="hideNoticeContent${notice.noticeNum}">${notice.noticeContent}</td>
								<td class="blank" id="newNoticeContent2${notice.noticeNum}">
								<input type="text" id="newNoticeContent${notice.noticeNum }" maxlength="60" value="${notice.noticeContent }"> 
								</td>
								
								<td>${notice.noticeDate }</td>
								
								<td id="hideUpdateButton${notice.noticeNum }" align="center">
								<div class="ui tiny down noticeUpdate button" value="${notice.noticeNum }">
								<i class="edit icon"></i>수정	</div></td>
								
								<td class="blank" id="blankSave${notice.noticeNum }">
								<div class="ui tiny down save button" value="${notice.noticeNum }">
								<i class="save icon"></i>저장</div>
								</td>
								
								<td align="center" id="hideDeleteButton${notice.noticeNum}">								
								<div class="ui tiny down primary button">
								<a href="${pageContext.request.contextPath }/removeNotice.scse?noticeNum=${notice.noticeNum}">
								<i class="remove icon"></i>삭제
								</a>
								</div>								
								</td>		
																
								<td class="blank" id="blankCancel${notice.noticeNum }">
								<div class="ui tiny down cancel button" value="${notice.noticeNum }">
								<i class="undo icon"></i>취소</div>
								</td>																					
							</tr>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</c:forEach>			
			</tbody>							
			</table>
			<!-- 공지쓰기 -->					
			<input type="hidden" name="groupNum" class="ui small negative groupNum button" value="<%=gl.getGroupNum()%>">
			<input type="hidden" name="leaderId" class="leaderId" value="${sessionScope.user.userId}">
					
			<table class="ui table segment">
				<thead>
					<tr>
						<th colspan="3" style="text-align: center">신규 공지 보내기</th>
					<tr>
						<th style="text-align: center">제목</th>
						<th style="text-align: center">내용</th>
						<th style="text-align: center">보내기</th>
					</tr>
				</thead>
				<tbody>
					<tr>					
						<td style="width: 30%"><div class="ui input" style="width: 100%">
								<input type="text" name="noticeTitle" class="noticeTitle" placeholder="공지 제목을 입력하세요.">
							</div>
							<div class="ui red pointing above ui label formCheck" id="noticeTitleFormCheck">공지사항 제목을 입력해주세요.</div>
							</td>
						<td style="width: 60%"><div class="ui icon input loading" style="width: 100%">
								<input type="text" name="noticeContent" class="noticeContent" placeholder="공지 내용을 입력하세요.">
								<i class="icon"></i>
							</div>
							<div class="ui red pointing above ui label formCheck" id="noticeContentFormCheck">공지사항 내용을 입력해주세요.</div>
							</td>
						<td style="width: 10%">
						
							<button class="circular black tiny ui noticeSend button" >
									<i class="forward mail icon"></i>전송
							</button>							
						</td>
				</tbody>
			</table>
		</div>		
			<%
			i2 = i2 + 1;
			}
		%>	
	</div>
</body>