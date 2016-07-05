<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/product_list.css" rel="stylesheet">
<script src="./js/jquery.easing.1.3.min.js"></script>
<script src="./js/jquery.plainmodal.js"></script>
<script src="./js/product_list.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.js"></script>
<style type="text/css">
body {
	background-color: #E6E6F0;
}
.list-group2 {
	position: relative;
	width: 600px;
	background-color: white;
	border-radius: 10px;
	padding: 15px;
	margin: 70px;
}
.box {
	float: left;
	background-color: white;
	margin: 10px;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid #d3d6db;
}
/* 이미지 퍼센트로~ */
.col3 {
	width: 25%;
}
.col4 {
	width: 20%;
}

.box > img.main {
	margin-top: 3px;
	display: block;
	width: 98%;
	border-radius: 5px;
}

.box:HOVER{
	border-color: #FF6600;
	border-width: 3px;
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

img.stamp{
	width: 80px;
	position: absolute;
	top: 5px;
	left: 5px;
	-webkit-transform:rotate(-45deg)
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

/* 상품 판매완료는 회색!! sold 클래스 주면 됨*/
img.sold{
/* 	-webkit-filter: grayscale(1);	 */
}

img.gear{
width: 20px;
}

i.massive.basic.icon{
margin-right:0px;
color: #FF6600;
}

/* h3, .h3{
font-weight: bold;
} */
.row1{
margin-top: 130px;
margin-bottom: 130px;
}

svg{
	width: 100px;
	height: 100px;
	position: fixed;
	right: 10px;
	top: 70px;
	z-index: 1000;
}
path{
	cursor: pointer;
}
.header{
	float: right;
	font-size: 1em;
	margin-right: 30px;
	margin-top: 20px;
}
</style>
</head>
<body>
<!-- 지역정보 -->
<div style="background-color: #ff6600; width: 80%; height:3em; ; color:white; margin-bottom: 2em; margin-top: 1em;">
		<c:choose>
			<c:when test="${chk eq null }">
			<c:forEach items="${list}" var="p" varStatus="st">
				<c:if test="${st.last}">
				<span style="float: left; font-size: 1.5em; margin-left: 30px; margin-top: 5px;"><i class="large grid layout icon"></i>PRODUCT LIST</span>
					<c:choose>
						<c:when test="${p.square_num == 1 }">
							<span class="header">SQUARE ${p.square_num}<i class="right arrow icon"></i> 서울 동북부<i class="right arrow icon"></i> ${fn:length(list)}개 상품</span>
						</c:when>
						<c:when test="${p.square_num == 2 }">
							<span class="header">SQUARE ${p.square_num}<i class="right arrow icon"></i> 서울 북부<i class="right arrow icon"></i> ${fn:length(list)}개 상품</span>
						</c:when>
						<c:when test="${p.square_num == 3 }">
							<span class="header">SQUARE ${p.square_num}<i class="right arrow icon"></i> 서울 서북부<i class="right arrow icon"></i> ${fn:length(list)}개 상품</span>
						</c:when>
						<c:when test="${p.square_num == 4 }">
							<span class="header">SQUARE ${p.square_num}<i class="right arrow icon"></i> 서울 남서부<i class="right arrow icon"></i> ${fn:length(list)}개 상품</span>
						</c:when>
						<c:otherwise>
							<span class="header">SQUARE ${p.square_num}<i class="right arrow icon"></i> 서울 남동부<i class="right arrow icon"></i> ${fn:length(list)}개 상품</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			</c:when>
			<c:when test="${chk eq 'mine' }">
				<span style="float: left; font-size: 1.5em; margin-left: 30px; margin-top: 5px;"><i class="large grid layout icon"></i>MY SHOP</span>
				<span class="header"><i class="attachment icon"></i>${fn:length(list)}개 상품</span>
			</c:when>
			<c:when test="${chk eq 'wish' }">
				<span style="float: left; font-size: 1.5em; margin-left: 30px; margin-top: 5px;"><i class="large grid layout icon"></i>MY WISH LIST</span>
				<span class="header"><i class="attachment icon"></i>${fn:length(list)}개 상품</span>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
</div>

<c:import url="seoul_map.jsp"/>

<!-- 잇힝 아하하하 -->
<div id="container" style="padding-left: 10%; padding-right: 10%">
	<c:choose>
		<c:when test="${not empty list}">
			<c:forEach items="${list}" var="product" varStatus="i">						
				<div class="box col3" product_num="${product.product_num}">
					<c:forEach items="${product.imgList}" var="img" varStatus="i"><c:if test="${img.img_main eq 1}"><img class="main ${product.product_status eq 1? 'sold':null}" alt="image.." src="${pageContext.request.contextPath}/images/${img.img}"></c:if></c:forEach>	
				   	<div class="content">
				   		<c:if test="${chk ne null}">
						   	<div class="delbtn dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img class="gear" src="images/gear.png"></a>
								<ul class="dropdown-menu">
									<li class="del" product_num="${product.product_num}">삭제</li>
									<c:if test="${chk eq 'mine'}">
									<li class="edit">수정</li>
									<li class="sold_out" product_num="${product.product_num}" product_status="${product.product_status }">판매완료</li>
									</c:if>		
								
								</ul>
						   	</div>
				   		</c:if>
					   						
					   	<div class="tags" style="font-size: 15px; text-align: left;">
							<c:forEach items="${product.tagList}" var="tag" varStatus="status">
								<c:if test="${status.last}">${tag.tag}</c:if>
							</c:forEach>
						</div>
						<div class="price" style="text-align: left;"><fmt:formatNumber value="${product.product_price}" pattern="#,###" />원</div>
				   		<c:if test="${product.product_status eq 2}">
					   		<img class="stamp" src="images/soldOut.png">
				   		</c:if>
				   	</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
				<br/>
				<c:if test="${chk eq 'wish'}">
				<div class="list-group2" align="center">
						<div class="row1" align="center">
							<i class="massive yellow cart basic icon"></i>
							<h3>등록한 상품이 없습니다.</h3>
						</div>
				</div>
				</c:if>
				<c:if test="${chk eq 'mine'}">
				<div class="list-group2" align="center">
						<div class="row1" align="center">
							<i class="massive yellow cart basic icon"></i>
							<h3>등록한 상품이 없습니다.</h3>
						</div>
				</div>
				</c:if>
		</c:otherwise>
	</c:choose>
</div>
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
		/* 코드는 이게 끝!! */
		var $container = $('#container');
		$container.imagesLoaded(function() {
			$container.masonry({
				itemSelector : '.box'
			});
		});

		var chk = "${chk}"
		var target_url = "delete_product_by_num.do";
		if (chk == "wish") {
			target_url = "delete_wishlist.do"
		}

		var square_num;
		square_num = "${param.square_num}";
		$(".Square" + square_num).attr("class", function(index, classNames) {
			return classNames + ' clicked';
		});

		/* confirm 버튼 활성화 */
		$("ul.dropdown-menu > li.del").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				$.getJSON(target_url, {
					"product_num" : $(this).attr("product_num")
				}, function(jsonOBJ) {
					if (jsonOBJ.status) {
						location.reload();
					} else {
						alert("상품삭제에 실패하였습니다.");
					}
				});
			}
		});

		$("li.sold_out").click(function() {

			$.getJSON("product_update_status.do", {
				"product_num" : $(this).attr("product_num"),
				"product_status" : $(this).attr("product_status")
			}, function(result) {
				if (result) {
					alert("성공");
					window.reload();
				}
			});

		});
		
		$(".edit").click(function() {
			
		})

	});
</script>
</body>
</html>