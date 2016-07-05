<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.plainmodal.js"></script>
<link href="css/product_list.css" rel="stylesheet">
<script src="./js/jquery.easing.1.3.min.js"></script>
<script src="./js/jquery.plainmodal.js"></script>
<script src="./js/matching_list.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.js"></script>
<style type="text/css">
body{
	background-color: #E6E6F0;
	font-family: 맑은 고딕;
	font-size: 12px;
}
div.product {
	position: relative;
	border-radius: 10px;
	text-align: center;
	width: 450px;
	height: 500px;
	overflow: hidden;
	margin: 0 auto;
	cursor: default;
}
div.product.img {
	width: 50%;
	margin: 0px;
}

div.over {
	background-color: gray;
}

div.product span {
	line-height: 500px;
}

#result_area {
	height: 560px;
	overflow: hidden;
}

div.up { 
	width: 90px;
	position: relative;
	float: left;
	height: 400px;
}

.details{
	position: relative;
	float: left;
	width: 400px;
}

div.down { 
	width: 90px;
	position: relative;
	float: left;
	height: 400px;
}



div.tag{
	border: 1px solid #9daccc;
	background: #003366;
	padding: 3px;
	font: 14px;
	display: inline-block;
	margin: 3px;
	float: left;
	position: relative;
	top: 5px;
	font-weight: bold;
	color: white;
	cursor: default;
}
div.tag2{
	border: 1px solid #003366;
}

button[name=keep-btn]{
	font-weight: bold;
	background-color: #FF6600;
}
/* button[name=keep-btn]:hover{
	background-color: lightgrey;
	border: 1px solid lightgrey;
} */
button[name=wish-btn]{
	background-color: #ff6600;
	font-weight: bold;
}
/* button[name=wish-btn]:hover{
	background-color: #ff6600;
	border: 1px solid red;
}
 */

#mini-image{
	border-radius: 2px;
	border: 1px solid #9daccc;
	background: #e2e6f0;
	padding: 0px 3px 0px 3px;
	font: 11px;
	display: inline-block;
	margin: 1px;
	float: left;
	position: relative;
}
div.tag_box{
	width: 200px;
	overflow: hidden;
}
#target{
	position: relative;
	overflow: hidden;
	width: 600px;
	margin: 0px;
	
}
#keep_area{
	position: relative;
	float: left;
	width: 200px;
	height: 680px;
}
.table-responsive{
	width: 500px;
}
#page{
	/* position: absolute; */
	width: 650px;
	left: 200px;
}
#right-page{
	position: absolute;
	width: 330px;
	left: 950px; 
}

#keep_display{
	position: absolute;
	background-color: white;
	z-index: 3;
	border-radius: 10px;
	padding: 5px;
	margin: 5px;
}

#matching-result{
	position: relative;
	float: left;
	background-color: white;
	border-radius: 10px;
	padding: 5px;
	margin: 5px;
	width: 620px;
	z-index: 3;
	height: 160px;
}
#info-display{
	position: relative;
	float: left;
	background-color: white;
	border-radius: 10px;
	padding: 5px;
	margin: 5px;
	width: 620px;
	height: 600px;
	z-index: 4;
	overflow: hidden;
}

/* 상품 리스트 출력관련 스타일 */
#userInfo-table{
	 width: 235px;
	 position: relative;
	 float: left;
	 margin: 5px;
	 padding: 5px;
}
#product-table{
	 width: 335px;
	 position: relative;
	 float: left;
	 margin: 5px;
	 padding: 5px;
}
#not-productList{
	 width: 570px;
	 position: relative;
	 float: left;
	 margin: 5px;
	 padding: 5px;
}
h6, .h6{
	font-size: 13px;
}
#matching-result-table{
	position: absolute;
	width: 600px;
	height: 200px;
	font-size: 13px;
}

#matching-sub-result{
	position: relative;
	float: left;
	width: 600px;
	margin: 5px;
	padding: 5px;
}

#button-view{
	position: relative;
	float: left;
	width: 220px;
}
#keep-display{
	position: relative;
	float: left;
	background-color: white;
	border-radius: 10px;
	width: 200px;
	height: 680px;
	border: 1px solid lightgrey;
}

.box {
	background-color: white;
	margin: 0px;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid #d3d6db;
}

/* 이미지 퍼센트로~ */
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
	width: 180px;
	height: 180px;
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
.tag{
	margin:5px;
	background-color: #003366;
	border: 1px solid #003366;
	border-radius:0 0 0 0;
	font-size: 13px;
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
.panel-body{
	margin: 0px;
	padding: 0px;
}
.product-label{
	font-weight: bold;
}
#price-font{
	font-size: 25px;
	line-height: 25px;
}
.carousel{
	vertical-align: middle;
}
.product_detail_go{
	cursor: pointer;
}

.sub-carousel{
	position: relative;
	height: 180px;
	vertical-align: middle;
	border: 1px dotted #003366;
	width: 400px;
	margin: 20px auto 10px auto;
	border-radius: 10px;
}
.carousel-control.right{
	background-image: none; 
}
.carousel-control.left{
	background-image: none;
}
.hidden-data{
	visibility: hidden;
}
.keep{
	position: relative;
	float: left;
}
.sub-content{
	margin-top: 5px;
	margin-bottom: 5px;
	height: 47px;
	vertical-align: middle;
}
#keep-title{
	margin-top:3px;
	font-size: 13px;
}
img[name=delete_keep_btn]{
	position: relative;
	left: 65px;
	top:-175px;
	width: 50px;
	height: 50px;
}
#keep-view{
	position: relative;
	margin: 0;
}
.glyphicon-chevron-left:before{
	font-size: 45px;
	line-height: 50px;
	height: 50px;
}
.glyphicon-chevron-right:before{
	font-size: 45px;
	line-height: 50px;
	height: 50px;
}
.product_detail_go:HOVER{
	border: solid 2px #FF6600;
}
.btn-warning{
	border: #FF6600 1px solid; 
	background-color: #FF6600;
}
.btn-warning:HOVER{
	background-color: #EE9A00;
}

/* #regist_push:HOVER{
	background-color: #FFBB00;
} 

</style>
</head>
<body>
	<div id="page">
		<div id="matching-result">
			<div class="panel panel-default" style="margin: 0px; padding: 0px; height: 150px; ">
				<div class="panel-body">
					<form id="user_tags" action="match.do" method="post">
						<input type="hidden" name="product_price" value="${param.product_price}">
						<input type="hidden" name="square_num" value="${param.square_num}">
						<input type="hidden" name="tag" value="${tags}">
					</form>
					<form id="form_for_push" action="push_regist.do" method="post">
						<input type="hidden" name="product_price" value="${param.product_price}">
						<input type="hidden" name="square_num" value="${param.square_num}">
						<input type="hidden" name="tag" value="${tags}">
					</form>
					<div id="matching-result-table" class="table-responsive" align="left">
						<table id="matching-sub-result" class="table table-condensed" align="center">
							<h5 style="width: 600px" align="left">&nbsp;&nbsp;<b>${user.user_name }님께서 원하시는 상품의 조건입니다.</b></h5>
							<tr>
								<td width="100px"><b>가격</b></td>
								<td width="150px">${param.product_price}원 이하</td>
								<td width="100px"><b>지역</b></td>
								<td width="150px">Square${param.square_num}</td>
							</tr>
							<tr>
								<td><b>내가 찾는 태그</b></td>
								<td colspan="3">
									<c:forEach items="${tags}" var="tag">
									 	<div class=tag>${tag}</div>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="right" style="padding-bottom: 5px;">
									<button type="button" class="btn btn-default btn-sm" id="back_to_match">재검색</button>
									<button type="button" class="btn btn-warning btn-sm" id="regist_push">푸시등록</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div id="info-display"> 
			<div class="panel panel-default" style="height: 590px;">
			  <div class="panel-body" style="height: 590px;">
				<c:choose>
					<c:when test="${not empty list }">
						<div id="target" align="center" style="height: 590px;">
							<!-- <div> -->							
							<div class="carousel slide" id="carousel-900289" data-interval="false" style="height: 590px;">
								<div class="carousel-inner" style="height: 590px;">
									<c:forEach items="${list}" var="product" varStatus="i">
										<div class="item ${i.first? 'active':null}" style="height: 590px;">
											<div class="box col3" product_num="${product.product_num}" style="height: 590px;">
												<div class="product" id="${product.product_num}" align="center" style="width: 100%; height: 100%; height: 590px;">
													<c:forEach items="${product.imgList}" var="img" varStatus="status">
														<c:if test="${status.first }">
															<div class="carousel" align="center" style="height: 590px;">
																<div id="product_info" style="position:relative; width: 100%; height: 75px; padding-left: 10px;padding-right: 60px;" align="left">
																	<img src="./images/square/${product.square_num}.png" style="width: 68px; height: 68px; border: 1px solid #ccc; border-radius: 3px; display: inline-block; float: left; position: relative; top: 5px;" id="mini-image">
																	<div class="tag btn-default btn-xs" style="background-color: #e2e6f0; color:black;"><fmt:formatNumber value="${product.product_price }" pattern="#,###" />원</div>
																	<c:forEach items="${product.tagList}" var="tag" varStatus="status">
																		<%-- <c:if test="${status.index < 5 }"> --%>
																			<div class="tag btn btn-info btn-xs tag2">${tag.tag}</div>
																		<%-- </c:if> --%>
																	</c:forEach>
																<span style="position:absolute; right: 10px; top:-230px;"><font size="5em"color="#FF6600"><i class="small attachment basic icon"></i><b>${i.count}/${fn:length(list)}</b></font></span>
																</div>
																<img class="product_detail_go" product_num="${product.product_num}" src="${pageContext.request.contextPath}/images/${img.img}" style="width: 100%; height: 430px;">
																<div style="padding-top: 20px;">
																	<button type="button" class="btn btn-warning btn-sm" name="wish-btn" value="${product.product_num }"><i class="large gift basic icon"></i>위시리스트담기</button>&nbsp;&nbsp;&nbsp;
																	<button type="button" class="btn btn-warning btn-sm" name="keep-btn" value="${product.product_num }" id="keep-button">비교상자담기<i class="large forward basic icon"></i></button>
																</div>
																<div id="product_num" style="visibility: hidden;" product_num="${product.product_num}"></div>
															</div>
														</c:if>
													</c:forEach>
													<%-- <div class="sub-carousel" >
														<div class="sub-content">
															<table><tr valign="middle">
																<td width="50px">가격</td>
																<td><fmt:formatNumber value="${product.product_price }" pattern="#,###" />원</td>
															</tr></table>
														</div>
														<div class="sub-content" style="height: 77px">
															<table><tr valign="middle">
																<td width="50px">상품태그</td>
																<td>
																	<c:forEach items="${product.tagList}" var="tag">
																		<div class="tag">${tag.tag}</div>
																	</c:forEach>
																</td>
															</tr></table>
														</div>
														<div class="sub-content">
															<button name="keep-btn" value="${product.product_num }" id="keep-button" class="btn btn-default">비교상자담기</button>
															<button name="wish-btn" value="${product.product_num }" class="btn btn-default">위시리스트담기</button>
															<div class="hidden-data">
																<div id="user_id">${product.user.user_id }</div>
																<div id="${product.product_num}" product_num="${product.product_num}">${product.product_num}</div>
															</div>
														</div>
													</div> --%>
												</div>
											</div>
										</div>
									</c:forEach>
										<%-- <table id="product-table" class="table table-condensed">
											<tr>
												<td colspan="2" align="left" style="color: #ff6600; font-weight: bold;">상품정보</td>
											</tr>
											<tr>
												<td colspan="2">
													<c:forEach items="${product.imgList}" var="img">
														<img id="detail" src="images/${img.img}" style="height: 200px; width: 200px;">
													</c:forEach>
												</td>
											</tr>
											<tr>
												<td align="left" width="70px">상품태그</td>
												<td width="260px">	
													<div class="tag_box" align="left" style="width: 250px; height: 50px; overflow: auto; padding:1px; border:1 solid #303030;">
														<c:forEach items="${product.tagList}" var="tag">
															<div class="tag">${tag.tag}</div>
														</c:forEach>
													</div>
												</td>
											</tr>
											<tr>
												<td align="left">상품가격</td>
												<td>
													<div class="tag_box" align="left">
														${product.product_price}원
													</div>
												</td>
											</tr>
											<tr>
												<td align="left">상세설명</td>
												<td align="left">
													<div style="width: 250px; height: 50px; overflow: auto; padding:1px; border:1 solid #303030;">
														${product.product_content }
													</div>
												</td>
											</tr>
										</table> --%>

									<%-- <form method="post">
											<table id="userInfo-table" class="table table-condensed">
												<tr>
													<td>
														<div>
															<table class="table table-condensed">
																<tr>
																	<td colspan="2" align="left" style="color: #ff6600; font-weight: bold;">판매자정보</td>
																</tr>
																<tr>
																	<td width="100px">판매자아이디</td>
																	<td width="130px" class="user_id">${product.user.user_id }</td>
																</tr>
																<tr>
																	<td>이름</td>
																	<td>${product.user.user_name }</td>
																</tr>
																<tr>
																	<td>출신대학교</td>
																	<td id="univ_code" name="${product.user.univ_code }">${product.user.univ_code }</td>
																</tr>
															</table>
														</div>
														<div style="height: 150px"></div>
														<div>
															<button name="btn" class="btn btn-default btn-xs" value="${product.product_num }">KEEP하기</button>&nbsp;&nbsp;&nbsp;
															<input type="submit" class="btn btn-warning btn-xs" value="위시리스트 담기"/>
														</div>
													</td>
												</tr>
											</table>
										</form> --%>
								</div>
								<a class="left carousel-control" href="#carousel-900289" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" style="color: #ff6600; width: 50px; height: 50px; background-color: white; border-radius: 100%;"></span></a> <a class="right carousel-control" href="#carousel-900289" data-slide="next"><span class="glyphicon glyphicon-chevron-right" style="color: #ff6600; width: 50px; height: 50px; background-color: white; border-radius: 100%;"></span></a>
							</div>
						<!-- </div> -->
						</div>
					</c:when>
					<c:otherwise>
						<div id="target">
							<table id="not-productList" class="table table-condensed">
								<tr>
									<td>
										<div class="row1" align="center" style="padding-top:7em;">
											<i class="massive cart basic icon" style="color: #ff6600; margin: 0px;" %></i>
											<h5>${user.user_name }님께 적합한 상품이 존재하지 않습니다.</h4>
											<h4 class="gangjo">푸싱서비스를 이용해보세요.</h4>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</c:otherwise>
				</c:choose>
			  </div>  
			</div>	
		</div>
	</div>
	
	<div id="palet" style="position: fixed;">
		<div style="position: absolute; background-color: white; height: 700px; width: 900px; overflow-x:hidden; overflow-y:scroll; ">
			<div id="sub1_palet"></div>
		</div>
		
		<div style="position: absolute; background-color: white; height: 700px; width: 900px;  left:1300px; overflow-x:hidden; overflow-y:scroll;">
			<div id="sub2_palet"></div>
		</div>
	</div>
	
	<div id="right-page">
		<div id="keep_display">
			<div id="keep_area">
				<div id="keep-display">
					<div id="keep-title"><font size="3em" color="#FF6600"><i class="pin basic icon"></i><b>비교상자</b></font></div><br/>
					<div id="keep-view" align="center"></div>
				</div>
			</div>
		</div>
	</div>	

	
	<!-- 상품 디테일 빈곽 -->

	<!-- 상품 디테일 빈곽 -->

	<script type="text/javascript">	
		$(function() {
			
			var modal = $('#modal').plainModal({duration: 500});
			
			$("#detail").click(function() {
				 $('#modal').plainModal('open', {offset : {left:200, top:100}});
			});
			
			$("div.up").click(function() {
				$("#target").animate({
					"right" : "-=600px"
				}, "slow");
			});
			
			$("div.down").click(function() {
				$("#target").animate({
					"right" : "+=600px"
				}, "slow");
				
			});
			
			/* 매칭화면 돌아가기 */
			$("#back_to_match").click(function() {
				$("#user_tags").submit();
			});
			
			/* 푸쉬등록하기  */
			$("#regist_push").click(function() {
				$("#form_for_push").submit();
			});
			
			/* 대학교 이름 불러오기 */
			$.post("find_univ_name.do", {
				"univ_code":$("#univ_code").text()
			}, function(jsonOBJ){
				if(jsonOBJ.status){
					$("#univ_code").text(jsonOBJ.userUniv.univ_name);
				}
			},"json");
			
			var imgCount = 0;
			
			/* keep한 상품 keep-space에 전달하기 */
			$("body").on("click", "button[name=keep-btn]", function(e){
				e.preventDefault();
				var product = $("#"+$(this).val());
				var product_num = product.find("#product_num").attr("product_num");
 				$.post("find_product_info_by_product_num.do"
						,{"product_num" : $(this).val()}
						,function(jsonObj){
							if(jsonObj.status && imgCount<3){
								var size =jsonObj.product.imgList.length -1 ;
								imgCount++;
								var img = $("<img/>").attr("width", "170px").attr("height", "170px").css("border-radius","5px").css("margin-top","2px").css("border","solid 1px #003366")
								/* .attr("src", "images/"+jsonObj.product.imgList[size].img).attr('delete_product_num', product_num) */
								.attr("src", "images/"+jsonObj.product.imgList[size].img).attr('delete_product_num', product_num)
								.attr("class","product_detail_go keep_product").attr("product_num",product_num).attr('name','keep-product')
								.val(product_num);
								var button1 = $("<img/>").attr("name","delete_keep_btn").attr('delNum',product_num).attr('src','./images/contents/delete-128.png')
												.css('visibility','hidden');
								var sum = $("<div class='keepkeep'/>").append(img, button1);
								$("#keep-view").append(sum);
							}else{
								alert("3개 이상은 keep할 수 없습니다.");
							}
						},"json");
 				if(imgCount<3){
 					$(this).attr("disabled", true);
 				}
						
			});
			
			$("body").on("mouseenter",".keepkeep",function(e){
				e.stopPropagation();
				var product = $("#"+$(this).val());
				var product_num = product.find("#product_num").attr("product_num");
				$(this).css('background-color','white').css('opacity','0.7');
				$(this).children().last().css('visibility','visible');
			});
			
			$("body").on("mouseleave",".keepkeep",function(){
				$(this).removeAttr('style').css("border-radius","10px");
				$(this).children().last().css('visibility','hidden');
			});
			
			/* keep한 상품 keep-space에서 삭제하기 */
			$("body").on("click","img[name=delete_keep_btn]", function(){
				$(this).parent().remove();
				$("button[value="+$(this).attr('delNum')+"]").removeAttr('disabled');
				imgCount--;
			});
			
			var $container = $('#container');
			$container.imagesLoaded(function() {
				$container.masonry({
					itemSelector : '.box'
				});
			});
			
			/* 위시리스트 저장하기 */
			$("button[name=wish-btn]").on("click",function(){
				$.post("add_wishlist.do",
						{"product_num": $(this).val()},
						function(jsonOBJ){
							if(jsonOBJ.status){
								alert("내가 원하는 상품리스트에 추가되었습니다");
								modal.plainModal('close');
							}else{
								alert("해당 상품은 이미 위시리스트에 존재합니다.");
							}
						}, "json");
			});
			
		});
	</script>
</body>
</html>