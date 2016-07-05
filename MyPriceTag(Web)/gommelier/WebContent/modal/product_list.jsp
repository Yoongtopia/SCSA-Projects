<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>

	<div id="filters" class="button-group">  <button class="button is-checked" data-filter="*">show all</button>
	  <button class="button" data-filter="numberGreaterThan50">number > 50</button>
	</div>
	
	${productListById}
	
	<div id="sorts" class="button-group">  
	<button class="button is-checked" data-sort-by="original-order">original order</button>
	  <button class="button" data-sort-by="name">name</button>
	  <button class="button" data-sort-by="symbol">symbol</button>
	  <button class="button" data-sort-by="number">number</button>
	  <button class="button" data-sort-by="weight">weight</button>
	</div>

	<div class="isotope">
		<c:forEach items="${productListById}" var="product" varStatus="i">
			<div class="element-item actinoid metal" data-category="actinoid">
				<img alt="" src="${pageContext.request.contextPath}/images/<c:forEach items="${product.imgList}" var="img" varStatus="i"><c:if test="${i.count eq 1}">${img.img}</c:if></c:forEach>" height="180px" width="180px">
				<h3 class="name">
					<c:forEach items="${product.tagList}" var="tag">
						${tag.tag}
					</c:forEach>
				</h3>
				<p class="symbol">P${i.count}</p>
				<p class="number">${product.product_num}</p>
				<p class="weight">${product.product_price}</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>