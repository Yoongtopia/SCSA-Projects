<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dd {
	position: fixed;
	bottom: 0;
	right: 0;
}

* html .dd {
	position: absolute;
	bottom: auto;
	top: expression(eval(document.documentElement.scrollTop +50));
}

.box {
	border: 1px solid black;
	float: none;
	margin: 2px;
	float:left;
	width:31%;
	height: 150px;
}
.box:HOVER{
	border: 1px solid #FF6600;
}
.box img {
	display: block;
	width: 100%;
	height: 60%;
}
</style>
<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.js"></script>
<script src="js/classie.js"></script>
</head>
<body>
	<c:import url="m_menu.jsp"></c:import>
		<div style="padding: 10px" align="center">
			<font color="#FF6600"><b>상품 등록일순</b></font>
		</div>
		<div align="center" style="padding-left: 3%;">
		<c:choose>
			<c:when test="${mProductList.size() > 0 }">
				<c:forEach items="${mProductList}" var="product" varStatus="i">
					<a href="${pageContext.request.contextPath}/m_product_detail.do?product_num=${product.product_num}">
					<div class="box">
						<fmt:parseDate value="${product.product_date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
						<font color="lightgray"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></font><br/>
							<%-- <img style="height: " alt="" src="${pageContext.request.contextPath}/images/<c:forEach items="${product.imgList}" var="img" varStatus="i"><c:if test="${i.count eq 1}">${img.img}</c:if></c:forEach>"
							/> --%>
							<c:forEach items="${product.imgList}" var="img" varStatus="i"><c:if test="${img.img_main eq 1}"><img class="main ${product.product_status eq 1? 'sold':null}" alt="image" src="${pageContext.request.contextPath}/images/${img.img}"></c:if></c:forEach>
 						
						<c:forEach items="${product.tagList}" var="tag" varStatus="status">
							<c:if test="${status.last}"><font color="#FF6600">@</font>${tag.tag}</c:if>
						</c:forEach><br/>
						<font color="lightgray"><fmt:formatNumber
								value="${product.product_price }" pattern="#,###" />원</font>
					</div>
					</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<br />
				<br />
				<br />
				<h4>상품이 존재하지 않습니다.</h4>
			</c:otherwise>
		</c:choose>
		</div>
	<div class="dd">
		<div id="dd">
<%-- 			<a href="${pageContext.request.contextPath}/m_product_list.do"><font color="#FF6600"><i class="huge arrow sign up icon"></i></font></a>
 --%>			<a href="#"><font color="#FF6600"><i class="huge arrow sign up icon"></i></font></a>
		</div>
	</div>
	
<script type="text/javascript">
		$(function() {
			var container = $('#cont');
			container.imagesLoaded(function() {
				$container.masonry({
					itemSelector : '.box'
				});
			});

		});
</script>
</body>
</html>