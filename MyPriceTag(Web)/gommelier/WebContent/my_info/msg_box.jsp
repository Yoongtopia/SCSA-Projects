<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body{
	font-family: 맑은 고딕;
	font-size: 12px;
	background-color: #E6E6F0;
}
.row1{
	width: 600px;
	margin: auto auto;
}
.allList{
	position: relative;
	top: 10px;
	width: 750px;
	background-color: white;
	border-radius: 10px;
	padding: 20px;
	margin: 5px;
}
td[role=view_msg]{
	cursor: pointer;
}
active{
	background-color: #a9a9a9";
}
#myTab{
	width: 600px;
	background-color: white;
	padding: 10px;
	padding-bottom: 0px;
	padding-left: 2px;
	border-radius: 10px 10px 0 0;
	}

.nav-tabs > li.active > a,
.nav-tabs > li.active > a:hover,
.nav-tabs > li.active > a:focus{
	border-bottom: 2px solid #FF6600;
}	
.form group{
	position: relative;
}	
.head{
	background-color: #FF6600;
	color: white;
	font-family: 맑은 고딕;
	text-align: center;
}
.group{
	background-color: white;
	padding: 10px;
	border-radius: 0 0 10px 10px;
}
.btn-warning{
	background-color: #FF6600;
	border: 1px solid #FF6600;
}
.table-striped{
	border-bottom: 2px solid #FF6600;
}
	
</style>
</head>
<body>
<!-- 여긴 유노 코드 -->
<div class="allList">
<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="msg_list_by_receiver_id.do" data-toggle="tab" id="receiveBtn" >받은쪽지함</a></li>
  <li><a href="msg_list_by_sender_id.do" data-toggle="tab" id="sendBtn">보낸쪽지함</a></li>
</ul>

<div class="form group">
	<form method="post" action="${chk eq 'rc'? 'msg_receiver_remove_by_num.do':'msg_sender_remove_by_num.do'}" name="form" id="delete_from">
		<div class="row1" align="center">
			<h4 class="title"><b>${chk eq 'rc'? '받은쪽지함':'보낸쪽지함'}</b></h4><br/>
			<table class="table table-striped">
			 <thead>
				<tr class="head">
					<th width="7%"><input type="checkbox" id="chk_all" class="total"></th>
					<th width="13%">${chk eq 'rc'? '보낸 사람':'받은 사람'}</th>
					<th width="22%">내 용</th>
					<th width="15%">날 짜</th>
				</tr>		
				<c:choose>
					<c:when test="${not empty msgList}">
						<c:forEach items="${msgList}" var="msg">
							<tr>
								<td><input type="checkbox" name="msg_num" value="${msg.msg_num}" id="check_delete"></td>
								<td>${chk eq 'rc'? msg.user_id_sender:msg.user_id_receiver}</td>
								<td role="view_msg" msg_num="${msg.msg_num}">${fn:substring(msg.msg_content, 0, 15)}
								${fn:length(msg.msg_content) > 15? '...':''}</td>
								<fmt:parseDate value="${msg.msg_date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
								<td><fmt:formatDate value="${date}" pattern="MM월 dd일 HH시 mm분"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td colspan="4">보관중인 메시지가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<table align="center">
				<tr>
					<td colspan="4">
						<a id="send_new_msg" class="btn btn-warning btn-sm" ><i class="large sign out icon"></i>쪽지보내기</a>
						<button class="btn btn-warning btn-sm" type="submit" id="delete_msg" disabled="disabled"><i class="large trash icon"></i>삭 제</button>
					</td>
				</tr>
			</table>	
		</div>
	</form>
	
		<br/>
			<div align="center">${pageLink}
				<form id="frm" method="get">
					<input type="hidden" name="pageNo" id="pageNo"/>
				</form>
			</div>
	
</div>
</div>
<script type="text/javascript">
	$(function() {
		/* 삭제 하기 버튼 확인 */
		/* $btn = $("#delete_msg");
		$(":checkbox, #chk_all").click(function() {
			if($(":checkbox:checked").length > 0){
				$btn.removeAttr("disabled");
			}else{
				$btn.attr('disabled','disabled');
			}
		}); */
		
		/* 삭제 하기 버튼 확인 */
		$btn = $("#delete_msg");
		$(":checkbox").click(function() {
			if($("input:checkbox[name='msg_num']").is(':checked') == true){
				$btn.removeAttr("disabled");
			}else{
				$btn.attr('disabled','disabled');
			}
		});

		/* 새쪽지 보내기 */
		$("#send_new_msg").click(function(e) {
 			e.preventDefault();
			window.open("send_msg_page.do", "_blank", "height=350,width=400,location=0,right=0,bottom=0");
			
		});
		
		var detail_action = "msg_detail.do?msg_num=";
		var status = '${chk}';
		if (status == 'rc') {
			detail_action =  "msg_detail_by_receiver.do?msg_num=";
		}
		
		/* 메시지 디테일 */
		$("td[role=view_msg]").click(function() {
			window.open(detail_action+$(this).attr("msg_num"), "_blank", "height=350,width=400");
		});
		
		/* 전체석택 */
		$("#chk_all").click(function() {
			$("input[name=msg_num]").prop("checked", $(this).prop("checked"));
			if($("input:checkbox[id='chk_all']").is(':checked') == true){
				$btn.removeAttr("disabled");
			}else{
				$btn.attr('disabled','disabled');
			}
		});
		
		/* 현재상태?? */
		var	where = "${chk}";
		if (where != 'rc') {
			$("#sendBtn").parent().addClass("active");
			$("#receiveBtn").parent().removeClass("active");
		}
		
		$('#myTab a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
			});
			
		$("#receiveBtn, #sendBtn").click(function(){
			var href = $(this).attr("href");
			window.location.href = href+"?pageNo=1";
			/* $(this).parent().addClass("active");
			$("#sendBtn").parent().removeClass("active");
			$("#myinfoUpdateForm").show();
			$("#certificateForm").hide(); */
		});
	});
	var action = "${chk eq 'rc'? 'msg_list_by_receiver_id.do':'msg_list_by_sender_id.do'}"
	/*  */
	function pagelist(cpage){
		document.getElementById("pageNo").value = cpage;
		var frm = document.getElementById("frm");
		frm.action = action;
		frm.submit();
		
	}
</script>
<!-- 밑에는 동원이형 코드 -->			
		<%-- 	<c:choose>
				<c:when test="${msgList ne null}">
				<form method="post" id="receiver_msg" action="${pageContext.request.contextPath}/msg_receiver_remove_by_num.do">
					<h3 class="title">받은쪽지함</h3>
					<br>
						<table class="table table-striped">
								<tr>
									<th><input type="checkbox" class="total" name="msg_all_num" value=${msg.msg_all_num }></th>
									<th>번호</th>
									<th>보낸 사람</th>
									<th>내용</th>
									<th>날짜</th>
								</tr>
							<c:choose>
								<c:when test="${not empty msgList}">
									<c:forEach items="${msgList }" var="msg">
										<tr>
											<td><input type="checkbox" class="msg_num" name="msg_num" value=${msg.msg_num }></td>
											<td>${msg.msg_num }</td>
											<td>${msg.user_id_sender}</td>
											<td id="view_msg_button">${msg.msg_content }</td>
											<td>${msg.msg_date }</td>
										</tr>
									</c:forEach>
									<input type="hidden" id="msgExistCheck" value="exist">
								</c:when>
								<c:otherwise>
									<tr align="center">
										<td colspan="5">보관중인 메시지가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						
						<table align="center">
							<tr>
								<td colspan="5">
									<button type="submit" class="btn btn-warning btn-sm" id="delete_msg_button"><i class="large trash icon"></i>삭제</button>
									<button class="btn btn-warning btn-sm" type="button" id="move_receive_msg_button" name="move_send_msg_button"><i class="large sign in icon"></i>받은쪽지함</button>
									<button class="btn btn-warning btn-sm" type="button" id="move_send_msg_button" name="move_send_msg_button"><i class="large sign out icon"></i>보낸쪽지함</button>
								</td>
							</tr>
						</table>
						
					</form>
				</c:when>

				<c:when test="${not empty sendMsgList }">
					<form method="post" id="send_msg" action="${pageContext.request.contextPath}/msg_sender_remove_by_num.do">
					<h3 class="title"></h3>
					<br>
						<table class="table table-striped">
						<tr>
							<th><input type="checkbox" class="total" name="msg_all_num" value=${msg.msg_all_num }></th>
							<th id="sendMsgExistCheck">번호</th>
							<th>받은 사람</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
					<c:forEach items="${sendMsgList }" var="msg">
						<tr>
							<td><input type="checkbox" class="msg_num" name="msg_num" class="delete_msg"></td>
							<td>${msg.msg_num }</td>
							<td>${msg.user_id_receiver }</td>
							<td>${msg.msg_content }</td>
							<td>${msg.msg_date }</td>
						</tr>
					</c:forEach>
						</table>
					
						<table align="center">
							<tr>
								<td colspan="5">
									<button type="submit" class="btn btn-warning btn-sm" id="delete_msg_button"><i class="large trash icon"></i>삭제</button>
									<button class="btn btn-warning btn-sm" type="button" id="move_receive_msg_button" name="move_send_msg_button"><i class="large sign in icon"></i>받은쪽지함</button>
									<button class="btn btn-warning btn-sm" type="button" id="move_send_msg_button" name="move_send_msg_button"><i class="large sign out icon"></i>보낸쪽지함</button>
								</td>
							</tr>
						</table>
					
					</form>
				</c:when>
				
				<c:otherwise>
					<input type="hidden" id="sendMsgExistCheck" value="exist">
					<h3 class="title"></h3>
					<br>
					<table class="table table-striped">
						<tr>
							<th><input type="checkbox" class="total" name="msg_all_num" value=${msg.msg_all_num }></th>
							<th>번호</th>
							<th>받은 사람</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
						<tr align="center">
							<td colspan="5">보관중인 메시지가 존재하지 않습니다.</td>
						</tr>
					</table>
					
					<table align="center">
						<tr>
							<td colspan="5">
								<button type="submit" class="btn btn-warning btn-sm" id="delete_msg_button"><i class="large trash icon"></i>삭제</button>
								<button class="btn btn-warning btn-sm" type="button" id="move_receive_msg_button" name="move_send_msg_button"><i class="large sign in icon"></i>받은쪽지함</button>
								<button class="btn btn-warning btn-sm" type="button" id="move_send_msg_button" name="move_send_msg_button"><i class="large sign out icon"></i>보낸쪽지함</button>
								<button class="btn btn-warning btn-sm" type="button" id="send_new_msg"><i class="large sign out icon"></i>쪽지보내기</button>
							</td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose> 
			<!-- <script type="text/javascript">

	$(document).ready(function(){
		
		$("#move_send_msg_button").on("click",function(){
			location.href="${pageContext.request.contextPath}/msg_list_by_sender_id.do?user_id_sender=${user.user_id}";
		});
		
		$("#move_receive_msg_button").on("click",function(){
			location.href="${pageContext.request.contextPath}/msg_list_by_receiver_id.do";
		});
		
		$("#view_msg_button").on("click",function(){
			$.post("${pageContext.request.contextPath}/msg_detail_by_num.do"
					,{"msg_num" : 1}
					,function(){
						window.open("");
					}
					,"json");
		});
		
		/* 현재 받은쪽지함에 있는 상태를 표현 */
		if($("#msgExistCheck").val() !=null){
			$(".title").text("받은쪽지함");
			$("#move_receive_msg_button").attr("disabled", "true").attr("style", "background-color: #a9a9a9");
			$("#move_send_msg_button").removeAttr("disabled").removeAttr("style");
		}
		
		/* 현재 보낸쪽지함에 있는 상태를 표현 */
		if($("#sendMsgExistCheck").val() !=null){
			$(".title").text("보낸쪽지함");
			$("#move_send_msg_button").attr("disabled", "true").attr("style", "background-color: #a9a9a9");
			$("#move_receive_msg_button").removeAttr("disabled").removeAttr("style");
		}
		
		/* 삭제버튼 클릭시 강제로 form 타게 하는 것 */
		$("#delete_msg_button").click(function() {
			$("#receiver_msg", "#send_msg").submit();
		});
		
		/* 전체 체크박스 선택 및 해제 */
	 	$(".total").click(function(){
	 		if( $(this).is(":checked") == true ){
			$(".msg_num").prop("checked", true);
	 		}
	 		else{
	 		$(".msg_num").prop("checked", false);
	 		}
		});
			
	});
</script> -->
			--%>	
</body>
</html>