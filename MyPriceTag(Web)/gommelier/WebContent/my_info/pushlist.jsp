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
<script src="./js/pushing_list.js"></script>
<script src="js/imagesloaded.pkgd.js"></script>
<link href="css/product_list.css" rel="stylesheet">

<style type="text/css">
/* 글꼴 */
body {
	font-family: 맑은 고딕;
	font-size: 12px;
	background-color: #E6E6F0;
}

/* 온오프 */

/* 리스트 */
.page{
	width: 1000px;
	float:right;
}
.list-group {
	position: relative;
	float: left;
	width: 600px;
	background-color: white;
	border-radius: 10px;
	padding: 15px;
	margin: 10px;
}
.list-group2 {
	position: relative;
	width: 600px;
	background-color: white;
	border-radius: 10px;
	padding: 15px;
	margin: 70px;
}

#register-guide{
	position: relative;
	float: left;
	background-color: white;
	border-radius: 10px;
	padding: 5px;
	margin-top: 10px;
	width: 375px;
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

a:HOVER{
	
}

a.act {
	background-color: #FAE0D4;
}
.on{
	color:#FF6600;
}
i.trash:HOVER {
	color: skyblue;
}
.btn{
	vertical-align: top;
}
.btns > i.icon{
line-height: 1.4;
}
i.massive.basic.icon{
margin-right:0px;
color: #FF6600;
}
.trash icon{
padding-left: 30px;
}

/* h3, .h3{
font-weight: bold;
} */
.row1{
margin-top: 130px;
margin-bottom: 130px;
}
.row2{
margin-top: 50px;
margin-bottom: 30px;
}
.head{
background-color: #FF6600;
color: white;
width: 570px;
height: 30px;
font-size: 14px;
font-weight: bold;
}

td, th{
padding-left: 24px;
}

#area{
width: 90px;
}

#push{
width: 86px;
}

#delete{
width: 70px;
}

i.huge.icon{
margin-right:0px;
color: #FF6600;
}

/* 모달로 띠우는 거 관련 CSS - 일단 가져다 붙였기 때문에 정리해야함 */
.col3 {
	width: 600px;
	position: relative;
}
.col4 {
	width: 20%;
}

.box img {
	margin-top: 3px;
	display: block;
	width: 50%;
	border-radius: 5px;
}
.box2 img {
	margin-top: 3px;
	display: block;
	width: 98%;
	border-radius: 5px;
}

.content {
	padding: 2px;
	height: 50px;
	width: 100%;
	overflow: hidden;
	color: black;
	padding: 5px;
	font-size: 12px;
}

.price {
	color: #888;
}

div.delbtn {
	position: absolute;
	top: 5px;
	right: 7px;
	height: auto;
	width: 20px;
}

div.delbtn img {
	background-color: white;
 	border: 1px solid black;
 	border-radius: 5px;
}
div.delbtn img:HOVER {
	background-color:  gray;
}
div.delbtn > ul > li:HOVER {
	color:  #ff6600;
}
.act{
	cursor: pointer;
}
.tag{
	background-color: #003366;
	border: 1px solid #003366;
	border-radius:0 0 0 0;
}
.btn-warning{
	border: #FF6600 1px solid; 
	background-color: #FF6600;
}
.btn-warning:HOVER{
	background-color: #EE9A00;
}

</style>
</head>
<body>
	<!--<span style="font-size: 10px; float: right">guide : 
			<span class="btn btn-default btn-xs" style="font-size: 9px">금액/지역</span>
			<span class="btn btn-info btn-xs" style="font-size: 9px">상품태그</span>					
		</span> -->
	
	<form method="post" action="push_remove_by_num.do">
	
		
			
			<div class="page">
				<div class="list-group">
				<h3 align="left"><b>MY PUSH LIST</b></h3>
				<br/>
					<table class="head">
						<tr>
							
							<td id="area">지 역</td>
							<td>가 격</td>
							<td>상품 정보</td>
							<td id="push" align="right" style="padding-right:0px" width="20%">푸시 신청</td>
							<td id="delete" align="right" style="padding-right:17px" width="13%">삭제</td>
						</tr>
					</table>
			<c:choose>
				<c:when test="${not empty pushListById}">		
					<c:forEach items="${pushListById}" var="push" varStatus="status">
							<a ${push.push_check eq 2? '' : 'href="push_detail.do?push_num=' }${push.push_check eq 2? null:push.push_num}${push.push_check eq 2? null:'"'} product_num="${push.push_check eq 2? push.product_num:push.push_num}" class="list-group-item ${push.push_check eq 2? 'act':''}"> 									
							<%-- <a href="${push.push_check eq 2? '#':'push_detail.do?push_num='}${push.push_check eq 2? null:push.push_num}" product_num="${push.push_check eq 2? push.product_num:push.push_num}" class="list-group-item ${push.push_check eq 2? 'act':''}"> --%>
								<div style="float: left; width: 410px; line-height: 2;" align="left" >	
									<div style="display: inline-block; float: left; margin-right: 5px;">
									<img src="images/square/${push.push_square}.png" style="height: 50px; border: 1px solid #ccc; border-radius: 3px;">
									<span class="btn btn-default btn-xs" ><fmt:formatNumber value="${push.push_price}" pattern="#,###" />원 이하</span>
									</div >
									<div style="display: inline-block; width: 240px;"><c:forEach items="${push.pushTagList }" var="pushTag"><span class="btn btn-info btn-xs tag">${pushTag.push_tag}</span> </c:forEach></div>
								</div>
								<div class="btns" style="float: right; height: 50px;">
									<i class="big mobile icon ${push.push_status eq 1? 'on':null}" name="on_off_btn" push_num='${push.push_num}' push_status='${push.push_status}' style="font-size:36px;"></i>&nbsp;&nbsp;&nbsp;
									<i class="big trash basic icon" name="trash" push_num='${push.push_num}' style="font-size:30px;"></i>					
								</div>
							</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="row2" align="center">
						<i class="huge bell outline icon"></i>
						<br/>
						<br/>
						<h4>신청한 푸싱서비스가 없습니다.</h4>
					</div>
				</c:otherwise>
			</c:choose>	
					<br>
				<button type="button" class="btn btn-warning btn-sm" id="addBtn">추가하기</button>
				
				</div>
				
			
		<div id="register-guide">
			<div class="table-responsive" align="left" style="width: 380px;">
				<br/>
				<table class="table table-condensed" style="width: 360px;">
					<tr>
						<td width="80px" rowspan="6" align="center">
							<img alt="question-mark" width="40px" height="60px" src="./images/contents/item5.png">
						</td>
						<td width="280px"><span class="gangjo">푸싱서비스란?</span></td>
					</tr>
					<tr>
						<td>
							푸싱서비스는 고객분들이 찾는 제품이 MyPriceTag에 등록될 경우 '실시간 
							문자 알림'을 제공해드리는 서비스입니다. 
							<br/>저희 MyPriceTag에 마음에 드는 상품이 없거나 다른 상품을 원하실 때, 
							계속 MyPriceTag에 방문하실 필요없이
							상품이 등록될 때마다 실시간으로 문자 알림을 제공해드립니다.
							<br/>이제 MyPriceTag의 푸싱서비스를 통해 내가 찾는 상품을 실시간으로 
							확인하세요.  
						</td>
					</tr>
					<tr>
						<td width="280px"><span class="gangjo">푸싱서비스 이용 방법</span></td>
					</tr>
					<tr>
						<td>
							<b>Step 1. 푸싱서비스 등록</b>
							<br/>매칭서비스 결과 마음에 드는 상품이 없을 경우, 상단의 '푸시등록' 버튼을 눌러
							푸싱서비스를 등록할 수 있습니다. 
							<br/>이때, 옆에 '재검색' 버튼을 눌러 푸싱서비스를 원하는
							상품의 조건을 얼마든지 변경할 수 있습니다. 
						</td>
					</tr>
					<tr>
						<td>
							<b>Step 2. 푸싱서비스 변경</b>
							<br/>푸싱서비스에 이미 등록된 상품이더라도 '지역', '가격', '상품 정보'를 눌러
							언제든지 상품의 조건을 변경할 수 있습니다.
							<br/>또한, 특정 상품의 푸싱서비스를 잠시 멈추거나 재사용하고 싶은 경우 '푸시 신청'
							아이콘을 클릭하여 언제든지 서비스 이용 여부를 변경할 수 있습니다.
						</td>
					</tr>
					<tr>
						<td>
							<b>Step 3. 푸싱서비스 삭제</b>
							<br/>각 상품의 '삭제' 아이콘을 클릭하여 푸싱서비스에 등록된 상품을 삭제할 수 있습니다.
						</td>
					</tr>
					<tr>
						<td rowspan="2"></td>
						<td></td>
					</tr>
					<tr>
					
						<td></td>
					</tr>
				</table>
			</div>
		</div>
				
	</div>	
		
	</form>	
	
	<div id="palet" style="position: fixed;">
		<div style="position: absolute; background-color: white; height: 700px; width: 900px; overflow-x:hidden; overflow-y:scroll; ">
			<div id="sub1_palet"></div>
		</div>
		
		<div style="position: absolute; background-color: white; height: 700px; width: 900px;  left:1300px; overflow-x:hidden; overflow-y:scroll;">
			<div id="sub2_palet"></div>
		</div>
	</div>
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
				window.location.href = 'push_remove_by_num.do?push_num=' + $(this).attr("push_num");

			}
		});
		
		$("#addBtn").click(function(){
			location.href="./match.do?chk=push";
		});
		
		$("body").on("click",".btns",function(){
			$(".btns").stopPropagation();
		});

	});
	</script>
</body>
</html>