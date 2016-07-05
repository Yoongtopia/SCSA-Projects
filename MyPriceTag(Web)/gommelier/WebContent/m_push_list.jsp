<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/jquery.switchButton.css">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script src="js/jquery.easing.1.3.min.js"></script>
<script src="js/jquery.plainmodal.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/jquery.switchButton.js"></script>
<style type="text/css">
/* 글꼴 */
body{
	font-family: 맑은 고딕;
	font-size: 12px;
}

/* 온오프 */

/* 리스트 */
.list-group{
	width: 100%;
}
.list-group-item{
	overflow: hidden;
}
.list-group-item > div.cont {
	float: left;
}
.list-group-item > div.on_off_btn {
	float: right;

}
.list-group-item > div.chk_box {
	float: right;
}
</style>
</head>
<body>
<c:import url="m_menu.jsp"></c:import>
<div style="width: 100%;">
	<form method="post" action="m_push_remove_by_num.do">
		<div class="list-group">
			<div align="center" style="padding: 10px"><font color="#FF6600"><b>나의 푸쉬 목록</b></font></div>
				<div style="font-size: 10px; float: right; margin-right: 10px;">guide : 
					<span class="btn btn-default btn-xs" style="font-size: 9px">금액/지역</span>
					<span class="btn btn-info btn-xs" style="font-size: 9px">상품태그</span>
				</div>
			<br/>
			<div style="width: 100%;">
			<c:forEach items="${pushListById }" var="push" varStatus="status">
				<c:choose>
					<c:when test="${push.push_check == 2}">
						<a href="m_product_detail.do?product_num=${push.product_num}" class="list-group-item" style="border-color: #FF6600;">
							<div style="float: left;">
								<h5 class="list-group-item-heading">
									<span class="btn btn-default btn-xs">${push.push_price }원 이하</span>
									<span class="btn btn-default btn-xs">Square${push.push_square }</span>
									<c:forEach items="${push.pushTagList }" var="pushTag"><span class="btn btn-info btn-xs">${pushTag.push_tag}</span> </c:forEach>
								</h5>
							</div>
					<input  style="float: right;" type="checkbox" name="push_num" value='${push.push_num}'>
					<div class="switch-wrapper" style="float: right;">
						<input  class="on_off" type="checkbox" name="push_status" push_num='${push.push_num}' value='${push.push_status}' ${push.push_status eq 1? 'checked':null}> 
					</div>
						</a>
					</c:when>
					<c:otherwise>
						<a class="list-group-item">
							<div style="float: left;">
								<h5 class="list-group-item-heading">
									<span class="btn btn-default btn-xs">${push.push_price }원 이하</span>
									<span class="btn btn-default btn-xs">Square${push.push_square }</span>
									<c:forEach items="${push.pushTagList }" var="pushTag"><span class="btn btn-info btn-xs">${pushTag.push_tag}</span> </c:forEach>
								</h5>
							</div>
					<input  style="float: right;" type="checkbox" name="push_num" value='${push.push_num}'>
					<div class="switch-wrapper" style="float: right;">
						<input  class="on_off" type="checkbox" name="push_status" push_num='${push.push_num}' value='${push.push_status}' ${push.push_status eq 1? 'checked':null}> 
					</div>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
		</div>
		<div align="right" style="margin-right: 10px;">
		<button type="submit" class="btn btn-default btn-sm" id="deleteBtn">삭제하기</button>
		</div>
	</form>	
	<script type="text/javascript">
	$(function() {
		$("input[name=push_status]").change(function() {
			push_num = $(this).attr("push_num");
			if ($(this).val() == 1) {
				push_status = 2;			
			} else {
				push_status = 1;
			}
			$(this).val(push_status);
			
			$.getJSON("push_status_change.do",
					{"push_num" : push_num,"push_status" : push_status}, 
					function(jsonOBJ) {
						alert("상태변경" + jsonOBJ.status)
					});
		});
		
		$("#addBtn").on("click",function(){
			location.href="./match.do";
		});
		
		$("input.on_off").switchButton({labels_placement: "right"});
	});
	</script>
	</div>
</body>
</html>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.easing.1.3.min.js"></script>
<script src="js/jquery.plainmodal.js"></script>
<script src="js/isotope.pkgd.min.js"></script>

<style type="text/css">
/* 글꼴 */
body {
	font-family: 맑은 고딕;
	font-size: 12px;
}

/* 온오프 */

/* 리스트 */
.list-group {
	width: 95%;
}

.list-group-item {
	overflow: hidden;
}


.list-group-item>div.cont {
	float: left;
}

.list-group-item>div.chk_box {
	float: right;
	display: inline-block;
}

a.act {
	background-color: #FAE0D4;
}

a.act:HOVER{
	border: solid 1px #FF6600;
}
.on{
	color: #FF6600;
}
i.trash:HOVER {
	color: #cb4437;
}

.btns > i.icon{
line-height: 2.5;
}



</style>
</head>
<body>
<c:import url="m_menu.jsp"></c:import>
	<!--<span style="font-size: 10px; float: right">guide : 
			<span class="btn btn-default btn-xs" style="font-size: 9px">금액/지역</span>
			<span class="btn btn-info btn-xs" style="font-size: 9px">상품태그</span>					
		</span> -->
<div align="center">
<div style="width:100%;">
	<form method="post" action="push_remove_by_num.do">
		<div class="list-group">
		<div style="padding: 10px;"><font color="#FF6600"><b>나의 푸쉬 목록</b></font></div>
			<div align="left">
			<c:forEach items="${pushListById}" var="push" varStatus="status">
				<a href="${push.push_check eq 2? 'm_product_detail.do?product_num=':'#'}${push.push_check eq 2? push.product_num:push.push_num}" class="list-group-item ${push.push_check eq 2? 'act':''}">
					<div style="float: left;">	
						<img src="images/square/${push.push_square}.png" style="height: 50px; border: 1px solid #ccc; border-radius: 3px;">
						<span class="btn btn-default btn-xs"><fmt:formatNumber value="${push.push_price}" pattern="#,###" />원 이하</span><br/><div style="padding: 3px;"></div>
						<c:forEach items="${push.pushTagList }" var="pushTag"><span style="margin-top: 2px; margin: 2px;" class="btn btn-info btn-xs">${pushTag.push_tag}</span> </c:forEach>
					</div>
					<div class="btns" style="float: right; height: auto;">
						<i class="bell outline icon ${push.push_status eq 1? 'on':null}" name="on_off_btn" push_num='${push.push_num}' push_status='${push.push_status}' style="font-size: 20px;"></i>
						<i class="trash icon" name="trash" style="font-size: 20px;"push_num='${push.push_num}'></i>					
					</div>
				</a><div style="padding-top: 1px;"></div>
			</c:forEach>
			</div>
		</div>
	</form>	
	<script type="text/javascript">
	$(function() {
		$("i[name=on_off_btn]").click(function(e) {
			e.preventDefault();
			push_num = $(this).attr("push_num");
			push_status = $(this).attr("push_status");
			if (push_status == 1) {
				push_status = 2;
				$(this).removeClass("on");
			} else {
				push_status = 1;
				$(this).addClass("on");
			}
			$(this).attr("push_status", push_status);
			
			$.getJSON("push_status_change.do",
					{"push_num" : push_num,"push_status" : push_status});
		});

		$("i[name=trash]").click(function(e) {
			e.preventDefault();
			if (confirm("삭제하시겠습니까?")) {
				window.location.href = 'm_push_remove_by_num.do?push_num=' + $(this).attr("push_num");

			}
		});
		
		$("#addBtn").click(function(){
			location.href="./match.do?chk=push";
		});
		
	});
	</script>
	</div>
</div>
</body>
</html>