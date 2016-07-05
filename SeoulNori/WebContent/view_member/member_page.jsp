<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/fullcalendar_seoulnori.css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap_datepicker.css">
<style type="text/css">
.fc-button-prev, .fc-button-next { border: 0; }
.ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 150px; }
.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
.ui-tabs-vertical .ui-tabs-nav li a { display:block; }
.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
 padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px;

	 -webkit-transform: translateX(-100px);
      -ms-transform: translateX(-100px);
        transform: translateX(-100px);
	  -moz-transition: -moz-transform 5s;
       -o-transition: -o-transform 5s ;
          transition: transform 5s;
     
	}
.ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}

@keyframes mymove
	{
	from {right:-30px;}
	to {right:80px;}
	}

@-webkit-keyframes mymove /*Safari and Chrome*/
	{
	from {right:-30px;}
	to {right:80px;}
	}

</style>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/fullcalendar_seoulnori.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/gcal.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/bootstrap-datepicker.js'></script>
<script type="text/javascript">

	$(function () {
		
		 $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
		 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
		
		if($("#active").val()=="myReview"){
			 $('#myReviewTab').trigger("click");
			 $("#active").val()=="";
		 } else {
			 $('#myCalTab').trigger("click");
		 }
		 
		$('#memberTab a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
		});
		
	});

</script>
<style type="text/css">

	.fc-header-title { margin: 0 20px; }
	.fc-header-title > h2 { font-size: 25px; vertical-align: baseline; }
	.fc-event #99 { background-color: red; }
	#eventStartDate, #betweenDate, #eventEndDate { display: inline-block; }
	.fc-button { padding: 5px 11px; margin-bottom: 17px; vertical-align: middle; line-height: 14px; font-size: small; }
	
</style>
</head>

<body>

<div class="row" style="width: 1280px;">
<div class="col-md-2"></div>
<div class="col-md-8">

<div id="tabs">
	
	  <h2 style="margin-bottom: 20px; margin-left:50px; color:#6C47A3">
		MEMBER
		<font size="4em"><strong>마이 페이지</strong></font>
	  </h2>
	  <br/>
	 <table style="padding: .2em .1em .2em .2em; width: 130px; margin-left: -130px; margin-top:-80px;float: left;"  >
	    <tr>
	      <td>
	        <img src="${pageContext.request.contextPath }/images/test/${member.mainStamp}.png" width="120px" class="img-rounded"></td>
	    </tr>
	    <tr>
	      <td style="text-align: center;">${member.nickname }님</td>
	    </tr>
	    <tr>
	      <td style="text-align: center;"><a href="${pageContext.request.contextPath }/member_myInfo_move.do"><input type="button" class="btn btn-default" value="정보수정"></a></td>
	    </tr>
	  </table>
	 <ul class="nav nav-tabs-member" id="memberTab" style="margin-left: -40px;margin-top: 130px">
	    <li class="active">
	    	<a id="myCalTab" href="${pageContext.request.contextPath}/member_mypage.do?tabId=myCalTab" >
	    	<span class="glyphicon glyphicon-calendar"></span> &nbsp;캘린더</a>
	    </li>
	    <li>
	    	<a id="myStampTab" href="${pageContext.request.contextPath}/member_mypage.do?tabId=myStampTab" >
	    	<span class="glyphicon glyphicon-tower"></span> &nbsp;스탬프</a>
	    </li>
	    <li>
	    	<a id="myReviewTab" href="${pageContext.request.contextPath}/member_mypage.do?tabId=myReviewTab" >
	    	<span class="glyphicon glyphicon-map-marker"></span> &nbsp;내가 쓴 후기</a></li>
	  </ul>

 	<br/>
 	 <input type="hidden" id="active" value="${active }">
	<!-- myCalendar -->
	  <div id="myCal">
 	<%-- 	<jsp:include page="../view_myCalendar/calendar_list.jsp"></jsp:include> --%>
	  </div>
	  
	 <!-- myStamp -->
	  <div id="myStamp">	
		<%-- <jsp:include page="../view_stamp/member_stamp_list.jsp"></jsp:include> --%>
		
	  </div>

	  <!-- myReview -->
	  <div id="myReview">
	  <%-- 	<jsp:include page="member_review_list.jsp"></jsp:include> --%>
	  </div>
	  
	  <%-- <div id="myCal" style=" width: 800px; background-color: white; position: fixed;">
	  <c:if test="${ myContent == '' || myContent == 'myCal' }">
	 	 <jsp:include page="../view_myCalendar/calendar_list.jsp"/>
	  </c:if>
	  <c:if test="${myContent == 'myStamp' }">
	   	<jsp:include page="../view_stamp/member_stamp_list.jsp"/>
	  </c:if>
	  <c:if test="${myContent == 'myReview'}">
	   	<jsp:include page="member_review_list.jsp"/>
	  </c:if>
	 </div>
	</div> --%>
	
</div>
 <div class="col-md-2"></div>
</div>
</body>
</html>