<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-seoulnori.css' />
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-theme-seoulnori.css' />
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.11.0.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$("#searchEventBtn").on("click", function() {
		$("#resultTable").show();
		$.post("${pageContext.request.contextPath}/event_ajax_search.do"
				, {"adminkeyword":$("#searchEventTitle").val()}
				,function (jsonObj) {
					if(jsonObj.status){
						$(".a").remove();
						$(jsonObj.eventList).each(function(index, item) {
							var eventSi="서울";
							var eventGu="";
							if(item.eventGu=="S1"){
								eventGu = "강남구";
							} else if(item.eventGu=="S2"){
								eventGu = "강동구";
							} else if(item.eventGu=="S3"){
								eventGu = "강북구";
							} else if(item.eventGu=="S4"){
								eventGu = "강서구";
							} else if(item.eventGu=="S5"){
								eventGu = "관악구";
							} else if(item.eventGu=="S6"){
								eventGu = "광진구";
							} else if(item.eventGu=="S7"){
								eventGu = "구로구";
							} else if(item.eventGu=="S8"){
								eventGu = "금천구";
							} else if(item.eventGu=="S9"){
								eventGu = "노원구";
							} else if(item.eventGu=="S10"){
								eventGu = "도봉구";
							} else if(item.eventGu=="S11"){
								eventGu = "동대문구";
							} else if(item.eventGu=="S12"){
								eventGu = "동작구";
							} else if(item.eventGu=="S13"){
								eventGu = "마포구";
							} else if(item.eventGu=="S14"){
								eventGu = "서대문구";
							} else if(item.eventGu=="S15"){
								eventGu = "서초구";
							} else if(item.eventGu=="S16"){
								eventGu = "성동구";
							} else if(item.eventGu=="S17"){
								eventGu = "성북구";
							} else if(item.eventGu=="S18"){
								eventGu = "송파구";
							} else if(item.eventGu=="S19"){
								eventGu = "양천구";
							} else if(item.eventGu=="S20"){
								eventGu = "영등포구";
							} else if(item.eventGu=="S21"){
								eventGu = "용산구";
							} else if(item.eventGu=="S22"){
								eventGu = "은평구";
							} else if(item.eventGu=="S23"){
								eventGu = "종로구";
							} else if(item.eventGu=="S24"){
								eventGu = "중구";
							} else if(item.eventGu=="S25"){
								eventGu = "중랑구";
							} else if(item.eventGu=="I1"){
								eventSi = "인천";
								eventGu = "강화군";
							} else if(item.eventGu=="I2"){
								eventSi = "인천";
								eventGu = "계양구";
							} else if(item.eventGu=="I3"){
								eventSi = "인천";
								eventGu = "남구";
							} else if(item.eventGu=="I4"){
								eventSi = "인천";
								eventGu = "남동";
							} else if(item.eventGu=="I5"){
								eventSi = "인천";
								eventGu = "동구";
							} else if(item.eventGu=="I6"){
								eventSi = "인천";
								eventGu = "부평구";
							} else if(item.eventGu=="I7"){
								eventSi = "인천";
								eventGu = "서구";
							} else if(item.eventGu=="I8"){
								eventSi = "인천";
								eventGu = "연수구";
							} else if(item.eventGu=="I9"){
								eventSi = "인천";
								eventGu = "용진군";
							} else if(item.eventGu=="I10"){
								eventSi = "인천";
								eventGu = "중구";
							} else if(item.eventGu=="K1"){
								eventSi = "경기";
								eventGu = "가평군";
							} else if(item.eventGu=="K2"){
								eventSi = "경기";
								eventGu = "고양시";
							} else if(item.eventGu=="K3"){
								eventSi = "경기";
								eventGu = "과천시";
							} else if(item.eventGu=="K4"){
								eventSi = "경기";
								eventGu = "광명시";
							} else if(item.eventGu=="K5"){
								eventSi = "경기";
								eventGu = "광주시";
							} else if(item.eventGu=="K6"){
								eventSi = "경기";
								eventGu = "구리시";
							} else if(item.eventGu=="K7"){
								eventSi = "경기";
								eventGu = "군포시";
							} else if(item.eventGu=="K8"){
								eventSi = "경기";
								eventGu = "김포시";
							} else if(item.eventGu=="K9"){
								eventSi = "경기";
								eventGu = "남양주시";
							} else if(item.eventGu=="K10"){
								eventSi = "경기";
								eventGu = "동두천시";
							} else if(item.eventGu=="K11"){
								eventSi = "경기";
								eventGu = "부천시";
							} else if(item.eventGu=="K12"){
								eventSi = "경기";
								eventGu = "성남시";
							} else if(item.eventGu=="K13"){
								eventSi = "경기";
								eventGu = "수원시";
							} else if(item.eventGu=="K14"){
								eventSi = "경기";
								eventGu = "시흥시";
							} else if(item.eventGu=="K15"){
								eventSi = "경기";
								eventGu = "안산시";
							} else if(item.eventGu=="K16"){
								eventSi = "경기";
								eventGu = "아성시";
							} else if(item.eventGu=="K17"){
								eventSi = "경기";
								eventGu = "안성시";
							} else if(item.eventGu=="K18"){
								eventSi = "경기";
								eventGu = "양주시";
							} else if(item.eventGu=="K19"){
								eventSi = "경기";
								eventGu = "양평군";
							} else if(item.eventGu=="K20"){
								eventSi = "경기";
								eventGu = "여주시";
							} else if(item.eventGu=="K21"){
								eventSi = "경기";
								eventGu = "연천군";
							} else if(item.eventGu=="K22"){
								eventSi = "경기";
								eventGu = "오산시";
							} else if(item.eventGu=="K23"){
								eventSi = "경기";
								eventGu = "용인시";
							} else if(item.eventGu=="K24"){
								eventSi = "경기";
								eventGu = "의왕시";
							} else if(item.eventGu=="K25"){
								eventSi = "경기";
								eventGu = "의정부시";
							} else if(item.eventGu=="K26"){
								eventSi = "경기";
								eventGu = "이천시";
							} else if(item.eventGu=="K27"){
								eventSi = "경기";
								eventGu = "파주시";
							} else if(item.eventGu=="K28"){
								eventSi = "경기";
								eventGu = "평택시";
							} else if(item.eventGu=="K29"){
								eventSi = "경기";
								eventGu = "포천시";
							} else if(item.eventGu=="K30"){
								eventSi = "경기";
								eventGu = "하남시";
							} else if(item.eventGu=="K30"){
								eventSi = "경기";
								eventGu = "화성시";
							}
							
					
							var a = $("<span />")
											 .attr("id", item.eventId)
											 .text(item.eventTitle);
							var eventTitle = $("<td/>").append(a);
							var eventPlace = $("<td/>").text(eventSi+" "+eventGu);
							var tr = $("<tr class='a'/>").append(eventTitle, eventPlace);
							$("#resultTable").append(tr);
							
							$("#"+item.eventId).click(function(event){
								$("#eventTitle", opener.document).val(item.eventTitle);
								$("#eventId", opener.document).val(item.eventId);
								close();
							});
							
						});

					}else{
						var td = $("<td colspan='2'/>").Text("다시 검색해주세요");
						var tr = $("<tr/>").append(td);
						$("#resultTable").append(tr);
					}
									
				}, "JSON");
		});
	
	
	
	
	
	
});


</script>
</head>
<body>
<div style="background-color:#6dbd96;">
<p style="padding:10px; color:#ffffff">행사선택</p>
</div>
<form class="form-inline" role="form">
<div class="form-group" style="margin: 10px;">
<input type="text" class="form-control" placeholder="이벤트명을 입력하세요" id="searchEventTitle"  style="width: 180px; display:inline-block" value="">
<button type="button" id="searchEventBtn" class="btn btn-default"  style="display:inline-block">검색</button>
</div>
</form>
<table id="resultTable" style="display : none;">
<tr>
<th>행사명</th>
<th>장소</th>
</tr>
</table>

</body>
</html>