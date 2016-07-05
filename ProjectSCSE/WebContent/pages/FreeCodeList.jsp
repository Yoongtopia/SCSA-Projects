<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en" data-useragent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)">
<head>
<title>슬기로운 컴퓨터, 슬기로운 코딩</title>
<script>
	$(document).ready(function() {
		$(document).on("click", "#searchBtn", function() {
			$("#searchForm").submit();	
		});
		$(document).on("click", "#orderByHit", function() {
			location.href="${ pageContext.request.contextPath }/free_code_list.scse?orderType=codeHit";
		});
		$(document).on("click", "#orderByLike", function() {
			location.href="${ pageContext.request.contextPath }/free_code_list.scse?orderType=codeLike";
		});
		$(document).on("click", "#mySchool", function() {
			location.href="${ pageContext.request.contextPath }/free_code_list.scse?orderType=sameSchool&schoolNum=${ sessionScope.user.schoolNum }";
		});
	});
</script>
</head>
<div  style="font-size: large; font-family: 'Nanum Gothic'; margin-left:30px; margin-top:20px; font-weight: bold;background: transparent;"><i class="gamepad icon"></i>친구들이 만든 게임 목록</div>
<div align="center">
	<div class="ui buttons" style="margin-top:15px;"align="center">
		<div class="ui button" id="orderByHit"><i class="purple unhide icon"></i>최다 조회</div>
		<div class="ui button" id="mySchool"><i class="red users icon"></i>우리반 친구들의 작품</div>
		<div class="ui button" id="orderByLike"><i class="yellow trophy icon"></i>최다 추천</div>
	</div>
	<!-- 페이징 필요 -->
	<table class="ui padded table segment" style="margin-left:30px;">
		<c:forEach items="${ requestScope.codeGalery }" var="codeGalery" varStatus="status">
			<c:if test="${ status.count % 3==1 }"><tr></c:if>
			<td style="text-align: center">
				<a href="${ pageContext.request.contextPath }/select_free.scse?codeNum=${ codeGalery.codeNum }&freeUserId=${ codeGalery.userId }"><img width="200px" height="200px" class="rounded ui image" src="assets/image/Chapter05/${ codeGalery.backgroundSelection }" style="display: inline-block;"></a><br/>
				<label>${ codeGalery.freeUserSchool.schoolName } ${ codeGalery.freeUser.sName }</label><br/>
				<label>코드 이름 : ${ codeGalery.codeName }</label><br/>
				<label>제작일 : ${ codeGalery.codeDate }</label><br/>
				<label>조회수 : ${ codeGalery.codeHit } / 좋아요 : ${ codeGalery.codeLike }</label><br/>
			</td>
			<c:if test="${ status.count % 3==0 }"></tr></c:if>
		</c:forEach>
	</table>
	<div class="ui action input">
		<form action="${ pageContext.request.contextPath }/search_code.scse" method="post" id="searchForm">
			<table >
			<tr>
			<td>
			<input type="text" name="sName" size="20"   placeholder="친구이름입력">
			</td>
			<td rowspan="2">
			<div class="ui icon button" id="searchBtn">
				<i class="search icon"></i>
			</div>
			<td>
			<tr>
			<td>
			<input type="text" name="codeName" placeholder="코드이름입력">
			</td>
			</tr>
			</table>
		</form>
	</div>
</div>