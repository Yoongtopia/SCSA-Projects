<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="textext/src/css/textext.core.css">
<link rel="stylesheet" href="textext/src/css/textext.plugin.tags.css">
<link rel="stylesheet" href="textext/src/css/textext.plugin.autocomplete.css">
<link rel="stylesheet" href="textext/src/css/textext.plugin.clear.css">
<link rel="stylesheet" href="textext/src/css/textext.plugin.focus.css">
<link rel="stylesheet" href="textext/src/css/textext.plugin.prompt.css">
<link rel="stylesheet" href="textext/src/css/textext.plugin.arrow.css">
<link rel="stylesheet" href="css/loader.css">
<style type="text/css">
body{
	background-color: #E6E6F0;
	font-family: 맑은 고딕;
	font-size: 12px;
}
/* 인풋 안보이게 막아놓음 */
input[type=file] {
	display: none;
}

.photo.area {
	overflow:hidden;
	margin-bottom: 5px;
}
.img{
	height: 90px;
	width: 90px;
	float: left;
}
.imgbefore{
	height: 90px;
	width: 90px;
	float: left;
	margin-right: 5px;
	cursor: pointer;
	border: 2px dashed;
	text-align: center;
	font-size: 13px;
	font-weight: bold;
	line-height: 90px;
	
}
/* .img before{
	height: 100px;
	width: 100px;
	float: left;
	margin-right: 5px;
	cursor: pointer;
}

.before {
	border: 2px dashed;
	text-align: center;
} */

.after {
	background-size: cover;
}

/* .img span {
	line-height: 100px;
	font-size: 30px;
	font-weight: bolder;
	color: gray;
} */

svg {
	text-align:center;
	height: 100%;
	width: 270px;
}
/* svg {
	height: 100px;
	width: 100px;
} */

div.box {
	margin: 0 auto;
}

div.tag {
	border: 1px solid #003366;
	background-color: #003366;
	cursor: pointer;
	font: 12px;
	display: inline-block;
	margin: 3px;
	border-radius:0 0 0 0;
}

div.added{
	background-color: #FF6600;
}

#real_submit {
	position: absolute;
	bottom: 6px;
	right: 8px;
}

#before_submit {
	right: 15px;
	background-color: #FF6600;
	border: #ff6600 solid 1px;

}

#before_submit:HOVER{
	background-color: #EE9A00;
}
.table-responsive{
	width: 490px;
	font-family: 맑은 고딕;
	font-size: 12px;
}
#page{
	width: 1000px;
	float: right;
	
}
#register-form{
	position: relative;
	float: left;
	background-color: white;
	border-radius: 10px;
	padding-bottom: 10px;
	margin: 5px;
	width: 550px;
}
#register-guide{
	position: relative;
	float: left;
	background-color: white;
	border-radius: 10px;
	padding: 5px;
	margin: 5px;
	width: 400px;
}
.gangjo{
	color: #ff6600;
	font-weight: bold;
}
.btn-warning{
	border: #FF6600 1px solid; 
	background-color: #FF6600;
}
.btn-warning:HOVER{
	background-color: #EE9A00;
	border: #EE9A00 1px solid;
}
div[name=for_insert] > * {
	float: left;
}
</style>
</head>
<body>

	<div id="ajax_loader" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; z-index: 9000; opacity: 0.6; 
	background-color: rgb(136, 136, 136); display: none;">
		<div class="loading" style="overflow: hidden; position: absolute; top: 30%; left: 48%;"></div>
		<h4 style="font-weight: bold; position: absolute; color: #003366; left: 49%; top:48.5%;"><b>태그 분석중</b></h4>
	</div>
	<div id="page">
	${product}
		<div id="register-form">
			<div class="table-responsive" align="center">
				<h3 align="left"><b>상품 등록</b></h3>
				
				
					<hr>			
					
					<form id="regist_form" action="regist_product.do" method="post" enctype="multipart/form-data">
						
						<%-- 상품명 --%>
						<div align="left"><h5 id="productName1"><strong>상품명 입력</strong></h5>
						<input class="form-control input-sm" id="title" type="text" placeholder="상품명" value="<c:forEach items='${product.tagList}' var='tag' varStatus='status'><c:if test='${status.last}'>${tag.tag}</c:if></c:forEach>">
						</div>
						
						<%-- 지도 --%>
						<div align="left"><h5 id="region1"><strong>지역 선택</strong></h5></div>
						<!-- <div id="photo_area"> -->
						<div align="center">
							<c:import url="seoul_map.jsp"></c:import>
						</div>
						
						<%-- 사진 --%>
						<div class="photo area">	
	
							<c:choose>
							<c:when test="${product ne null }">		
							
								<div align="left"><h5 class="photoInput1"><strong>사진 입력</strong></h5>
								
									<span id="m" class="imgbefore" style="background-image: url("<c:forEach items='${product.imgList}' var='img' varStatus='i'><c:if test='${img.img_main eq 1}'>${pageContext.request.contextPath}/images/${img.img}</c:if></c:forEach>")">
										<a><span src="">대표사진</span></a>
									</span>
									<span id="t" class="imgbefore">
										<a><span>+</span></a>
									</span>	
									
								</div>						
									<input type="file" name="main_file" class="img" value="<c:forEach items='${product.imgList}' var='img' varStatus='i'><c:if test='${img.img_main eq 1}'>${pageContext.request.contextPath}/images/${img.img}</c:if></c:forEach>"/>
									<input type="file" name="file" class="img" multiple />
								
							</c:when>
							<c:otherwise>
							
								<div align="left"><h5 class="photoInput1"><strong>사진 입력</strong></h5>
									<span id="m" class="imgbefore">
										<a><span src="">대표사진</span></a>
									</span>
									<span id="t" class="imgbefore">
										<a><span>+</span></a>
									</span>	
								</div>	
									<input type="file" name="main_file" class="img"/>
									<input type="file" name="file" class="img" multiple />
								
							</c:otherwise>
							</c:choose>
						<p style="display: none;">
							<input class="form-control input-sm" type="text" id="square_num" name="square_num" placeholder="square_num" readonly="readonly">
						</p>
						
						</div>
						
						<%-- 가격 --%>
						<div align="left"><h5 id="priceInput1"><strong>가격 입력</strong></h5>
						<p>
							<input class="form-control input-sm" type="text" value="${product.product_price }" name="product_price" placeholder="가격(원)">
						</p>
						</div>
						
						<div align="left"><h5 id="textInput1"><strong>내용 입력</strong></h5>
						<p>
							<textarea  class="form-control input-sm" id="content" name="product_content" rows="5" cols="100" placeholder="상세 내용">${product.product_content}</textarea>
						</p>
						</div>
						<p style="display: none;">
							<textarea class="form-control input-sm" id="textarea" name="tag" class="example" rows="1"></textarea>	
						</p>
						
						<button class="btn btn-warning btn-sm" id="before_submit">
						<i class="large save outline icon"></i>저장하러 가기</button>	
					</form>

				<!-- 모달숨겨놓음 -->
				<div id="modal" style="background-color: white; border-radius:5px; width:450px; padding: 6px 10px 6px 10px; left:32%; y-overflow: scroll;">
					<div><b>태그들을 선택해주세요.</b></div>
					<div id="tag_list" style="margin: 5px; padding: 5px; margin-bottom: 27px;"></div>
					<div name="for_insert"><input type="text" class="form-control input-sm" style="width:40%; margin-right:2px;" name="insert_tag"><button type="button" class="btn btn-sm" style="background-color: #FF6600; color: white;">태그 직접입력</button></div>
					<button type="button" id="real_submit" class="btn btn-warning btn-sm"  style="background-color: #FF6600;">
					<i class="large thumbs up outline icon"></i>상품등록하기</button>
				</div>
				<!-- 모달 자리 -->							
			</div>
		</div>


		<div id="register-guide">
			<div class="table-responsive" align="left" style="width: 380px;">
				<br/>
				<table class="table table-condensed" style="width: 360px;">
					<tr>
						<td width="80px" rowspan="6" align="center">
							<img alt="question-mark" width="40px" height="60px" src="./images/contents/item5.png">
						</td>
						<td width="280px"><span class="gangjo">상품등록 도움말</span></td>
					</tr>
					<tr>
						<td id="productName">
							<b>Step 1. 상품명 입력</b>
							<br/>팔고자 하는 상품의 이름을 입력해주세요.
						</td>
					</tr>
					<tr>
						<td id="region">
							<b>Step 2. 지역 선택</b> 
							<br/>거래하고 싶은 지역을 지도에서 클릭하여 선택합니다.
						</td>
					</tr>
					<tr>
						<td id="photoInput">
							<b>Step 3. 사진 입력</b>
							<br/>먼저 대표사진을 한장 고르고 나머지 상세사진을 '+' 버튼을 눌러 원하는 만큼 등록합니다.  
						</td>
					</tr>
					<tr>
						<td id="priceInput">
							<b>Step 4. 가격 입력</b>
							<br/>이정도는 받아야겠다고 생각되는 적정한 가격을 입력합니다.
						</td>
					</tr>
					<tr>
						<td id="textInput">
							<b>Step 5. 내용 입력</b>
							<br/>상품의 상세정보를 일목요연하게 입력합니다. 내용 입력 후 '저장하러 가기' 버튼을 누를 경우
							입력하신 내용이 자동으로 태그형태로 변형되어 나타납니다. 이때 원하는 태그를 클릭해서 '등록' 버튼을
							누르면 상품 등록이 완료됩니다. 
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
			/* 태그~ */
			var tags = '${tag ne null? tag:null}'
			array = null;
			if(tags != null){
				array = tags.slice(1, tags.length -1 ).split(",");
			}
			
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
			$("#priceInput").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("#priceInput1").css("color", "#FF6600");
			$("#priceInput").mouseout(function(){
				$("#priceInput1").css("color", "black");
			});
			});
			
			/* 3. 상품명 */
			$("#productName").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("#productName1").css("color", "#FF6600");
			$("#productName").mouseout(function(){
				$("#productName1").css("color", "black");
			});
			});
			
			/* 4. 사진 */
			$("#photoInput").mouseover(function(){
				$(this).css("cursor", "pointer");
				$(".photoInput1").css("color", "#FF6600");
			$("#photoInput").mouseout(function(){
				$(".photoInput1").css("color", "black");
			});
			});
			
			/* 3. 상품명 */
			$("#textInput").mouseover(function(){
				$(this).css("cursor", "pointer");
				$("#textInput1").css("color", "#FF6600");
			$("#textInput").mouseout(function(){
				$("#textInput1").css("color", "black");
			});
			});
			
			/* 지도도 돌아왔을 때 세팅함 */
			var square_num = '${product ne null? product.square_num:null}'
			$.each($("path"), function(index, item) {
				if ($(item).attr("square_num") == square_num) {
					$(this).trigger("click");
					return;	
				}
			});
			
			var chkload = 'no';
			$(document).ajaxStart(function(){
				if (chkload == 'yes') {
					$("#ajax_loader").fadeIn();
				}
			}).ajaxStop(function() {
				if (chkload == 'yes') {
					$("#ajax_loader").fadeOut();
					chkload = 'no';
				}
			});
				
			/* 파일 올리기 숨김 */
			$("#t").click(function() {
				$("input[name=file]").trigger("click");
			});
			$("#m").click(function() {
				$("input[name=main_file]").trigger("click");
			});

			/* 파일 미리보기  */
			$("input[name=file]").on(
					"change",
					function() {
						if (this.files) {
					        for (i = 0; i < this.files.length; ++i) {
					            var file = this.files[i];
					            var reader = new FileReader();
					            reader.onload = function (e) {
					            	$div = $("<div class='img after'/>").css("background-image", 'url(' + e.target.result + ')');
					            	$("#t").before($div);
					            };
						        reader.readAsDataURL(file);
					        }
					    }
					});
			/* 메인사진은 등록하면 대표 표시 없애기 */
			$("input[name=main_file]").on("change", function() {
						if (this.files) {
					        for (i = 0; i < this.files.length; ++i) {
					            var file = this.files[i];
					            var reader = new FileReader();
					            reader.onload = function (e) {
					            	$div = $("<div class='img after'/>").css("background-image", 'url(' + e.target.result + ')');
					            	$("#t").before($div);
					            };
						        reader.readAsDataURL(file);
								$("#m").hide();
					        }
					    }
					});
			
			
			/* 형태소 보내기 */
			$("#before_submit").click(function(event) {
				chkload = 'yes';
				event.preventDefault();
				$.post("analysis.do", {
					"product_content" : $("#content").val()
				}, function(jsonObj) {
						$("#tag_list").text("");
						$(jsonObj).each(function(index, value) {
						$("#tag_list").append($("<div class='tag btn btn-info'/>").text(value));			
					});
					
					$('#modal').plainModal('open', {
						offset : {
							left : "35%",
							top : "30%"}
					});
					
				}, "json");

			});

			/* 형태소 받아서 모달로 출력 */
			var modal = $('#modal').plainModal({
				duration : 500
			});
			
			/* 모달에서 클릭하면 태그 추가 */
			$("body").on("click", "div.tag", function() {
				$('#textarea').textext()[0].tags().addTags([ $(this).text() ]);
				$(this).addClass("added");
			});

			/* 태그 입력기  */
			$('#textarea').textext({
				plugins : 'tags'
			});

			/* 모달의 버튼 클릭시 폼 서브밋 */
			$("#real_submit").click(
					function() {
						/* 제목도 태그로 넣고 서브밋 */
						$('#textarea').textext()[0].tags().addTags(
								[ $("#title").val() ]);
						$("#regist_form").submit();
					});
			
			/* 태그 임의로 추가하기 */
			$("div[name=for_insert] > button").click(function() {
				tag = $("div[name=for_insert] > input").val();
				if(tag != ""){
					$("div[name=for_insert] > input").val("");	
					$('#textarea').textext()[0].tags().addTags([ tag ]);
					$("#tag_list").append($("<div class='tag btn btn-info'/>").text(tag).addClass("added"));
				}
			});
			
			//지도 설정
			$("path").on("click", function() {
				var square_num = $(this).attr('square_num');
				$("#square_num").val(square_num);
				$.post("univ_list_by_square.do", {
					"square_num" : square_num
				}, function() {

				}, "json");
			});
			
			//등록 validation chk
			/* $("#before_submit").attr("disabled", "disabled"); */
/* 			
			$("#title", "input[name=file]", "input[name=main_file]", "#square_num", "input[name=product_price]").blur(function() {
				alert(1);
			})
			 */
			
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
	<script src="${pageContext.request.contextPath}/js/jquery.plainmodal.js"></script>
</body>
</html>