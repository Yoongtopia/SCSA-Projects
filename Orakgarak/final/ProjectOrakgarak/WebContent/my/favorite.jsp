<%@page import="com.orakgarak.util.ParseUtil"%>
<%@page import="com.orakgarak.vo.UserAdvanced"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>

<script src="js/jquery.tablesort.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.min.css">


<script type="text/javascript">
	$(document).ready(function() {
		
		$('table').tablesort();
		
	});

</script>

<style type="text/css">
body {
	font-family: 'Nanum Gothic';
}

#updatebox {
	width: 60%;
	margin: 40px auto;
}

a {
	text-decoration: none;
}

#out {
	float: right;
	margin-top: 10px;
	font-weight: 700;
	background-color: #D95C5C;
	color: #FFF;
	width: 82px;
	height: 42px;
}
#out:hover{
	color: #D95C5C;
	background-color: #FFF;
}
th{
	text-align:center !important;
}
td{
	text-align: center;
}

table{
	margin:20px auto !important;
}

.small.ui.button{
	color: #e74c3c;
	margin: 20px 0 0 50px;
}

.small.ui.button:hover{
	background: #e74c3c;
	color: #FFF;
}

.contentstyle{
	width:930px;
	margin:0 auto;
}

.ui.sortable.table.segment{
	width:930px;
}

.ui.header{
	width: 900px;
	margin: 0 auto;
}
.ui.header:first-child {
	margin-top: 30px;
}
</style>


<div id="my_favorite" class="contentstyle">
	
		<div style="min-height: 620px">
			
			<h2 class="ui header"
				style="padding: 10px; width:900px; margin: 0 auto;">
				<i class="red star icon"></i> 나의 관심주식
			</h2>
			<hr style="width: 900px">
			
		<!-- <div class="ui header">
		<span style="padding: 10px;background-color: #575E61; color:white">
			<i class="star icon"></i> 나의 관심주식
		</span>
		</div> -->
		<c:if test="${not empty requestScope.favorite.favList }">

			<table class="ui sortable table segment">
				<thead>
					<tr>
						<th>종목명(종목코드)</th>
						<th class="descending">DCF</th>
						<th class="descending">Multiple</th>
						<th class="descending">Risk</th>
						<th class="descending">BigData</th>
						<th class="descending">Trend</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.favorite.favList }" var="fav">
						<tr>
							<td><a href="${pageContext.request.contextPath }/stock_detail.do?stockCode=${fav.stockCode}">${fav.stockName}(${fav.stockCode})</a></td>
							<td>${fav.scoreDcf }</td>
							<td>${fav.scoreMultiple }</td>
							<td>${fav.scoreRisk }</td>
							<td>${fav.scoreBigData }</td>
							<td>${fav.scoreTrend }</td>
							<td><a href="${pageContext.request.contextPath}/deleteFav.do?userId=${sessionScope.user.email}&codeForFav=${fav.stockCode}">
							<i class="trash icon" style="color:gray">
							</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						
					</tr>
				</tfoot>
			</table>


			
		</c:if>
		<c:if test="${empty requestScope.favorite.favList }">
		<div>관심주식이 현재 없습니다.</div>
		</c:if>
	</div>

	</div>