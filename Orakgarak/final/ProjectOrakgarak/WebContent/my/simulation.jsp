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
	width:900px;
}

.table.simulation{
	font-size: 0.9em;
}

.ui.header:first-child {
	margin-top: 30px;
	
}


</style>

	<div id="my_simulation" class="contentstyle">
		<div style="min-height: 620px">
		<h2 style="width:900px; margin: 0 auto; padding:10px">
			<i class="teal gamepad icon">
			</i> 나의 모의투자 시뮬레이션
		</h2>
		<hr>
		<!-- <div class="ui header">
		<span style="padding: 10px;background-color:#575E61; color:white">
			<i class="gamepad icon"></i> 나의 모의투자 시뮬레이션
		</span>
		</div> -->

<div style="float:right; margin-right: 20px; font-weight: bold;">나의 현재 평가 자산 : \ <fmt:formatNumber>${requestScope.simulation.evaluatedAsset }</fmt:formatNumber></div><br/><br/>
<div style="float:right; margin-right: 20px; margin-bottom: 15px; font-weight: bold">현재 남은 현금 : \ <fmt:formatNumber>${requestScope.simulation.remainCash }</fmt:formatNumber></div>
	
	<c:if test="${simulation.simList[0].tradeSeq ne 0 }">
	
	<table class="ui sortable table segment simulation">
		<thead>
		<tr>
		<th class="descending">종목명(종목코드)</th>
		<th class="descending">매입가</th>
		<th class="descending">매입수량</th>
		<th class="descending">매입일자</th>
		<th class="descending">매입평가액</th>
		<th class="descending">현재가격</th>
		<th class="descending">현재평가액</th>
		<th class="descending">수익률</th>
		<th>매도</th>
		</tr>
		</thead>
		<tbody>
		
		
		<c:forEach items="${simulation.simList }" var="sim">
		<tr>
		<td><a href="${pageContext.request.contextPath }/stock_detail.do?stockCode=${sim.code}">${sim.name }(${sim.code })</a></td>
		<td><fmt:formatNumber>${sim.oldPrice }</fmt:formatNumber></td>
		<td><fmt:formatNumber>${sim.oldVolume }</fmt:formatNumber></td>
		<td>${sim.date }</td>
		<td><fmt:formatNumber>${sim.oldPrice * sim.oldVolume }</fmt:formatNumber></td>
		<td><fmt:formatNumber>${sim.currentPrice }</fmt:formatNumber></td>
		<td><fmt:formatNumber>${sim.currentPrice * sim.oldVolume }</fmt:formatNumber></td>
		<td class="percentage_td"><fmt:formatNumber value="${(sim.currentPrice div sim.oldPrice - 1)*100}" pattern="0.00"></fmt:formatNumber>%</td>
		<td><a href="${pageContext.request.contextPath }/sell.do?tradeSeq=${sim.tradeSeq}&code=${sim.code}">
			<i class="money icon" style="color:gray"></i></a>
		</td>
		</tr>
		
		
		
		</c:forEach>
		
		</tbody>
		
		</table>
		
		</c:if>
		
		<c:if test="${simulation.simList[0].tradeSeq eq 0 }">
			모의투자 내역이 없습니다.
		</c:if>
		
		</div>



	</div>