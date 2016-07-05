<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="fonts/Semantic/css/semantic.css">
<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<!-- <script type="text/javascript" src="fonts/Semantic/javascript/semantic.js"></script> -->
<!-- <script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.js"></script> -->

<script type="text/javascript">
	$(function(){
		$('.dropdown-toggle').dropdown();
		

	});
</script>
<style>
.dropdown-menu {
	padding: 0px;
}

#container {
	padding: 0;
}
.box2 {
	float: left;
	background-color: white;
	margin: 10px 13px;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid #d3d6db;
	width: 100px;
	overflow: hidden;
	position: relative;
}
.box2 > img {
	margin-top: 3px;
	display: block;
	width: 98%;
	height: 100px;
	border-radius: 5px;
}
#back {
	position: absolute;
	top: 10px;
	left: 10px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}
img.small_stamp{
	position: absolute;
	width: 40px;
	height: 40px;
	top:5px;
	left: 5px;
	-webkit-transform:rotate(-45deg)
}

</style>
<body>
<div style="position:absolute; background-color:white; height: 700px; width: 900px; x-overflow:scroll; y-overflow:hidden;">

	    	<img src="${pageContext.request.contextPath}/images/back.png"  id="back">
<div class="panel-body" style="position: relative; padding-bottom: 0px; margin-left: 30px;">
			<h4 style="font-weight: bold;">USER DETAIL PAGE</h4>
			<h6 style="font-weight: bold;">사용자 상세정보</h6>
	    	<button type="button" class="close" style="position: absolute; top: 7px; right: 35px; color: black;">&times;</button>

 </div>
 <div style="height: 170px; width: 100%; border: 1px; solid; padding: 10px;">
 <table class="table" style="width: 80%; position: absolute; height: 150px;left: 40px;" >
 		<tr>
 			<td colspan="5" align="center" style="font-weight: bold;">사용자 상세정보</td>
 		</tr>
		<tr>
			<td style="vertical-align: middle;" rowspan="4"><img src="images/univ_logo/${univ.univ_img}"></td>
			<td style="font-weight: bold;">판매자 정보</td>
			<td>${seller.user_name} (<span class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">${seller.user_id }</a><ul class="dropdown-menu"><li><a id="sendMsg" receiver="${seller.user_id}" class="btn btn-sm" style="width:100%"><i class="large mail outline icon"></i>쪽지보내기</a></li></ul></span>)</td>
			<td style="font-weight: bold;">총 상품 개수</td>
			<td>${productCount }</td>
		</tr>
		<tr>
			<td style="font-weight: bold;">소속 대학교</td>
			<td>${univ.univ_name}</td>
			<td style="font-weight: bold;">판매중 상품</td>
			<td>${forSale }</td>
		</tr>
		<tr>
			<td style="font-weight: bold;">인증 상태</td>
					
			<c:choose>
			<c:when test="${seller.user_status == '2' }">	
				<td>인증 회원</td>
			</c:when>
			<c:otherwise>	
				<td>미인증회원</td>
			</c:otherwise>	
			</c:choose>
			<td style="font-weight: bold;">판매완료 상품</td>
			<td>${soldOut }</td>
		</tr>
		<tr>
			<td style="font-weight: bold;">이메일 주소</td>	
			<td>${seller.user_email}</td>
			<td style="font-weight: bold;">판매성사율</td>
			<td>${sellingRate }%</td>
		</tr>
  </table>	
  </div>
  <br/>
  <br/>
  <br/>
<div class="panel-body" style="position: relative; padding-bottom: 0px; margin-left: 30px;">
			<h5 style="font-weight: bold;">${seller.user_name}님의 상품목록</h5>
			<div style="height: 1px; width:770px; border: 1px; border-color: black; background-color: black;"></div>
 </div> 
 
<div id="container" style="padding-left: 5%; padding-right: 5%; position: absolute;">
	<c:forEach items="${list}" var="product" varStatus="i">					
		<div class="box2" product_num="${product.product_num}">
			<c:forEach items="${product.imgList}" var="img" varStatus="i"><c:if test="${img.img_main eq 1}"><img alt="" src="${pageContext.request.contextPath}/images/${img.img}"></c:if></c:forEach>	
		   	<c:if test="${product.product_status eq 2}">
				<img class="small_stamp" src="images/soldOut.png">
			</c:if>
		   	<div class="content">
		   		
			   	<div class="tags" style="font-size: 15px; text-align: left;">
					<c:forEach items="${product.tagList}" var="tag" varStatus="status">
						<c:if test="${status.last}">${tag.tag}</c:if>
					</c:forEach>
				</div>
				<div class="price" style="text-align: left;"><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</div>
		   	</div>
		</div>
	</c:forEach>
</div>
</div>

</body>
</html>