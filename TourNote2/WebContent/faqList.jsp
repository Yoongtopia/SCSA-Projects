<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
<link href="./css/style.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/menu.css" />
<link href="./css/semantic.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap4.css" rel="stylesheet">
<script src="./js/bootstrap.min.js"></script>


<style type="text/css">
body{
    font-family: 'Nanum Gothic';
}

	.content {
		width: 700px;
		margin: 100px auto;
		padding: 20px;
	}
	.content h1 {
		font-weight: 400;
		text-transform: uppercase;
		margin: 0;
	}
	.content h2 {
		text-transform: uppercase;
		color: #333;
		margin: 0 0 20px;
	}
	.content p {
		font-size: 1em;
		font-weight: 300;
		line-height: 1.5em;
		margin: 0 0 20px;
	}
	.content p:last-child {
		margin: 0;
	}
	.content a.button {
		display: inline-block;
		padding: 10px 20px;
		background: #ff0;
		color: #000;
		text-decoration: none;
	}
	.content a.button:hover {
		background: #000;
		color: #ff0;
	}
	.content.title {
		position: relative;
		background: none;
		border: 2px dashed #333;
	}
	.content.title h1 span.demo {
		display: inline-block;
		font-size: .2em;
		padding: 5px 10px;
		background: #000;
		color: #fff;
		vertical-align: top;
		margin: 7px 0 0;
	}
	.content.title .back-to-article {
		position: absolute;
		bottom: -20px;
		left: 20px;
	}
	.content.title .back-to-article a {
		padding: 10px 20px;
		background: #f60;
		color: #fff;
		text-decoration: none;
	}
	.content.title .back-to-article a:hover {
		background: #f90;
	}
	.content.title .back-to-article a i {
		margin-left: 5px;
	}
	.content.white {
		box-shadow: 0 0 10px #999;
	}
	.content.black {
		background: #000;
	}
	.content.black p {
		color: #999;
	}
	.content.black p a {
		color: #08c;
	}
	
	.accordion-container {
		width: 100%;
		margin: 0 0 20px;
		clear: both;
	}
	.accordion-toggle {
		position: relative;
		display: block;
		padding: 20px;
		font-size: 1.3em;
		font-weight: 200;
		background: #999;
		color: #fff;
		text-decoration: none;
	}
	.accordion-toggle.open {
		background: #564688;
		color: #fff;
	}

	.accordion-toggle span.toggle-icon {
		position: absolute;
		top: 9px;
		right: 20px;
		font-size: 1.5em;
	}
	.accordion-content {
		display: none;
		padding: 10px;
		overflow: auto;
	}

	/* media query for mobile */
	@media (max-width: 767px) {
		.content {
			width: auto;
		}
		.accordion-content {
			padding: 10px 0;
			overflow: inherit;
		}
	}
	
	.sidenav{
		margin-left: -267px;
	}
	
	a:hover,
	a:focus {
	  color: #fff;
	  text-decoration: none;
	}
</style>


<body class="container-gray">
<div style="margin-top:150px" class="content white">
	 <nav class="sidenav" style="top: 60%; position: fixed;">   
		 <a href="${pageContext.request.contextPath }#top" class="n1"><img src="./images/mainPage/sideButton1.png" width="40px"/><span>TOP</span></a>
		 <c:choose>
			<c:when test="${sessionScope.member!=null && sessionScope.recordNum!=null }">		 
		 		<a href="${pageContext.request.contextPath }/upload_detail.do" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:when>
   	 		<c:otherwise>
		 		 <a href="${pageContext.request.contextPath }#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:otherwise>
		</c:choose> 
		 <a href="${pageContext.request.contextPath }#2" class="n1"><img src="./images/mainPage/sideButton3.png" width="40px"/><span>TRAVEL BOARD</span></a> 
		 <a href="${pageContext.request.contextPath }#3" class="n1"><img src="./images/mainPage/sideButton4.png" width="40px"/><span>MY TRAVEL</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice" class="n1"><img src="./images/mainPage/sideButton5.png" width="40px"/><span>NOTICE</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna" class="n1"><img src="./images/mainPage/sideButton6.png" width="40px"/><span>Q&A</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_faq.do?boardCategory=faq" class="n1"><img src="./images/mainPage/sideButton7.png" width="40px"/><span>FAQ</span></a> 
   	 </nav>
   	 
   	 
	<h2>FAQ</h2>
	<c:choose>
		<c:when test="${not empty boardList }">
			<c:forEach items="${ boardList}" var="list" varStatus="status">
				<div class="accordion-container">
					<a href="#" class="accordion-toggle">Q. ${list.boardTitle }<span class="toggle-icon"><i class="fa fa-plus-circle"></i></span></a>
					<div class="accordion-content">
						A. ${list.boardCont}
					<table>
					<tr style="display:hidden" name="${status.count }"></tr>
	<%-- 			<c:choose>
						<c:when test="${sessionScope.member.memberId=='admin' }">
							<tr>
								<td><a href="${pageContext.request.contextPath }/faq_update1.do?boardNum=${list.boardNum }">수정</a></td>
								<td><a href="${pageContext.request.contextPath }/faq_delete.do?boardNum=${list.boardNum }">삭제</a></td>
							</tr>
						</c:when>
					</c:choose> --%>
					</table>
					</div>
				</div>
			</c:forEach>
<%--			<c:choose>
 			<c:when test="${sessionScope.member.memberId=='admin' }">
			<tr>
				<td align="right" colspan="5">
					<a href="${pageContext.request.contextPath}/board_insert_form.do">글쓰기</a>
				</td>
			</tr>
			</c:when> 
		</c:choose> --%>
		</c:when>
	</c:choose>
</div>


<div>
<table>
</table>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('.accordion-toggle').on('click', function(event){
    	event.preventDefault();
    	closeAll();
    	
    	// create accordion variables
    	var accordion = $(this);
    	var accordionContent = accordion.next('.accordion-content');
    	var accordionToggleIcon = $(this).children('.toggle-icon');
    	
    	// toggle accordion link open class
    	accordion.toggleClass("open");
    	// toggle accordion content
    	accordionContent.slideToggle(250);
    	
    	// change plus/minus icon
    	if (accordion.hasClass("open")) {
    		accordionToggleIcon.html("<i class='fa fa-minus-circle'></i>");
    	} else {
    		accordionToggleIcon.html("<i class='fa fa-plus-circle'></i>");
    	}
    });
    
 	function closeAll() {
		$('.accordion-toggle').removeClass("open");
		$('.accordion-content').slideUp(250);
	}
});
</script>
</body>
</html>