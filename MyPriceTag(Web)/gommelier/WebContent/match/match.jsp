<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.core.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.plugin.tags.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.plugin.autocomplete.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.plugin.clear.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.plugin.focus.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.plugin.prompt.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/textext/src/css/textext.plugin.arrow.css">

<style type="text/css">
body{
	font-family: 맑은 고딕;
	font-size: 12px;
	background-color: #E6E6F0;
}
.page{
	width: 1000px;
	float: right;
}
.register-form{
	position: relative;
	background-color: white;
	border-radius: 10px;
	padding-bottom: 15px;
	margin: 5px;
	width: 550px;
	float: left;
}
.table-responsive{
	width: 490px;
	font-family: 맑은 고딕;
	font-size: 12px;
}	
#imagePreview {
	width: 180px;
	height: 180px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}

#uploadFile {
	display: none;
}

#bt {
	border: 2px dashed;
	height: 50px;
	width: 50px;
	text-align: center;
}

#bt span {
	line-height: 50px;
	font-size: 30px;
	font-weight: bolder;
	color: gray;
}
svg{
	width: 350px;
	height: 100%;
}

div.tag-original{
	border-radius: 2px;
	border: 1px solid #9daccc;
	background: #e2e6f0;
	padding: 0px 3px 0px 3px;
	cursor: pointer;
	font: 11px;
	display: inline-block;
	margin-right: 3px;
}

div.tag{
	margin:5px;
	background-color: #003366;
	border: 1px solid #003366;
	border-radius:0 0 0 0;
	font-size: 13px;
}

path.hover{
	fill:	#B84D70;
}
#match-guide{
position: relative;
float: left;
background-color: white;
border-radius: 15px;
padding: 5px;
margin: 5px;
width: 400px;
}
.gangjo{
	color: #ff6600;
	font-weight: bold;
}
	
.btn-warning{
	background-color: #ff6600;
	border: 1px solid #ff6600;
}
</style>
</head>
<body>
	<div class="page">
		<div class="register-form">
			<div class="table-responsive" align="center">
				<h3 align="left">
					<b>${param.chk ne null? 'PUSHING':'MATCHING'}</b>
				</h3>
				<form id="form" action="${param.chk ne null? 'push_regist.do':'result.do'}" method="post">	
					<div>
						<hr>	
								<div id="region1">
								<c:import url="seoul_map.jsp"/>
								</div>
						<hr>
								<div style="display: none;">
								<input class="example" type="text" id="square_num" name="square_num" value="${pushDetail ne null? pushDetail.push_square:param.square_num}" 
								placeholder="지역번호" readonly="readonly">
								</div>
								
								<div align="left"><h5 id="price1"><strong>가격 입력</strong></h5>
								<input type="text" class="form-control input-sm" name="product_price" value="${pushDetail ne null? pushDetail.push_price:param.product_price}" 
								placeholder="가격(원)" required="required"></div>
								
						<br>
								<div align="left"><h5 id="tagInput1"><strong>태그 입력</strong></h5>
									<textarea class="form-control" id="textarea" name="match_tag" 
									rows="1" style="width: 493px"></textarea>
								</div>
							
						<br>	
								<div align="left"><h5 id="tag1"><strong>추천 태그</strong></h5></div>
								<div id="rcmd_tag" align="left"></div>
								
						<hr>
							<input name="push_num" type="hidden" value="${param.push_num}">
							<button class="btn btn-warning btn-sm" type="submit">
								<i class="large thumbs up outline icon"></i>${param.chk ne null? '푸시 등록':'매칭 시작'}
							</button>&nbsp;&nbsp;
							
							<c:if test="${param.push_num ne null}">
								<button id="push_form_btn" class="btn btn-warning btn-sm">
								<i class="large thumbs up outline icon"></i>푸쉬 수정</button>
							</c:if>
					</div>
				</form>
			</div>
		</div>
		<div id="match-guide">
			<div class="table-responsive" align="left" style="width: 380px;">
				<br/>
				<table class="table table-condensed" style="width: 360px;">
					<tr>
						<td width="80px" rowspan="6" align="center">
							<img alt="question-mark" width="40px" height="60px" src="./images/contents/item5.png">
						</td>
						<td width="280px"><span class="gangjo">매칭서비스란?</span></td>
					</tr>
					<tr>
						<td>
							매칭서비스는 '내게 딱 맞는' 단 하나의 상품, '내게 딱 어울리는' 단 하나의 상품을 추천해주는 서비스입니다. 
							<br/>기존의 검색방식은 내가 원하는 결과를 찾을 때까지 계속 검색해야 되고 수많은 도배글들이 나열되기 때문에 여러분의 소중한 시간을 빼앗고 불편함을 초래했습니다. 
							<br/>이제 MyPriceTag의 매칭서비스를 통해 내게 딱 어울리는 상품을 가장 빠르고 정확하게 찾아보세요.
						</td>
					</tr>
					<tr>
						<td width="280px"><span class="gangjo">매칭서비스 이용 방법</span></td>
					</tr>
					<tr>
						<td id="region">
							<b>Step 1. 지역 선택</b>
							<br/>거래하고 싶은 지역을 지도에서 클릭하여 선택합니다.
						</td>
					</tr>
					<tr>
						<td id="price">
							<b>Step 2. 가격 입력</b>
							<br/>이 정도까지는 지불할 수 있다고 생각되는 가격을 입력합니다.
						</td>
					</tr>
					<tr>
						<td>
							<span id="tagInput">
							<b>Step 3. 태그 입력</b>
							<br/>상품의 상세정보를 태그 형식으로 입력합니다.
							<br/>ex)자전거, 새상품, 파랑색 등
							</span> 
							<br/>
							<span id="tag">
							<br/>하나의 태그 입력시 추천 태그란에 유사한 태그를 확인할 수 있기 때문에, 추가적인 태그를 손쉽게 입력하실 수 있습니다.
							</span>
						</td>
					</tr>
					
					<tr>
						<td rowspan="2"></td>
						<td></td>
					</tr>
					<tr>
					
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 스크립트 임포트 -->
	<script type="text/javascript">
		$(function() {
			/* 재검색으로 돌아왔을 때 태그들을 받아서 다시 정렬 //  스트링으로 날아옴.. 그래서 배열로 만들어줌  */
			var tags = '${tag ne null? tag:param.tag}'
			array = null;
			if(tags != null){
				array = tags.slice(1, tags.length -1 ).split(",");
			}
			
			
			/* 자동완성 */
			$('#textarea').textext({
				plugins : 'tags prompt focus autocomplete ajax arrow',
				prompt : '태그를 입력하세요.',
				tagsItems : array,
				ajax : {
					url : 'tag_autocomplete.do',
					dataType : 'json',
					cacheResults : true
				}
			});
			
			
 			setInterval(function() {
				$.post("tag_recommend.do",{"tag": $("input[name=match_tag]").val() },function(jsonObj){
					$("#rcmd_tag").text("");
					if (jsonObj != null) {
						$.each(jsonObj, function(index, value) {
							var img = $("<img/>").attr('src','./images/background/tag_logo.png')
							.attr('width','20px').attr('height','20px');
							/* $("#rcmd_tag").append($("<div class='tag'/>", img).text(value.tag)); */
							//$("#rcmd_tag").append($("<div class='tag btn btn-info btn-xs'/>").text(value.tag).append(img)).append("  ");
							$("#rcmd_tag").append($("<div class='tag btn btn-info btn-xs'/>").text(value.tag));
						});
					}

				},"json");
			},3000);
			
			/* 지도도 돌아왔을 때 세팅함 */
			var square_num = '${pushDetail ne null? pushDetail.push_square:param.square_num}'
			$.each($("path"), function(index, item) {
				if ($(item).attr("square_num") == square_num) {
					$(this).trigger("click");
					return;	
				}
			});
 		
 			$("path").on("click", function() {
 				var square_num = $(this).attr('square_num');
				$("#square_num").val(square_num);
				$.post("univ_list_by_square.do", {
					"square_num" : square_num
				}, function() {

				}, "json");
			});

			$("body").on("click", "div.tag", function() {
				$('#textarea').textext()[0].tags().addTags([ $(this).text() ]);
			});
			
			/* 푸쉬 수정 or 등록 버튼 클릭!!! */
			$("#push_form_btn").click(function(e) {
				e.preventDefault();
				$("#form").attr("action","push_update.do").submit();
			})
			
			/* 도움말 */
			/* 1. 지도 */
			$("#region").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("path").attr("class", function(index, classNames) {
					return classNames + ' hovered';
				});	
			
			$("#region").mouseout(function(){
				$("path").attr("class", function(index, classNames) {
					return classNames.replace(' hovered', '');
				});
			});
			});
			
			/* 2. 가격 */
			$("#price").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("#price1").css("color", "#FF6600");
			$("#price").mouseout(function(){
				$("#price1").css("color", "black");
			});
			});
			
			/* 3. 태그 */
			$("#tagInput").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("#tagInput1").css("color", "#FF6600");
			$("#tagInput").mouseout(function(){
				$("#tagInput1").css("color", "black");
			});
			});
			
			/* 4. 추천태그 */
			$("#tag").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("#tag1").css("color", "#FF6600");
			$("#tag").mouseout(function(){
				$("#tag1").css("color", "black");
			});
			});
			
			
		});
	</script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.core.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.tags.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.autocomplete.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.suggestions.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.filter.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.focus.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.prompt.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.ajax.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="${pageContext.request.contextPath}/textext/src/js/textext.plugin.arrow.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>