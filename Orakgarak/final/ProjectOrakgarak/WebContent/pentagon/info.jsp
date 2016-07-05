<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>
<script src="./js/modernizr.custom.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.min.css">

<script
	src="${pageContext.request.contextPath }/js/report_slider/bjqs-1.3.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/report_slider/bjqs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/report_slider/demo.css">
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css' />

<script type="text/javascript">
	$(document).ready(function() {
		
		$.ajax({
			url : "http://dart.fss.or.kr/api/search.json",
			data : {
				auth : "f82b30410b781329ac2a086daa64f89260e364f2", //인증키
				callback : "callback", //json 객체를 ajax로 받기위해서는 콜백함수로 래핑하는 작업이 필요함
								      //금감원은 callback이라는 함수로 제공하고 있음
				fin_rpt : "Y",		//최종본만 검색되게 함.
				crp_cd : "${requestScope.code}", //종목코드
				start_dt : "19990101", //검색시작일
				bsn_tp : "A001",
				
			},
			dataType : "jsonp",
			jsonp : "callback",
			
			success : function(jsonObj){
				
				$(jsonObj.list).each(function(index,item){
					
					/* var td1 = $("<td/>").text(item.crp_nm); */
					var td2 = $("<td/>").append($("<a/>").attr("href","http://dart.fss.or.kr/dsaf001/main.do?rcpNo=" + item.rcp_no).text(item.rpt_nm));
					var td3 = $("<td/>").append($("<a/>").text(item.rcp_dt));
					/* var td4 = $("<td/>").append($("<a/>").attr("rcp_no",item.rcp_no).text(item.rcp_no).addClass("btn_getReport")); */
					
					$("<tr/>").append(td2, td3).appendTo("#important_report");
					
				});
			}
			
		});//end click event()
		
		
		
		$('#banner-fade').bjqs({
		    height      : 650,
		    width       : 850,
		    responsive  : true
		  });

		$("td:contains(-999,999,999)").text('-');

	});
</script>
<style type="text/css">

.content{
height: 650px;
width:700px;

margin: 0px auto;
padding : 10px 75px 10px 75px;
background-color: #f0f0f0;
	border-radius : 30px 30px 30px 30px;
	font-family: 'Nanum Gothic';
	font-size: 20px;
}


th {
	width: 120px !important;
	font-size: 13px;
	font-weight: 700;
	text-align: center;
}

.parent {
	background: lightgray;
}

#bsTable,#isTable,#cfTable {
	text-align: center;
	height: 10px;
	font-size: 12px;
	white-space: nowrap;
	
}

#important_report{
	margin : 0px auto;
	white-space: nowrap;
	padding-top : 20px;
}

#important_report td{
	padding: 5px;
	text-align: center;
}

#important_report th{
	font-size : 20px;
	padding: 5px;
}

#important_report a:link {
text-decoration : none;
	color: #e64a3c;
}

h5 {
	float: right;
}
</style>
</head>
<body>

	<div id="banner-fade">
		<ul class="bjqs">

			<li>
				<!-- ----------------------------------------------------------- -->
				<div class="content">
					<!-- BS 테이블 -->
					<div id="bs_table">
						<div>
							<h1>재무상태표</h1>
							<hr>
							<h5>단위 : 억원</h5>
						</div>
						<table class="ui small table segment" id="bsTable" border="1"
							width="867px">
							<tr class="parent">
								<th>재무상태표</th>
								<c:forEach items="${bsList }" var="list">
									<td>${list.name }</td>
								</c:forEach>
							</tr>
							<tr>
								<th>유동자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs1 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>당좌자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs2 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>재고자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs14 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>비유동자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs30 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>투자자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs31 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>유형자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs44}</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>무형자산</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs54 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>자산총계</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs70 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>유동부채</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs72 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>비유동부채</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs97 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>부채총계</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs121}</fmt:formatNumber></td>
								</c:forEach>
							</tr>
						
							<tr>
								<th>이익잉여금</th>
								<c:forEach items="${bsList }" var="list">
									<td><fmt:formatNumber>${list.bs144 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
						</table>
					</div>
				</div>
			</li>
			<li>
				<div class="content">


					<!-- ICS 테이블 -->
					<div id="ics_table">
						<h1>손익계산서</h1>
						<hr>
						<h5>단위 : 억원</h5>
						<table class="ui small table segment" id="isTable" border="1">

							<tr class="parent">
								<th>손익계산서</th>
								<c:forEach items="${isList }" var="list">
									<td>${list.name}</td>
								</c:forEach>
							</tr>
							<tr>
								<th>매출액</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is1 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>매출원가</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is9 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>매출총이익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is14 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>판매비와관리비</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is15 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>영업이익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is37 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>금융손익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is38 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>기타영업외손익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is61 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>법인세차감전계속사업이익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is110 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>법인세비용</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is111 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>당기순이익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is112 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>총포괄이익</th>
								<c:forEach items="${isList }" var="list">
									<td><fmt:formatNumber>${list.is126 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>

						</table>
					</div>

				</div>

			</li>
			<li>
				<div class="content">

					<!-- CF 테이블 -->
					<div id="cf">
						<h1>현금흐름표</h1>
						<hr>
						<h5>단위 : 억원</h5>
						<table class="ui small table segment" id="cfTable" border="1">

							<tr class="parent">
								<th>현금흐름표</th>
								<c:forEach items="${cfList}" var="list">
									<td>${list.name }</td>
								</c:forEach>
							</tr>
							<tr>
								<th>영업활동으로인한현금흐름</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf1 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>당기순이익</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf2 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>현금유출이 없는 비용 가산</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf4 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>현금유입이 없는 수익 차감</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf15 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>투자활동으로인한현금흐름</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf48 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>투자활동현금유입액</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf49 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>투자활동현금유출액</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf54 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>재무활동으로인한현금흐름</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf69 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>재무활동현금유입액</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf70 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>재무활동현금유출액</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf79 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>현금 및 현금성자산 증가</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf95 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>기초의 현금</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf96 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>
							<tr>
								<th>기말의 현금</th>
								<c:forEach items="${cfList}" var="list">
									<td><fmt:formatNumber>${list.cf97 }</fmt:formatNumber></td>
								</c:forEach>
							</tr>

						</table>

					</div>

				</div>
			</li>
			<li>
			<div class="content">
			 	<h1>금융감독원 공시 사업보고서</h1>
			 	<hr>
			 	<table id="important_report">
			 	<tr>
			 	<th>보고서명</th>
			 	<th>날짜</th>
			 	</tr>
			 	</table>
			 	
			 				 	
			</div>
			</li>
			
		</ul>

	</div>




</body>
</html>