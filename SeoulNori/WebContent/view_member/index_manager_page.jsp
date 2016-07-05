<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.seoulnori.vo.Event" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-seoulnori.css' />
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bootstrap-theme-seoulnori.css' />
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.11.0.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
	
	$(function() {
		
		/* footer 높이 */
		var browserHeight = document.documentElement.clientHeight;
		var bodyHeight = document.getElementById("mainBody").getBoundingClientRect().height;
		if(browserHeight-bodyHeight >= 160){
			$("#mainDiv").css("height", "763px");	
		}
		$("#seoulnoriFooter").css("display", "block");
		
		/* 담당자페이지 탭 클릭 @sy */
		$( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
		 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
		
		 
		$('#managerTab a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
		});
		
		$(".nav-tabs-member").children().hover(function() {
			$(this).addClass('hoverMove', 250);
		}, function() {
			$(this).removeClass('hoverMove', 250);
		});

		/* 담당자페이지 tab 링크 */
		$("#eventTab").click(function() {
			location.href="${pageContext.request.contextPath}/manager_page.do?tabId=eventTab";
		}); 
		$("#qnaTab").click(function() {
			location.href="${pageContext.request.contextPath}/manager_page.do?tabId=qnaTab";
		});
		$("#myInfoTab").click(function() {
			location.href="${pageContext.request.contextPath }/manager_page.do?tabId=myInfoTab";
		});
		
		
		/* 활성화시킬 탭 체크 */
		if( $("#managerPageTabChk").val() != "" ){
			$("#"+$("#managerPageTabChk").val()).parent().attr("class", "active");
		} else {
			$("#eventTab").parent().attr("class", "active");
		}
		
	});

	
</script>


<title>Seoul Nori 서울노리</title>
</head>
<body id="mainBody" style="width: 100%; overflow-x: hidden;">

	<!-- 사용자 메뉴 -->
	<div class="row" style="overflow: hidden; margin: 0; width: 1280px;">
		<div style="position: absolute; width: 100%;">
				<jsp:include page="/view_main/menu.jsp"/>
		</div>
	</div>
	
	<div class="row" style="width: 1280px;">
	<div class="col-md-2">
	 
	 	<!-- 담당자 페이지 메뉴 -->
		 	
		 <div style="width: 100%; height: 500px; text-align: right;">
		 
			<table style="position: absolute; top:125px; right: 0; padding: 5px;">
				<tr>
					<td style="text-align: center;">
						<img src="${pageContext.request.contextPath}/images/test/${member.mainStamp}.png"
									width="120px" style="boder-radius:5px;">
					</td>
				</tr>
				<tr>
					<td style="text-align: center; padding: 5px; width: 131px; border-top: 1px solid #ddd;">
						<strong>${member.nickname}님</strong>의<br/>
						<span>담당자 페이지</span>
					</td>
				</tr>
			</table>

			<div style="position: relative; top: 315px; right: -15px; overflow: hidden; border-right: 3px solid #ccc;">
				<input type="hidden" id="managerPageTabChk" value="${managerPageTabChk}">
				<ul class="nav nav-tabs-member" id="managerTab" style="position: relative; right: -50px;">
					<li>
						<a id="eventTab" href="">
							<span class="glyphicon glyphicon-list-alt" style="font-size: large;"></span>
							&nbsp;&nbsp;내 행사정보
						</a>
					</li>
					<li>
						<a id="qnaTab" href="">
							<span class="glyphicon glyphicon-tower" style="font-size: large;"></span>
							&nbsp;&nbsp;QnA
						</a>
					</li>
					<li>
						<a id="myInfoTab" href="">
							<span class="glyphicon glyphicon-pencil" style="font-size: large;"></span>
							&nbsp;&nbsp;내 정보 수정
						</a>
					</li>
				</ul>
			</div>
			
		</div><!-- end managerPageMenu -->
		
	</div><!-- end col-2 -->
		<div class="col-md-8" id="mainDiv">
			
			<!-- contentPage Check -->
			<c:choose>
				
				<c:when test="${ contentPage != null }">
				<!-- contentPage 있을 경우 -->
				
					<div class="row" style="margin: 110px 0 0 0; overflow: hidden;">
						<jsp:include page="./../${contentPage}"/>
					</div>
		
				</c:when>	
				<c:otherwise>
				<!-- contentPage 없을 경우: 행사정보 페이지로 -->
				
					<div class="row" style="margin: 110px 0 0 0; overflow: hidden;">
						<jsp:include page="./../${contentPage}"/>
					</div>
					
				</c:otherwise>
				
			</c:choose>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<!-- footer -->
	<div id="seoulnoriFooter" style="width: 100%; height: 120px; background-color: #ddd; margin-top: 40px; display: none;">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="padding: 25px 0; font-size: small;">
		<table>
			<tr>
				<td rowspan="3" style="padding-right: 10px;">
					<img src="${pageContext.request.contextPath}/images/main/nam.png" height="70px"/></td>
				<td>
					<span style="font-weight: 600;">프로젝트 서울노리</span> | 삼성 컨버전스 소프트웨어 아카데미 2기 SDS 1반 융토피아 오아앤드
				</td>
			</tr>
			<tr>
				<td>
					<span style="font-weight: 600;">대표</span> | 권오아&nbsp;&nbsp;
					<span style="font-weight: 600;">관리자</span> | 권순형&nbsp;&nbsp;
					<span style="font-weight: 600;">문의</span> | 010-4231-5352&nbsp;&nbsp;
					<span style="font-weight: 600;">이메일</span> | seoulnori@seoulnori.com&nbsp;&nbsp;
					<span style="font-weight: 600;">업무시간</span> | 24시간이 모자라
				</td>
			</tr>
			<tr>
				<td>
					Unofficial Seoul Tourism Website copyrights 2014.05 - 2014.06 SCSA 2nd SDS 1, YoongTopia, OaAnd all rights reserved.
				</td>
			</tr>
		</table>
		
		</div>
			
		</div>	
	
	<c:if test="${ contentPage != null }">
		<!-- <table id="eventTodayBox"></table> -->
	</c:if>
			
		
</body>
</html>