<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">

<script type="text/javascript">
	$(document).ready(function() {

		$(document).on("click", ".attached.open", function() {
			$("#compactsidebar").css('width',"40px");
			$("#sidemenu").addClass('active');
			$("#compactsidebar").css('margin-left', "275px");
			$(this).addClass('close');
			$(this).removeClass('open');
			$("#menuContentPage").css('margin-left', "320px");
			$("#left").show();
			$("#right").hide();
			
			$.get("${pageContext.request.contextPath}/tabFavoirte.do",function(jsonObj){
				$("#favoritelist").empty();
				if(jsonObj.status){
					$(jsonObj.favorite.favList).each(function(index,item){
						var stockName=item.stockName;
						var stockCode=item.stockCode;
						$('<a/>').html(stockName+"("+stockCode+")").attr('class',"item").attr('href',"${pageContext.request.contextPath }/stock_detail.do?stockCode="+stockCode).appendTo("#favoritelist");
					});
				}else{
					$('<span/>').text("관심종목정보가 없습니다.").appendTo("#favoritelist");
				}
			});
				
			
			$.get("${pageContext.request.contextPath}/tabSimulation.do",function(jsonData) {
				var remainCash = parseInt(jsonData.simulation.remainCash);
			
				var assetEval = jsonData.simulation.evaluatedAsset;
				var profit = (((assetEval+remainCash)/(100000000))-1)*100;
				
				$("#simResult").text(remainCash.toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
			
				$("#simResult2").text(assetEval.toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
				
				var ret = profit.toFixed(2);
				if(ret>0.0000000001){
					$("#simResult3").css("color", "red");
					$("#simResult3").text(profit.toFixed(2));
				}else if(ret<-0.0000000001){
					$("#simResult3").css("color", "skyblue");
					$("#simResult3").text(profit.toFixed(2));
				}else{
					$("#simResult3").css("color", "white");
					$("#simResult3").text(profit.toFixed(2));
				}
		
			});
			
		});

		$(document).on("click", ".attached.close", function() {
			$("#compactsidebar").css('width',"70px");
			$(this).addClass('open');
			$(this).removeClass('close');
			$("#sidemenu").removeClass('active');
			$("#compactsidebar").css('margin-left', "0px");
			$("#menuContentPage").css('margin-left', "0px");
			$("#left").hide();
			$("#right").show();
		});
	});	
</script>

<style>
#compactsidebar {
	position: fixed;
	margin-left: 0;
	font-family: 'Nanum Gothic' !important;
	width: 70px;
	height: 58px;
	transition: width .25s, margin-left .3s;
}

#sidemenu {
	font-family: 'Nanum Gothic' !important;
}

.hovereffect {
	width: 155px;
	overflow: hidden;
}

#display_investment td{
	padding-bottom : 5px;
	padding-top : 5px;
	white-space: nowrap;
}

</style>

<div class="ui black huge launch right attached button open" id="compactsidebar">
	<i id="right" class="right arrow icon"></i>
	<i id="left" class="left arrow icon" style="display:none"></i>
	<!-- <span class="text">My</span> -->
</div>

<div class="ui large vertical inverted labeled icon sidebar menu" id="sidemenu">
	<div>
		<img src="${pageContext.request.contextPath }/img/whiteso.png" style="width:70px; margin:20px auto;">
	</div>	

	<div>
		<span class="item" style="color:white; font-weight:bold;">관심주식</span>
	</div>
	<div id="favoritelist">
	
	</div>
	

	<div class="item">
		<table id="display_investment">
			<tr><td style="text-align: center; color: white; font-weight: bold;" colspan="2">나의 투자 현황</td></tr>
			<tr>
			<td>남은 현금: </td>
			<td style="text-align: center;"><span id="simResult"><fmt:formatNumber>0</fmt:formatNumber></span></td></tr>
			<tr><td>자산 벨류: </td>
			<td style="text-align: center;"><span id="simResult2"><fmt:formatNumber>0</fmt:formatNumber></span></td>
			</tr>
			<tr>
			<td>총 투자 수익률: </td>
			<td style="text-align: center;"><span id="simResult3"></span>%</td>
			</tr>
		</table>
	</div>


</div>



