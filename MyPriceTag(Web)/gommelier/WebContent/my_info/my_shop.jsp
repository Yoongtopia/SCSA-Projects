<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link href="${pageContext.request.contextPath}/css/product_list.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.plainmodal.js"></script>
<script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/js/product_list.js"></script>
</head>
<body>
	
	<div class="list">
		<div class="form group">
			<div class="row">
				<h3><strong>마이페이지</strong></h3>
				<br>
				<div id="filters" class="button-group">
					<button type="button" class="button is-checked btn btn-warning" data-filter="*" value="show all">show all</button>
	 				<button type="button" class="button btn btn-warning" data-filter="numberGreaterThan50">number > 50</button>
					<button type="button" class="button is-checked btn btn-warning" data-sort-by="original-order">original order</button>
				    <button type="button" class="button btn btn-warning" data-sort-by="name">name</button>
				    <button type="button" class="button btn btn-warning" data-sort-by="symbol">symbol</button>
				    <button type="button" class="button btn btn-warning" data-sort-by="number">number</button>
				    <button type="button" class="button btn btn-warning" data-sort-by="weight">weight</button>
				</div>
			</div>
		</div>
	
	
		<div>
			<div id="palet" style="position: relative;">
				<div style="position: absolute; background-color: white; height: 700px; width: 900px; overflow: hidden;">
					<div id="sub1_palet"></div>
				</div>
			</div>
		</div>
		
		<hr>
		
		<div class="isotope" align="center">
		  <c:forEach items="${myProductList}" var="product" varStatus="i">
				
			<!-- 상품 하나 전체 form -->	
				<div class="box box1 element-item actinoid metal" data-category="actinoid" align="center">
				
					<%-- 번호 --%>
					<div class="number">${product.product_num}</div>
					
					<%-- 사진 --%>
					 <c:forEach items="${product.imgList}" var="img" varStatus="i">
					   <c:if test="${img.img_main eq 1}">
							<img class="img-rounded" alt="" src="${pageContext.request.contextPath}/images/${img.img}" height="245px" width="245px">
					   </c:if>
				   </c:forEach>	
					
					<%-- 이름 --%>
					<h3 class="name">
						<c:forEach items="${product.tagList}" var="tag">
							${tag.tag}
						</c:forEach>
					</h3>
					
					<%-- 가격 --%>
					<p class="weight">${product.product_price}</p>
					
					<%-- 선 이미지 --%>
					<img class="img" alt="line" src="./images/background/line.jpg">
					
				</div>
				
		  </c:forEach>	
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#showUserDetail").hide();
			$("#request").hide();
			$("#sendMsg").hide();
			
		});	
		
	</script>
</body>
</html>