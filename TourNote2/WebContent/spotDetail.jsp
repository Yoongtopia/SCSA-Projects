<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<link href="css/bootstrap4.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/component.css" />
<script src="./js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&language=ko"></script>
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox.js"></script>
<script type="text/javascript" src="./js/jssor.core.js"></script>
<script type="text/javascript" src="./js/jssor.utils.js"></script>
<script type="text/javascript" src="./js/jssor.slider.js"></script>
<script src="js/lightbox.js"></script>
</head>
<body>

	<div>
			<div>
				<table id="detailTable" style="border: 1px solid white; margin-left:30px;" width="500">
					<c:if test="${spot.spotTitle != null }">
						<tr>
							<td colspan="2"><h3><b>${spot.spotNum}. ${spot.spotTitle}</b></h3></td>
						</tr>					
					</c:if>
					<c:if test="${spot.spotTitle == null }">
						<tr>
							<td colspan="2"><h3><b>${spot.spotNum}. (제목 없음)</b></h3></td>
						</tr>
					</c:if>
						<tr>
							<td align="right" colspan="2">${spot.spotTime}</td>
						</tr>
					<c:if test="${spot.spotCont != null }">
						<tr>
							<td width="30"></td>
							<td>${spot.spotCont}</td>
						</tr>					
					</c:if>
					<c:if test="${spot.spotCont == null }">
						<tr>
							<td width="30"></td>
							<td>(내용 없음)</td>
						</tr>
					</c:if>
				</table>
			</div>
			
			
			<div style="height: 30px"></div>
			
			<div style="border: 1px solid white; height: 140px; padding: 10px; background-color: #DDDDDD; overflow-x: scroll; width: 600px !important; margin-top: 40px; ">
				<c:choose>
					<c:when test="${not empty pList}">
						<c:forEach items="${pList}" var="pList">
							<span style="width: 80px; ">
							<img style="height: 80px; width: 80px; margin-left:10px; margin-bottom: 10px; margin-top:10px;" src="${pageContext.request.contextPath}/image/${pList.photoName}">
							</span>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<br/>
						<span style="margin-left:200px;">등록하신 사진이 없습니다.</span>
					</c:otherwise>
				</c:choose>
						
			</div>
			
<%-- 			<div id="slider1_container" style="position: relative; width: 430px; height: 100px; overflow: hidden; margin-left: 20px">
				
				<div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 400px; height: 100px; overflow: hidden;" id="pictureDiv">
					<c:forEach items="${pList}" var="pList">
						<div>
							<img u="thumb" src="${pageContext.request.contextPath}/image/${pList.photoName}">
						</div>
					</c:forEach>
				</div>
				
				<div u="thumbnavigator" class="jssort07" style="position: absolute; width: 400px; height: 100px; left:0px; bottom: 0px;">
					<div style=" background-color: black; filter:alpha(opacity=20); opacity:.2; width: 100%; height: 100%;"></div>
						<div u="slides" style="cursor: move;">
					    	<div u="prototype" id="prototype" class="p" style="POSITION: absolute; WIDTH: 50px; HEIGHT: 50px; TOP: 0; LEFT: 0;">
					        	<thumbnailtemplate class="i" style="position:absolute; width: 50px; height: 50px "></thumbnailtemplate>
					            	<div class="o">
					                </div>
					        </div>
					    </div>				
				<span u="arrowleft" class="jssora11l" style="width: 10px; height: 10px; top: 8px; left: 8px;">
				</span>
				<span u="arrowright" class="jssora11r" style="width: 10px; height: 10px; top: 8px; right: 8px">
				</span>
		        </div> 
		    
		   </div> --%>
	</div>

</body>
</html>