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
	}
	.table-responsive{
		width: 500px;
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
		width: 100px;
		height: 100%;
	}
	div.tag{
		border-radius: 2px;
		border: 1px solid #9daccc;
		background: #e2e6f0;
		padding: 0px 3px 0px 3px;
		cursor: pointer;
		font: 11px;
		display: inline-block;
		margin-right: 3px;
	}
</style>
</head>
<body>

  <div class="panel-body" id="userDetailModal">
    ${pushDetail}
	<div class="table-responsive" align="center">
		<h3 align="left">매칭서비스</h3>
		<br/>
		<form action="result.do" method="post">
			<table class="table table-condensed">
				<tr valign="middle">
					<td width="100px">
						<c:import url="../seoul_map.jsp"/>
					</td>
					<td align="left" style="margin: auto; height: 100px">
						<div><input class="example" type="text" id="square_num" name="square_num" value="${pushDetail.push_square}" placeholder="지역번호" readonly="readonly"></div>
						<div><input class="example" type="text" name="product_price" value="${pushDetail.push_price}" placeholder="가격" required="required"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<%-- <c:when test="${not empty pushDetail }">
							<c:forEach items="${pushDetail.pushTagList }" var="tag"> --%>
							<textarea class="form-control" id="textarea" name="match_tag" class="example" rows="1" style="width: 500px">
							<%-- ${tag.push_tag } --%>	
							</textarea>
							<%-- </c:forEach>
							</c:when> --%>
						</div>
					</td>
				</tr>
				<tr>
					<td>추천태그</td>
					<td><div id="rcmd_tag"></div></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input class="btn btn-default" type="submit" value="매칭시작"></td>
				</tr>
				
			</table>
		</form>
	</div>
   </div>

	<!-- 스크립트 임포트 -->
	<script type="text/javascript">
		$(function() {
			/* 자동완성 */
			$('#textarea').textext({
				plugins : 'tags prompt focus autocomplete ajax arrow',
				prompt : '입력할 태그를 선택하세요.',
				tagsItems : '${param.tag}',
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
							$("#rcmd_tag").append($("<div class='tag'/>").text(value.tag));
						})
					}


				},"json") 		
			},3000);
			
 			$("path").on("click", function() {
				$(".Square").removeClass("clicked");
				var square_num = $(this).attr('square_num');
				$(".Square" + square_num).attr("class",  "clicked");

				
				$("#square_num").val(square_num);
				$.post("univ_list_by_square.do", {
					"square_num" : square_num
				}, function() {

				}, "json");
			});
			
			$("path").hover(function() {
				var square_num = $(this).attr('square_num');
				$(".Square" + square_num).attr("style", "fill:	#B84D70");
			}, function() {
				var square_num = $(this).attr('square_num');
				$(".Square" + square_num).removeAttr("style");
			})
			
			$("body").on("click", "div.tag", function() {
				$('#textarea').textext()[0].tags().addTags([ $(this).text() ]);
			});
		})
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