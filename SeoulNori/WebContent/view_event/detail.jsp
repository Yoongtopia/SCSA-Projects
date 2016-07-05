<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.seoulnori.vo.Event" %>
<%@page import="com.seoulnori.vo.EventDetail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/fullcalendar_seoulnori.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/gcal.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/bootstrap-datepicker.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/moment-with-langs.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/js/Chart.js'></script>
<script type="text/javascript">
<%Event event=(Event)request.getAttribute("event");%>
var jsonEvent=JSON.stringify({"eventId":'<%=event.getEventId()%>',"eventThumbnail":'<%=event.getEventThumbnail()%>',"eventTitle":'<%=event.getEventTitle()%>'});	

if(typeof(Storage) !== "undefined") {
	if(localStorage!=null){
		
	
		if(localStorage.getItem("1")!=null&&localStorage.getItem("1")==jsonEvent){
			localStorage.setItem("1", jsonEvent);
		}else if(localStorage.getItem("2")!=null&&localStorage.getItem("2")==jsonEvent){
			localStorage.setItem("2", jsonEvent);
		}else if(localStorage.getItem("3")!=null&&localStorage.getItem("3")==jsonEvent){
			localStorage.setItem("3", jsonEvent);
		}else if(localStorage.getItem("4")!=null&&localStorage.getItem("4")==jsonEvent){
			localStorage.setItem("4", jsonEvent);
		}else{
			if(localStorage.getItem("4")==null){
				if(localStorage.getItem("1")==null){
					localStorage.setItem("1", jsonEvent);
				}else if(localStorage.getItem("2")==null){
					localStorage.setItem("2", jsonEvent);
				}else if(localStorage.getItem("3")==null){
					localStorage.setItem("3", jsonEvent);
				}else if(localStorage.getItem("4")==null){
					localStorage.setItem("4", jsonEvent);
				}
				
			}else{
				localStorage.setItem("1", localStorage.getItem("2"));
				localStorage.setItem("2", localStorage.getItem("3"));
				localStorage.setItem("3", localStorage.getItem("4"));
				localStorage.setItem("4", jsonEvent);
			}			
		}
	}else{
		localStorage.setItem("1", jsonEvent);
	}
} else {
    // Sorry! No Web Storage support..
}

$(document).ajaxStart(function(){
    $('#loading').show();
 }).ajaxStop(function(){
    $('#loading').hide();
 });


	$(function(){

		/* 트렌드지수 차트 @sy */
		var ctx = $("#noriChart").get(0).getContext("2d");
		var noriPoint = Math.round(($("#eventIssuePoint").val()/210)*100);
		var allnoriPoint =  100-noriPoint;
		var noriData;
		if(allnoriPoint < 0){
			noriData = [ { value: noriPoint, color:"#F7464A" }, { value: 0, color:"#ccc" } ];
		} else {
			noriData = [ { value: noriPoint, color:"#F7464A" }, { value: 100-noriPoint, color:"#ccc" } ];
		}
		new Chart(ctx).Doughnut(noriData);
		$("#noriChartLabel").text($("#eventIssuePoint").val());
		
		
		var ctxNaver = $("#naverChart").get(0).getContext("2d");
		var naverPoint = Math.round(($("#eventNaverPoint").val()/100)*100);
		var allNaverPoint =  100-naverPoint;
		var naverData;
		if(allNaverPoint < 0){
			naverData = [ { value: naverPoint, color:"cornflowerblue" }, { value: 0, color:"#ccc" } ];
		} else {
			naverData = [ { value: naverPoint, color:"cornflowerblue" }, { value: 100-naverPoint, color:"#ccc" } ];
		}
		new Chart(ctxNaver).Doughnut(naverData);
		$("#naverChartLabel").text($("#eventNaverPoint").val());
		
		
		var ctxTweet = $("#tweetChart").get(0).getContext("2d");
		var tweetPoint = Math.round(($("#eventTweetPoint").val()/100)*100);
		var alltweetPoint =  100-tweetPoint;
		var tweetData;
		if(alltweetPoint < 0){
			tweetData = [ { value: tweetPoint, color:"cornflowerblue" }, { value: 0, color:"#ccc" } ];
		} else {
			tweetData = [ { value: tweetPoint, color:"cornflowerblue" }, { value: 100-tweetPoint, color:"#ccc" } ];
		}
		new Chart(ctxTweet).Doughnut(tweetData);
		$("#tweetChartLabel").text($("#eventTweetPoint").val());
		
		 
		var ctxCount = $("#countChart").get(0).getContext("2d");
		var countPoint = Math.round(($("#eventCount").val()/60000)*100);
		var allCountPoint =  100-countPoint;
		var countData;
		if(allCountPoint < 0){
			countData = [ { value: countPoint, color:"cornflowerblue" }, { value: 0, color:"#ccc" } ];
		} else {
			countData = [ { value: countPoint, color:"cornflowerblue" }, { value: 100-countPoint, color:"#ccc" } ];
		}
		new Chart(ctxCount).Doughnut(countData);
		$("#countChartLabel").text($("#eventCount").val());
		
		
		
		/*로그인 전 후기 등록 방지 @OA*/
			if($("#userIdOACheck").val()==null||$("#userIdOACheck").val().trim()==""){
				 $("#reviewForm").attr("disabled","disabled");
				 	$("input[type=radio]").attr("disabled","disabled");
					$("#reviewCnt").attr("disabled","disabled");
					$("#reviewImg").attr("disabled","disabled");
					$("#reviewAddBtn").attr("disabled","disabled");
					$("#reviewForm").click(function(){
						$("#loginModalLink").click();
					});
		 }else{
				$("#reviewForm").removeAttr("disabled");
				$("input[type=radio]").removeAttr("disabled");
				$("#reviewCnt").removeAttr("disabled");
				$("#reviewImg").removeAttr("disabled");
				$("#reviewAddBtn").removeAttr("disabled");
				
		 } 
		
		/*후기 보기 @OA*/
			var reviewPageCount=1;
			
				$.getJSON("${pageContext.request.contextPath}/review_list_eventId_regDate_ajax.do",
					       {"eventId":$("#eventImg").attr("alt")}, 
						   function(JsonObj){
					    	   
					    	   	if(JsonObj.reviewList == null || JsonObj.reviewList == ""){
					    	   		$("#moreReview").css("display", "none");
					    	   	} else {
					    	   		$("#noReview").css("display", "none");
					    	   	}
					    	   
								    $(JsonObj.reviewList).each(function (index, item){
										
										 if(index<(reviewPageCount*3)){
											 	//review 하나를 담는 공간
												var div = $("<div class='media'/>").attr("alt", item.reviewNum).appendTo($("#reviewDiv"));
												
											 	var gender="";
												if(item.member.gender==1){ 
													gender ="남성";
												}else if(item.member.gender==2){
													gender="여성";
												}
												//별 이미지
												var p1 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var p2 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var p3 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var p4 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var p5 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var span= $("<span/>").text(" ").attr( {"display":"inline-block"});
												var br = $("<br/>"); 
											
												//후기 사진이 있을 때만
											    if(item.reviewImage!=null && item.reviewImage!="" && item.revieImage!='null'){
								   				//후기 사진 넣는 공간
											    	var divImg = $("<div class='pull-left'/>").appendTo(div);
													$("<img width='350px' style='margin: 5px 0 5px 0;'/>")
																	.attr("src","./images/test/"+item.reviewImage)
								   								.appendTo(divImg);
													$("<br/>").appendTo(divImg);
								   				//후기 내용 넣는 공간				
								   				var divCont = $("<div class='pull-left' style='padding: 5px 0 5px 0; max-width:400px'/>")
								   								   .text(item.reviewContent)
										    				           .appendTo(div);
								   				$("<br/>").appendTo(divCont);
								   				$("<br/>").appendTo(divCont);
								   				
								   				//메인 스탬프 담는 공간
								   				var stamp =   $("<a class='pull-left'/>").appendTo(divCont);
										    		//회원 닉네임		
										    		$("<strong/>").text(item.member.nickname).appendTo(divCont);
										    		//회원 성별과 나이대
										    		$("<font size='2em'/>").text("("+gender+", "+item.member.birthday+") ").appendTo(divCont);
										    		$("<font size='2em' color='gray'/>").text(item.reviewRegDate+" ").appendTo(divCont);
										    		//별점 넣는 공간
										    		var font3=$("<font color='#00CC99'/>").appendTo(divCont);
										    		
										    		if(item.userId=="<%=session.getAttribute("userId")%>"){
										    		//후기 수정 버튼 넣는 공간
										    		var divBtn = $("<div class='media' name='myReviewBtn' style='margin-top: 5px;'/>").attr("title",item.userId).appendTo(divCont);
										    		}	
										    		
										    		//후기 사진 없을 때  
								   				}else{
								   					//후기 내용 넣는 공간
								   					divCont = $("<div class='media' style='padding: 5px 0 5px 0;' />")
								   									.text(item.reviewContent)
												           				.appendTo(div);
								   					//회원 정보 넣는 공간
								   					var divUserInfo = $("<div class='pull-left' style='padding: 5px 0 5px 0;' />").appendTo(div);
								   					//메인 스탬프 담는 공간
									    				stamp =   $("<a class='pull-left'/>").appendTo(divUserInfo);
									    				//회원 닉네임
								   					$("<strong/>").text(item.member.nickname).appendTo(divUserInfo);
								   					//회원 성별과 나이대
									    				$("<font size='2em'/>").text("("+gender+", "+item.member.birthday+") ").appendTo(divUserInfo);
									    				$("<font size='2em' color='gray'/>").text(item.reviewRegDate+" ").appendTo(divUserInfo); 
									    				//별점 넣는 공간
									    				font3=$("<font color='#00CC99'/>").appendTo(divUserInfo);
									    				
									    				console.log("userId: "+item.userId+"/sessionId: "+"<%=session.getAttribute("userId")%>");
									    				
									    				
									    				if(item.userId=="<%=session.getAttribute("userId")%>"){
									    				//후기 수정 버튼 넣는 공간
									    				divBtn = $("<div class='media' name='myReviewBtn' style='margin-top: 5px;'/>").attr("title",item.userId).appendTo(divUserInfo);
									    				} 
								   				}
									
												 //메인스탬프가 있을 때
												 if(item.member.mainStamp!=null){ 
													 $("<img name='userImg' class='media-object' width='45px' height='45px' style='margin-right: 5px;border: 1px solid #ddd;'/>")
														  .attr("alt",item.userId)
														  .attr("src","${pageContext.request.contextPath}/images/test/"+item.member.mainStamp+".png")
												          .appendTo(stamp);
												}else{
													 $("<img name='userImg' class='media-object' width='45px' height='45px' style='margin-right: 5px;border: 1px solid #ddd;'/>")
													  .attr("alt",item.userId)
													  .attr("src","${pageContext.request.contextPath}/images/test/defaultStamp.png")
											          .appendTo(stamp);
												} 

								   			
								   			//별점 넣기
												switch(item.starPoint){
												case 1: $(font3).append(br,p1,span, item.starPoint);
												break;
												case 2: $(font3).append(br,p1,p2,span, item.starPoint);
												break;
												case 3: $(font3).append(br,p1,p2,p3,span, item.starPoint);
												break;
												case 4: $(font3).append(br,p1,p2,p3,p4,span, item.starPoint);
												break;
												case 5: $(font3).append(br,p1,p2,p3,p4,p5,span, item.starPoint);
												break;
												}
												
										
												//후기 수정 삭제 버튼 달기
											   	var a1 =   $("<a class='pull-left' />").attr("href","${pageContext.request.contextPath}/review_SNS_share.do?reviewNum="+item.reviewNum).appendTo(divBtn);
											    var a3 =   $("<a class='pull-left' />").attr("href","${pageContext.request.contextPath}/review_remove.do?reviewNum="+item.reviewNum).appendTo(divBtn);
											    $("<button class='btn btn-default btn-xs' />").attr({"name":"reviewUpdateForm","alt":item.reviewNum}).text("수정").appendTo(divBtn);
											    $("<input type='button' class='btn btn-default btn-xs' />").val("SNS공유").appendTo(a1);
											    $("<input type='button' class='btn btn-default btn-xs' />").val("삭제").appendTo(a3);  
											    $("<hr style='margin: 10px 0 10px 0;'/>").appendTo("#reviewDiv");
											  
											    
												
												var P1 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P2 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P3 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P4 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P5 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P6 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});

												var P7 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P8 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P9 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P10 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P11 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P12 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P13 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P14 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												var P15 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
												
												
											    
											    /*후기 수정 form*/
										       var Div0=$("<div/>").appendTo($("#reviewDiv"));
											   var form=  $("<form name='reviewUpdateForm' id='reviewUpdateForm' enctype='multipart/form-data' action='${pageContext.request.contextPath}/review_update_move.do' method='post' />").attr("alt",item.reviewNum).appendTo(Div0);
											   var Div  =$("<div class='row' style='padding: 20px;'/>").appendTo(form);
											   var Font= $("<font color='gray'>").appendTo(Div);
											   $("<span class='glyphicon glyphicon-pencil'>").appendTo(Font);
											   var Strong=$("<strong/>").text(" 후기수정").appendTo(Font);	   
											   var REVIEWNUM = $("<input type='hidden' name='reviewNum'/>").val(item.reviewNum).appendTo(Div);
											   var Table = $("<table style='margin-top: 10px;'>").appendTo(Div);
											   var Tr = $("<tr/>").appendTo(Table);
											   var Td=$("<td colspan='2'>").appendTo(Tr);
											   var Font1=$("<font color='#00CC99'/>").appendTo(Td);
											   
											   
											   var Lable=$("<label class='checkbox-inline' />").appendTo(Font1);
											   if(item.starPoint==5){
								   			   var Input=$("<input type='radio' name='starPoint' value='5'/>")
								   			   .attr("checked","checked")
								   			   .appendTo(Lable);
								   			   $(Lable).append(P1,P2,P3,P4,P5);
											   }else{
												   Input=$("<input type='radio' name='starPoint' value='5'/>").appendTo(Lable);
								   			   $(Lable).append(P1,P2,P3,P4,P5);
											   }
											   
											   var Lable1=$("<label class='checkbox-inline' />").appendTo(Font1);
											   if(item.starPoint==4){
								   			   var Input1=$("<input type='radio' name='starPoint' value='4'/>")
								   			    .attr("checked","checked")
								   			   .appendTo(Lable1);
								   			   $(Lable1).append(P6,P7,P8,P9);
											   }else{
												   Input1=$("<input type='radio' name='starPoint' value='4'/>").appendTo(Lable1);
								   			   $(Lable1).append(P6,P7,P8,P9);
											   }
											  
											   var Lable2=$("<label class='checkbox-inline'  />").appendTo(Font1);
											   if(item.starPoint==3){
								   			   var Input2=$("<input type='radio' name='starPoint' value='3'/>")
								   			   .attr("checked","checked")
								   			   .appendTo(Lable2);
								   			   $(Lable2).append(P10,P11,P12);
											   }else{
												   Input2=$("<input type='radio' name='starPoint' value='3'/>").appendTo(Lable2);
								   			   $(Lable2).append(P10,P11,P12);
											   }								    			   
											   var Lable3=$("<label class='checkbox-inline'  />").appendTo(Font1);
											   if(item.starPoint==2){
											 	  var Input3=$("<input type='radio' name='starPoint' value='2'/>")
											     .attr("checked","checked")
											  	 .appendTo(Lable3);
											   	$(Lable3).append(P13,P14);
											   }else{
												   Input3=$("<input type='radio' name='starPoint' value='2'/>").appendTo(Lable3);
								   			   $(Lable3).append(P13,P14);
											   }
											   var Lable4=$("<label class='checkbox-inline'  />").appendTo(Font1);
											   if(item.starPoint==1){
											   var Input4=$("<input type='radio' name='starPoint' value='1'/>")
											    .attr("checked","checked")
											   .appendTo(Lable4);
											   $(Lable4).append(P15);
											   }else{
												   Input4=$("<input type='radio' name='starPoint' value='1'/>").appendTo(Lable4);
								   			   $(Lable4).append(P15);
											   } 
										
										
											   
											   var Tr2 = $("<tr/>").appendTo(Table);
											   var Td2=$("<td colspan='2'>").appendTo(Tr2);
											   var TextArea = $("<textarea id='reviewUpdateCnt' name='reviewContent' class='form-control' style='width: 810px; margin: 10px 0'/>").text(item.reviewContent).appendTo(Td2);
									
											   var Tr3= $("<tr/>").appendTo(Table);
											   var Td3=$("<td />").appendTo(Tr3);
											   var Lable5=$("<label for='reviewImage'/>").appendTo(Td3);
											   var Font2=$("<font color='gray'>").text("이미지").appendTo(Lable5);
											   var Input5=$("<input id='reviewUpdateImg' type='file' name='reviewImage' style='display: inline-block;''/>").appendTo(Td3);
											   
											   
											   var Td4=$("<td style='text-align: right;''>").appendTo(Tr3);
											   var Input6=$("<input type='hidden' name='eventId' value='${eventDetail.eventId}'>").appendTo(Td4);
											   var Input7=$("<input type='submit'  value='후기수정' class='btn btn-default btn-sm' onclick='return updateFormChk();'/>").appendTo(Td4);
											   var Input8=$("<input id='reviewUpdateBtn' type='button' alt='updateCancel' class='btn btn-default btn-sm'/>").val("취소").appendTo(Td4);
											   
											
											   
											   /*후기 수정 @OA*/
											$("form[name='reviewUpdateForm']").hide();
											
											$("button[name='reviewUpdateForm']").click(function(){
											   var divId = $(this).attr("alt");
											  	console.log("div[alt='"+divId+"']");
											  	$("div[alt='"+divId+"']").hide();
												$("form[alt='"+divId+"']").show();

											}); 
												
											
											
											
											$("input[alt='updateCancel']").click(function(){
													$("div[alt='"+divId+"']").show();
												$("form[name='reviewUpdateForm']").hide();
											});   

											  }else{
												  return false;
											  }
										 
										if(reviewPageCount*3>= $(JsonObj.reviewList).size()){
											 $("#moreReview").hide();
										}  
								}
						);
								    	  						
					});
				
				
    


				
				
				
					/*후기 더 보기 버튼 클릭 @OA*/
					 $("#moreReview").click(function(){
								   reviewPageCount+=1;
						
								   $("#reviewDiv *").remove();
								   $.getJSON("${pageContext.request.contextPath}/review_list_eventId_regDate_ajax.do",
										      {"eventId":$("#eventImg").attr("alt")}, 
											  function(JsonObj){
									    		  $(JsonObj.reviewList).each(function(index, item){
									    				
											    		 if(index<(reviewPageCount*3)){
											    			 	//review 하나를 담는 공간
											    				var div = $("<div class='media'/>").attr("alt", item.reviewNum).appendTo($("#reviewDiv"));
											    				
											    			 	var gender="";
											    				if(item.member.gender==1){ 
											    					gender ="남성";
											    				}else if(item.member.gender==2){
											    					gender="여성";
											    				}
											    				//별 이미지
											    				var p1 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var p2 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var p3 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var p4 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var p5 = $("<p/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var span= $("<span/>").text(" ").attr( {"display":"inline-block"});
											    				var br = $("<br/>"); 
															
											    				//후기 사진이 있을 때만
											    			    if(item.reviewImage!=null && item.reviewImage!="" && item.revieImage!='null'){
												    				//후기 사진 넣는 공간
											    			    	var divImg = $("<div class='pull-left'/>").appendTo(div);
											    					$("<img width='350px' style='margin: 5px 0 5px 0;'/>")
											    									.attr("src","./images/test/"+item.reviewImage)
												    								.appendTo(divImg);
											    					$("<br/>").appendTo(divImg);
												    				//후기 내용 넣는 공간				
												    				var divCont = $("<div class='pull-left' style='padding: 5px 0 5px 0; max-width:400px'/>")
												    								   .text(item.reviewContent)
														    				           .appendTo(div);
												    				$("<br/>").appendTo(divCont);
												    				$("<br/>").appendTo(divCont);
												    				
												    				//메인 스탬프 담는 공간
												    				var stamp =   $("<a class='pull-left'/>").appendTo(divCont);
														    		//회원 닉네임		
														    		$("<strong/>").text(item.member.nickname).appendTo(divCont);
														    		//회원 성별과 나이대
														    		$("<font size='2em'/>").text("("+gender+", "+item.member.birthday+") ").appendTo(divCont);
														    		$("<font size='2em' color='gray'/>").text(item.reviewRegDate+" ").appendTo(divCont);
														    		//별점 넣는 공간
														    		var font3=$("<font color='#00CC99'/>").appendTo(divCont);
														    		
														    		if(item.userId=="<%=session.getAttribute("userId")%>"){
														    		//후기 수정 버튼 넣는 공간
														    		var divBtn = $("<div class='media' name='myReviewBtn' style='margin-top: 5px;'/>").attr("title",item.userId).appendTo(divCont);
														    		}	
														    		
														    		//후기 사진 없을 때  
												    				}else{
												    					//후기 내용 넣는 공간
												    					divCont = $("<div class='media' style='padding: 5px 0 5px 0;' />")
												    									.text(item.reviewContent)
											    				           				.appendTo(div);
												    					//회원 정보 넣는 공간
												    					var divUserInfo = $("<div class='pull-left' style='padding: 5px 0 5px 0;' />").appendTo(div);
												    					//메인 스탬프 담는 공간
													    				stamp =   $("<a class='pull-left'/>").appendTo(divUserInfo);
													    				//회원 닉네임
												    					$("<strong/>").text(item.member.nickname).appendTo(divUserInfo);
												    					//회원 성별과 나이대
													    				$("<font size='2em'/>").text("("+gender+", "+item.member.birthday+") ").appendTo(divUserInfo);
													    				$("<font size='2em' color='gray'/>").text(item.reviewRegDate+" ").appendTo(divUserInfo); 
													    				//별점 넣는 공간
													    				font3=$("<font color='#00CC99'/>").appendTo(divUserInfo);
													    				
													    				if(item.userId=="<%=session.getAttribute("userId")%>"){
													    				//후기 수정 버튼 넣는 공간
													    				divBtn = $("<div class='media' name='myReviewBtn' style='margin-top: 5px;'/>").attr("title",item.userId).appendTo(divUserInfo);
													    				} 
												    				}
											    	
											    				 //메인스탬프가 있을 때
											    				 if(item.member.mainStamp!=null){ 
											    					 $("<img name='userImg' class='media-object' width='45px' height='45px' style='margin-right: 5px;border: 1px solid #ddd;'/>")
											    						  .attr("alt",item.userId)
											    						  .attr("src","${pageContext.request.contextPath}/images/test/"+item.member.mainStamp+".png")
											    				          .appendTo(stamp);
											    				}else{
											    					 $("<img name='userImg' class='media-object' width='45px' height='45px' style='margin-right: 5px;border: 1px solid #ddd;'/>")
										    						  .attr("alt",item.userId)
										    						  .attr("src","${pageContext.request.contextPath}/images/test/defaultStamp.png")
										    				          .appendTo(stamp);
											    				} 
								
												    			
												    			//별점 넣기
											    				switch(item.starPoint){
											    				case 1: $(font3).append(br,p1,span, item.starPoint);
											    				break;
											    				case 2: $(font3).append(br,p1,p2,span, item.starPoint);
											    				break;
											    				case 3: $(font3).append(br,p1,p2,p3,span, item.starPoint);
											    				break;
											    				case 4: $(font3).append(br,p1,p2,p3,p4,span, item.starPoint);
											    				break;
											    				case 5: $(font3).append(br,p1,p2,p3,p4,p5,span, item.starPoint);
											    				break;
											    				}
											    				
											    		
											    				//후기 수정 삭제 버튼
											    			   	var a1 =   $("<a class='pull-left' />").attr("href","${pageContext.request.contextPath}/review_SNS_share.do?reviewNum="+item.reviewNum).appendTo(divBtn);
											    			    var a3 =   $("<a class='pull-left' />").attr("href","${pageContext.request.contextPath}/review_remove.do?reviewNum="+item.reviewNum).appendTo(divBtn);
											    			    $("<button class='btn btn-default btn-xs' />").attr({"name":"reviewUpdateForm","alt":item.reviewNum}).text("수정").appendTo(divBtn);
											    			    $("<input type='button' class='btn btn-default btn-xs' />").val("SNS공유").appendTo(a1);
											    			    $("<input type='button' class='btn btn-default btn-xs' />").val("삭제").appendTo(a3);  
											    			    $("<hr style='margin: 10px 0 10px 0;'/>").appendTo("#reviewDiv");
											    			  
											    			    
											    				
											    				var P1 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P2 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P3 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P4 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P5 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P6 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
									
											    				var P7 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P8 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P9 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P10 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P11 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P12 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P13 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P14 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				var P15 = $("<span/>").attr( {"class":"glyphicon glyphicon-star","display":"inline-block"});
											    				
											    				
											    			    
											    			    /*후기 수정 form*/
											    		       var Div0=$("<div/>").appendTo($("#reviewDiv"));
											    			   var form=  $("<form name='reviewUpdateForm' id='reviewUpdateForm' enctype='multipart/form-data' action='${pageContext.request.contextPath}/review_update_move.do' method='post' onclick='return updateFormChk();'/>").attr("alt",item.reviewNum).appendTo(Div0);
											    			   var Div  =$("<div class='row' style='padding: 20px;'/>").appendTo(form);
											    			   var Font= $("<font color='gray'>").appendTo(Div);
											    			   $("<span class='glyphicon glyphicon-pencil'>").appendTo(Font);
											    			   var Strong=$("<strong/>").text(" 후기수정").appendTo(Font);	   
											    			   var REVIEWNUM = $("<input type='hidden' name='reviewNum'/>").val(item.reviewNum).appendTo(Div);
											    			   var Table = $("<table style='margin-top: 10px;'>").appendTo(Div);
											    			   var Tr = $("<tr/>").appendTo(Table);
											    			   var Td=$("<td colspan='2'>").appendTo(Tr);
											    			   var Font1=$("<font color='#00CC99'/>").appendTo(Td);
											    			   
											    			   
											    			   var Lable=$("<label class='checkbox-inline' />").appendTo(Font1);
											    			   if(item.starPoint==5){
												    			   var Input=$("<input type='radio' name='starPoint' value='5'/>")
												    			   .attr("checked","checked")
												    			   .appendTo(Lable);
												    			   $(Lable).append(P1,P2,P3,P4,P5);
											    			   }else{
											    				   Input=$("<input type='radio' name='starPoint' value='5'/>").appendTo(Lable);
												    			   $(Lable).append(P1,P2,P3,P4,P5);
											    			   }
											    			   
											    			   var Lable1=$("<label class='checkbox-inline' />").appendTo(Font1);
											    			   if(item.starPoint==4){
												    			   var Input1=$("<input type='radio' name='starPoint' value='4'/>")
												    			    .attr("checked","checked")
												    			   .appendTo(Lable1);
												    			   $(Lable1).append(P6,P7,P8,P9);
											    			   }else{
											    				   Input1=$("<input type='radio' name='starPoint' value='4'/>").appendTo(Lable1);
												    			   $(Lable1).append(P6,P7,P8,P9);
											    			   }
											    			  
											    			   var Lable2=$("<label class='checkbox-inline'  />").appendTo(Font1);
											    			   if(item.starPoint==3){
												    			   var Input2=$("<input type='radio' name='starPoint' value='3'/>")
												    			   .attr("checked","checked")
												    			   .appendTo(Lable2);
												    			   $(Lable2).append(P10,P11,P12);
											    			   }else{
											    				   Input2=$("<input type='radio' name='starPoint' value='3'/>").appendTo(Lable2);
												    			   $(Lable2).append(P10,P11,P12);
											    			   }								    			   
											    			   var Lable3=$("<label class='checkbox-inline'  />").appendTo(Font1);
											    			   if(item.starPoint==2){
											    			 	  var Input3=$("<input type='radio' name='starPoint' value='2'/>")
											    			     .attr("checked","checked")
											    			  	 .appendTo(Lable3);
											    			   	$(Lable3).append(P13,P14);
											    			   }else{
											    				   Input3=$("<input type='radio' name='starPoint' value='2'/>").appendTo(Lable3);
												    			   $(Lable3).append(P13,P14);
											    			   }
											    			   var Lable4=$("<label class='checkbox-inline'  />").appendTo(Font1);
											    			   if(item.starPoint==1){
											    			   var Input4=$("<input type='radio' name='starPoint' value='1'/>")
											    			    .attr("checked","checked")
											    			   .appendTo(Lable4);
											    			   $(Lable4).append(P15);
											    			   }else{
											    				   Input4=$("<input type='radio' name='starPoint' value='1'/>").appendTo(Lable4);
												    			   $(Lable4).append(P15);
											    			   } 
											    		
											    		
											    			   
											    			   var Tr2 = $("<tr/>").appendTo(Table);
											    			   var Td2=$("<td colspan='2'>").appendTo(Tr2);
											    			   var TextArea = $("<textarea id='reviewUpdateCnt' name='reviewContent' class='form-control' style='width: 810px; margin: 10px 0'/>").text(item.reviewContent).appendTo(Td2);
											    	
											    			   var Tr3= $("<tr/>").appendTo(Table);
											    			   var Td3=$("<td />").appendTo(Tr3);
											    			   var Lable5=$("<label for='reviewImage'/>").appendTo(Td3);
											    			   var Font2=$("<font color='gray'>").text("이미지").appendTo(Lable5);
											    			   var Input5=$("<input id='reviewUpdateImg' type='file' name='reviewImage' style='display: inline-block;''/>").appendTo(Td3);
											    			   
											    			   
											    			   var Td4=$("<td style='text-align: right;''>").appendTo(Tr3);
											    			   var Input6=$("<input type='hidden' name='eventId' value='${eventDetail.eventId}'>").appendTo(Td4);
											    			   var Input7=$("<input type='submit'  value='후기수정' class='btn btn-default btn-sm'/>").appendTo(Td4);
											    			   var Input8=$("<input id='reviewUpdateBtn' type='button' alt='updateCancel' class='btn btn-default btn-sm'/>").val("취소").appendTo(Td4);
											    			   
											    			
											    			   
											    			   /*후기 수정 @OA*/
											    			$("form[name='reviewUpdateForm']").hide();
											    			
											    			$("button[name='reviewUpdateForm']").click(function(){
											    			   var divId = $(this).attr("alt");
											    			  	console.log("div[alt='"+divId+"']");
											    			  	$("div[alt='"+divId+"']").hide();
											    				$("form[alt='"+divId+"']").show();

											    			}); 
											    				
											    			
											    			
											    			
											    			$("input[alt='updateCancel']").click(function(){
											    					$("div[alt='"+divId+"']").show();
											    				$("form[name='reviewUpdateForm']").hide();
											    			});  
										    			  }else{
										    				  return false;
										    			  }
									    	
									    		  		if(reviewPageCount*3>= $(JsonObj.reviewList).size()){
											    			 $("#moreReview").hide();
											    		}  
									    			  
							 				         });
											});
					     });
			
		
				 /* QnA 작성 로그인 체크 @ sy */
					//로그아웃 상태 @ sy
					if( $("#memberIdCheck").val() == null ||  $("#memberIdCheck").val() == "" ){	
						$("#sendQnaForm").attr("disabled", "disabled").val("질문을 등록하려면 로그인해 주세요.");
						$("#sendQnaBtn").attr("disabled", "disabled");
						$("#submitQnaForm").click(function(){
							$("#loginModalLink").click();
						})
					// 로그인 상태 @ sy
					} else {
						// QnA 매니저이지만 해당 행사 담당자 아닐 때 & 관리자일 때 @ sy 
						if(  $("#memberTypeCheck").val() != "member" && $("#rightEventManager").val() == "N"){
							$("#sendQnaForm").attr("disabled", "disabled").val("해당 행사의 담당자가 아니면 Q&A를 작성하실 수 없습니다.");	
						}	
					} // end if
					
					
					/*내 캘린더 담기 로그인 전 클릭 방지*/
					if($("#userIdOACheck").val()==null || $("#userIdOACheck").val().trim()==""){
						
						$("#addMyCalendar").attr("disabled","disabled");
						$("#addMyCalendarForm").click(function() {
							$("#loginModalLink").click();
							return false;
						});
					
					}else{
						
						/* 캘린더 담았는지 체크 @sy */
						$.getJSON("${pageContext.request.contextPath}/check_my_calendar.do",
								{ "userId" : $("#userIdOACheck").val(), "eventId" : $("#eventIdOACheck").val() },
								function(jsonObj) {
									if(jsonObj.status == "T"){
										$("#addMyCalendar").attr("disabled","disabled");
										$("#myCalExist").css("display", "inline-block");
									} else {
										$("#addMyCalendar").removeAttr("disabled");
										$("#myCalExist").css("display", "none");
									}
								});
						
					}
					
					/* 내 캘린더 추가시 모달 */
					if( $("#addStampSuccess").val() == "Y" ){
						$("#addStampModal").modal('show');
					}
					
					$("#goToMyStamp").click(function() {
						location.href="${pageContext.request.contextPath}/member_mypage.do?tabId=myStampTab";
					});
					
					/* 내 캘린더 추가시 모달 */
					if( $("#addCalSuccess").val() == "Y" ){
						$("#addCalModal").modal('show');
					}
					
					$("#goToMyCalendar").click(function() {
						location.href="${pageContext.request.contextPath}/member_mypage.do";
					});
					
					
					/* 트위터 로딩 @OA*/
					$.post("${pageContext.request.contextPath}/twitter_write.do",
							 {"query": $("#eventTitleOACheck").val()} ,
							function(JsonObj){
								 	var listSize = 0;
								 	if(JsonObj.status){
								 		$(JsonObj.tweetList).each(function (index,item){
											
											var cDate = new Date(Date.parse(item.createAt));
											
											var cDate_utc_timeStamp = Date.UTC(cDate.getUTCFullYear(),cDate.getUTCMonth()+1, cDate.getUTCDate() , 
													cDate.getUTCHours(), cDate.getUTCMinutes(), cDate.getUTCSeconds(), cDate.getUTCMilliseconds());
																				
											var now = new Date();																	
											var now_utc_timestamp = Date.UTC(now.getUTCFullYear(),now.getUTCMonth()+1, now.getUTCDate() , 
											      now.getUTCHours(), now.getUTCMinutes(), now.getUTCSeconds(), now.getUTCMilliseconds());

										
											
										
										/* 	console.log("now: "+now.getUTCFullYear()+"/"+(now.getUTCMonth()+1)+"/"+ now.getUTCDate()+"/"+
										      (now.getUTCHours()+9)+":"+now.getUTCMinutes()+":"+now.getUTCSeconds()+"/"+ now.getUTCMilliseconds());
											
											console.log("createdAT:" +item.createAt);
											
											console.log("twitter:"+cDate.getUTCFullYear()+"/"+(cDate.getUTCMonth()+1)+"/"+cDate.getUTCDate()+"/"+ 
													(cDate.getUTCHours()+9)+":"+ cDate.getUTCMinutes()+":"+ cDate.getUTCSeconds()+"/"+ cDate.getUTCMilliseconds());
											
											 */
											var time = "";
											if((now_utc_timestamp-cDate_utc_timeStamp)<0){
											 time = "방금";
											}else if((now_utc_timestamp- cDate_utc_timeStamp )/1000<60)	{
											   time=Math.floor((now_utc_timestamp- cDate_utc_timeStamp)/1000);
												 time = time+"초 전";	
											}else if((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60)<60){
												 time=Math.floor((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60));
												 time = time+"분 전";			
											 }else if((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60*60)<24){
												 time = Math.floor((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60*60) );
												 time = time+"시간 전";										
											 }else{
												 time = Math.floor((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60*60*24) );
												 time = time + "일 전";
											 }																										 
											

												var tr = $("<tr class='twitterResult'/>");
												var td= $("<td style='padding: 15px;'/>").appendTo(tr);
												
												var div= $("<div class='media'/>").appendTo(td);
												var a =$("<a class='pull-left'/>").attr("href", "http://twitter.com/"+item.screenName).attr("target","_blank").appendTo(div);
												$("<img  class='media-object'  alt='"+item.screenName+"' width='64px' height='64px' style='border: 1px solid #ddd;'/>").attr("src", item.profileImage).appendTo(a);
											
												var div2= $(" <div class='media-body' style='padding: 5px 0 5px 0;'/>").appendTo(div)
												$("<strong/>").text(item.name+" ").appendTo(div2);
												var a2 =$("<a />").attr("href", "http://twitter.com/"+item.screenName).attr("target","_blank").appendTo(div2);
												var text = $("<span/>").text("@"+item.screenName).appendTo(a2);
											    $("<br/>").appendTo(div2); 
												
											    $("<span/>").text(item.beforeText+" ").appendTo(div2);
												
												if(item.url!=null||item.url.trim()!=""){
												var a3 =$("<a/>").attr("href", item.url).attr("target","_blank").appendTo(div2);
												$("<span/>").text(item.url).appendTo(a3);
												}
												
												if(item.middleText!=null||item.middleText.trim()!=""||item.url2!=null||item.url2.trim()!=null){
												$("<span/>").text(" "+item.middleText).appendTo(div2);
												var A4 =$("<a/>").attr("href", item.url2).attr("target","_blank").appendTo(div2);
												$("<span/>").text(item.url2).appendTo(A4);
												}
												
												if(item.afterMiddleText!=null||item.afterMiddleText.trim()!=""||item.url3!=null||item.url3.trim()!=null){
												$("<span/>").text(" "+item.afterMiddleText).appendTo(div2);
												var A5 =$("<a/>").attr("href", item.url3).attr("target","_blank").appendTo(div2);
												 $("<span/>").text(item.url3).appendTo(A5);
												}
												
												$("<span/>").text(item.afterText).appendTo(div2);
												
												var div3 = $("<div/>").appendTo(div2);
												var img2 =$("<img src='./images/test/icon_twitter.png'/>").appendTo(div3);
												$("<span/>").text(" "+time).appendTo(div3);
												
												tr.appendTo("#twitterTable");
												listSize = listSize+1;
										});
								 		
								 		if(listSize <= 2){
											$("#contentTwitter").removeAttr("style");
										}
								 		
								 	}else{
								 		var td= $("<td style='padding: 15px;'/>").text("검색결과가 존재하지 않습니다.")
								 		var tr = $("<tr class='twitterResult'/>").append(td);
								 		$("#twitterTable").append(tr);
								 		$("#contentTwitter").removeAttr("style");
								 	}
									
				     });	
					
					/*트위터 새로고침 @OA*/
					$("#refreshTweet").click(function(){
						$(".twitterResult").remove();
						//ajax로 트위터 가져오기
								$.post("${pageContext.request.contextPath}/twitter_write.do",
										 {"query": $("#eventTitleOACheck").val()} ,
										function(JsonObj){
											if(JsonObj.status){
												var listSize=0;
												$(JsonObj.tweetList).each(function (index,item){
													
													var cDate = new Date(Date.parse(item.createAt));
													var cDate_utc_timeStamp = Date.UTC(cDate.getUTCFullYear(),cDate.getUTCMonth(), cDate.getUTCDate() , 
															cDate.getUTCHours(), cDate.getUTCMinutes(), cDate.getUTCSeconds(), cDate.getUTCMilliseconds());
																						
													var now = new Date();																	
													var now_utc_timestamp = Date.UTC(now.getUTCFullYear(),now.getUTCMonth(), now.getUTCDate() , 
													      now.getUTCHours(), now.getUTCMinutes(), now.getUTCSeconds(), now.getUTCMilliseconds());

													var time = "";
													if((now_utc_timestamp-cDate_utc_timeStamp)<0){
													 time = "방금";
													}else if((now_utc_timestamp- cDate_utc_timeStamp )/1000<60)	{
													   time=Math.floor((now_utc_timestamp- cDate_utc_timeStamp)/1000);
														 time = time+"초 전";	
													}else if((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60)<60){
														 time=Math.floor((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60));
														 time = time+"분 전";			
													 }else if((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60*60)<24){
														 time = Math.floor((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60*60) );
														 time = time+"시간 전";										
													 }else{
														 time = Math.floor((now_utc_timestamp- cDate_utc_timeStamp )/(1000*60*60*24) );
														 time = time + "일 전";
													 }																										 
													

														var tr = $("<tr class='twitterResult'/>");
														var td= $("<td style='padding: 15px;'/>").appendTo(tr);
														
														var div= $("<div class='media'/>").appendTo(td);
														var a =$("<a class='pull-left'/>").attr("href", "http://twitter.com/"+item.screenName).attr("target","_blank").appendTo(div);
														var img =$("<img  class='media-object'  alt='"+item.screenName+"' width='64px' height='64px' style='border: 1px solid #ddd;'/>").attr("src", item.profileImage).appendTo(a);
													
														var div2= $(" <div class='media-body' style='padding: 5px 0 5px 0;'/>").appendTo(div)
														var strong= $("<strong/>").text(item.name+" ").appendTo(div2);
														var a2 =$("<a />").attr("href", "http://twitter.com/"+item.screenName)
																		  .attr("target","_blank")
																		  .appendTo(div2);
														var text = $("<span/>").text("@"+item.screenName).appendTo(a2);
													    var br = $("<br/>").appendTo(div2); 
														var text2=$("<span/>").text(item.beforeText+" ").appendTo(div2);
														if(item.url!=null||item.url.trim()!=""){
														var a3 =$("<a/>").attr("href", item.url).attr("target","_blank").appendTo(div2);
														var text3 = $("<span/>").text(item.url).appendTo(a3);
														}
														var text4 = $("<span/>").text(" "+item.afterText).appendTo(div2);
														
														var div3 = $("<div/>").appendTo(div2);
														var img2 =$("<img src='./images/test/icon_twitter.png'/>").appendTo(div3);
														var text5 = $("<span/>").text(" "+time).appendTo(div3);
														
														tr.appendTo("#twitterTable");
														
														listSize = listSize+1;
														
												});
												
												if(listSize <= 2){
													$("#contentTwitter").removeAttr("style");
												}
										
											}else{
												var td= $("<td style='padding: 15px;'/>").text("검색결과가 존재하지 않습니다.")
										 		var tr = $("<tr class='twitterResult'/>").append(td);
										 		$("#twitterTable").append(tr);
										 		$("#contentTwitter").removeAttr("style");
										 	}
												
							  });
					  });		
					
					

					
	  });

	/* 후기 form 체크 @OA*/
	function formChk(){
					
					if($("#userIdOACheck").val()==null||$("#userIdOACheck").val().trim()==""){
						$("#loginModalLink").click();
						return false;
					}
					
				 	if($("input[type=radio]:checked").val()==null||$("input[type=radio]:checked").val().trim()==""){
						alert("별점을 선택해 주세요");
						return false;					
					}
					
					if($("#reviewCnt").val()==null ||$("#reviewCnt").val().trim()==""){ 
						alert("후기 내용을 입력해 주세요");
						return false;
					}
					
					if($("#reviewImg").val()==null||$("#reviewImg").val().trim()==""){
						alert("사진 미등록시 스탬프가 부여되지 않습니다.");
					} 
					
					if($("#reviewImg").val().endsWith('jpg')||$("#reviewImg").val().endsWith('jpeg')){
						
						return true;
					}else{
						alert("확장자가 jpg/jpeg인 파일만 등록 가능합니다.");
						return false;
					}
					
		return true;
		
	 };
	 
	 
		/* 후기 form 체크 @OA*/
		function updateFormChk(){
						
						if($("#userIdOACheck").val()==null||$("#userIdOACheck").val().trim()==""){
							alert("로그인이 필요한 기능입니다.");
							$("#loginModalLink").click();
							return false;
						}
						
					 	if($("input[type=radio]:checked").val()==null||$("input[type=radio]:checked").val().trim()==""){
							alert("별점을 선택해 주세요");
							return false;					
						}
					 
						if($("#reviewUpdateCnt").val()==null ||$("#reviewUpdateCnt").val().trim()==""){ 
							alert("후기 내용을 입력해 주세요");
							return false;
						}
						
						if($("#reviewUpdateImg").val()==null||$("#reviewUpdateImg").val().trim()==""){
							alert("사진 미등록시 스탬프가 부여되지 않습니다.");
						} 
						
						if(!$("#reviewUpdateImg").val().endsWith('jpg')||!$("#reviewUpdateImg").val().endsWith('jpeg')){
							alert("확장자가 jpg/jpeg인 파일만 등록 가능합니다.");
							return false;
						}
						$("form[name='reviewUpdateForm']").hide();			
			return true;
			
		 };
		 
		 
		 	 
	 
	 
	 
	 
	 
	 
	 
	/* QnA 삭제 @ sy */
	function deleteQna(eventQnaNum) {
		$.getJSON("${pageContext.request.contextPath}/qna_delete.do",
				{ "eventQnaNum" : eventQnaNum, "eventId" : $("#eventIdOACheck").val() },
				function(jsonObj) {
					if(jsonObj.status){
						alert("Q&A가 삭제되었습니다.");
						$("#"+jsonObj.talkId).hide();
						if(jsonObj.emptyList == "true"){
							var noQna =  $('<div style="margin-top: 130px; text-align: center; color: gray;"><div/>')
							.html("행사에 대해 궁금한 점은<br/>Q&A로 남겨주세요:)");
							$("#contentQnaListDiv").append( noQna );
						}
					} else {
						alert("fail");
					}
				});
	}
	
	/* QnA 답변 등록 폼 바꾸기 @sy */
	function addReplyForm(eventQnaNum) {
		$.getJSON("${pageContext.request.contextPath}/qna_check_reply.do",
							{ "eventQnaNum" : eventQnaNum },
							function(jsonObj) {
								if(jsonObj.status == "true"){
									alert("이미 답변을 등록한 질문글입니다");
								} else {
									var sendReplyForm = document.getElementById("sendReplyForm");
									$("#sendReply").show();
									$("#sendQna").hide();
									sendReplyForm.focus();
									$("#eventQnaNumMod").val(eventQnaNum);
								}
							});
		return false;
	}

	
</script>

<style type="text/css">
	textarea{ resize: none; }
	.qnaQuestion { width: 480px; }
	.qnaRightFirstTd {
		padding-right: 0;
		padding-left: 130px; 
		width: 450px;
	}
	.qnaRightSecondTd { 
		vertical-align: top;
		padding: 20px 10px 5px 0; 
	}
	.qnaRightDiv {
		background-color: #FFF; 
		border-right: 0; 
		padding: 10px 15px; 
		width: 320px; 
		text-align: left; 
		box-shadow: 3px 2px 3px silver; 
		font-size: small;"
	}
	.qnaLeftFirstTd { 
		vertical-align: top;
		padding: 20px 0 5px 10px; 
	}
	.qnaLeftSecondTd { padding-left: 0; }
	.qnaLeftDiv {
		background-color: #E8F4EE; 
		border-left: 0; 
		padding: 10px 15px; 
		width: 320px; 
		box-shadow: 3px 2px 3px silver; 
		font-size: small;"
	}
	.qnaRegArea {
		border: 1px solid #ddd;
		border-top: 0;
		background-color: #F5F5F5;
		height: 60px;
		width: 500px;
	}
	.qnaRegForm {
		width: 428px;
		height: 60px;
		margin: 0;
		display: inline-block;
		border-radius: 0;
	}
	.qnaRegBtn {
		background-color: #eee; 
		width:70px; 
		height: 60px; 
		margin: 0 -4px 0 -4px; 
		padding: 7px 6px; 
		display: inline-block; 
		border-radius: 0;
	}
	
	
	#loading,#blogLoading, #newsLoading
	{
	    display:block;
	    width:70px;
	    height: 70px;
	    position: relative;
	    top: 50%;
	    left: 50%;
	    padding:10px;
	    margin-left: -50px;
	    margin-top: -30px;
	    z-index:2;
	    overflow: auto;
	}
	.chartLabel {
		display: inline-block;
		position: absolute;
		width: 190px;
		height: 190px;
		text-align: center;
		vertical-align: middle;
		line-height: 194px;
		color: gray;
		font-size: 30px;
		font-weight: bolder;
		letter-spacing: -2px;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	.chartTable-td {
		width: 250px; 
		padding: 0 15px 0 0 ; 
		text-align: center; 
		font-weight: bold;
	}
	.blogMore { font-size: xx-large; padding: 0 5px 5px 0; color: gray; }
	.blogMore a { color: gray; }
	.blogMore a:hover { text-decoration: none; color: black; }
	.blogMemo {
		display: inline-block;
		height: 250px;
		width: 270px;
		padding: 40px 20px 20px 20px;
		text-align: center;
		vertical-align: middle;
		margin-bottom: 20px;
	}
	#contentBlog { margin-left: -10px; margin-right: -10px; }
	.chartTitle {
		position: absolute;
		display: inline-block;
		width: 190px;
		text-align: center;
		font-weight: bold;
		margin-left: -195px;
		margin-top: 200px;
	}
</style>

</head>


<body>


<div class="row" style="width: 1280px;">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<!-- 세션의 아이디값 가져오기 @OA-->
		<input type="hidden" id="userIdOACheck" value="${sessionScope.member.userId}"/>
		<!-- 이벤트 이름값 가져오기 @OA-->
		<input type="hidden" id="eventTitleOACheck" value="${eventDetail.eventTitle }">
		<!-- 이벤트 아이디값 가져오기 @OA-->
		<input type="hidden" id="eventIdOACheck" value="${eventDetail.eventId}">

 		<div class="row" id="contentTitle" style="padding: 20px 0 20px 0;">
 			<div style="width: 350px; display: inline-block; vertical-align: top;">
 				<c:choose>
					<c:when test="${eventDetail.eventThumbnail!=null }">
						<img src="${eventDetail.eventThumbnail }" width="350px" 
									id="eventImg" alt="${eventDetail.eventId}" />
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath }/images/main/noImage.png" width="350px"
									 id="eventImg" alt="${eventDetail.eventId}" />
					</c:otherwise>
				</c:choose>
 			</div>
		
		<div style="width: 499px; display: inline-block; padding-left: 30px;">
		<table style="width: 100%">
			<tr>
				<td style="text-align: right;">
					<!-- AddThis Button BEGIN -->
					<div class="addthis_toolbox addthis_default_style ">
					<a class="addthis_button_preferred_1"></a>
					<a class="addthis_button_preferred_2"></a>
					<a class="addthis_button_preferred_3"></a>
					<a class="addthis_button_compact"></a>
					</div>

					<!-- <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script> -->

					<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-537d50997fb92e4f"></script>
					<!-- AddThis Button END -->
				</td>
			</tr>
			<tr>
				<td>
					<h3 style="margin: 5px 0; font-weight:bold;">${eventDetail.eventTitle }</h3>
				</td>
			</tr>
			<tr>
				<td style="font-size: large; font-weight: bold; padding-bottom: 5px;">
						${eventDetail.eventStartDate} ~ ${eventDetail.eventEndDate}
				 </td>
			</tr>
			<tr>
				<td style="color: #6dbd96; padding-bottom: 15px;">
					<h4 style="margin: 0">
					<!-- 별점 로직 나오면 차후 eventDetail.eventAvgStar로 가져오면됨. -->
			     	<c:if test="${eventDetail.eventAvgStar>=5 }">
					<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>&nbsp;	
					</c:if>
					<c:if test="${eventDetail.eventAvgStar>=4.5&&eventDetail.eventAvgStar<5 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star-empty"></span>&nbsp;	
					</c:if>
					<c:if test="${eventDetail.eventAvgStar>=4&&eventDetail.eventAvgStar<4.5 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>&nbsp;			     	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=3.5&&eventDetail.eventAvgStar<4 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star-empty"></span>&nbsp;					     	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=3&&eventDetail.eventAvgStar<3.5 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>&nbsp;	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=2.5&&eventDetail.eventAvgStar<3 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star-empty"></span>&nbsp;	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=2&&eventDetail.eventAvgStar<2.5 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star"></span>&nbsp;	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=1.5&&eventDetail.eventAvgStar<2 }">
						<span class="glyphicon glyphicon-star"></span>
				     	<span class="glyphicon glyphicon-star-empty"></span>&nbsp;	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=1&&eventDetail.eventAvgStar<1.5 }">
						<span class="glyphicon glyphicon-star"></span>&nbsp;	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=0.5&&eventDetail.eventAvgStar<1}">
						<span class="glyphicon glyphicon-star-empty"></span>&nbsp;	
					</c:if>			     	
					<c:if test="${eventDetail.eventAvgStar>=0&&eventDetail.eventAvgStar<0.5}">						
					</c:if>			     	
			     	 <c:choose>
						<c:when test="${eventDetail.eventAvgStar==0}">
								<strong>${eventDetail.eventAvgStar}
								<span style="font-size: medium;">평가해주세요</span></strong>
						</c:when>
						<c:otherwise>
						<%EventDetail eventDetail1=(EventDetail)request.getAttribute("eventDetail");
						float count=((float)Math.floor(eventDetail1.getEventAvgStar()*10))/10;%>
						<strong><%= count %></strong>
						</c:otherwise>
						</c:choose>
						</h4>
				</td>
			</tr>
			
			<tr>
				<td style="padding-bottom: 25px;" id="addMyCalendarForm">
					<a href="${pageContext.request.contextPath}/add_my_calendar.do?eventId=${eventDetail.eventId}">
					<button id="addMyCalendar" class="btn btn-default">내 캘린더에 담기</button></a>&nbsp;
					<span id="myCalExist" style="display: none; font-size: smaller; color: mediumslateblue;">이미 캘린더에 담은 행사입니다</span>
					<input type="hidden" id="addCalSuccess" value="${addCalSuccess}"/>
				</td>
			</tr>
			
			<c:if test="${eventDetail.playTime != null && eventDetail.playTime.trim() != '' }">
			<tr>
				<td style="padding-bottom: 20px;">
					<span style="font-weight: bold; color: #4f8c70;">관람 시간</span>
					<hr style="margin: 5px 0; border-color: #ccc;"/>
					${eventDetail.playTime}
				</td>
			</tr>
			</c:if>
			
			<c:if test="${eventDetail.eventAddress != null && eventDetail.eventAddress.trim() != '' }">
			<tr>
				<td style="padding-bottom: 20px;">
					<span style="font-weight: bold; color: #4f8c70;">주소 및 장소</span>
					<hr style="margin: 5px 0; border-color: #ccc;"/>
					${eventDetail.eventAddress}
				<c:if test="${eventDetail.eventPlace != null && eventDetail.eventPlace.trim() != ''}">
					&nbsp;<strong>${eventDetail.eventPlace}</strong>
				</c:if>
				</td>
			</tr>
			</c:if>
			
			<c:if test="${eventDetail.eventAgeLimit != null && eventDetail.eventAgeLimit.trim() != '' }">
			<tr>
				<td style="padding-bottom: 20px;">
				<span style="font-weight: bold; color: #4f8c70;">연령 제한</span>
				<hr style="margin: 5px 0; border-color: #ccc;"/>
				${eventDetail.eventAgeLimit }
				</td>
			</tr>
			</c:if>
			
			<c:if test="${eventDetail.eventCost != null && eventDetail.eventCost.trim() != '' }">	
			<tr>
				<td style="padding-bottom: 20px;"> 		
					<span style="font-weight: bold; color: #4f8c70;">이용료</span>
				<hr style="margin: 5px 0; border-color: #ccc;"/>
					${eventDetail.eventCost }
				</td>
			</tr>
			</c:if>
			
			<c:if test="${eventDetail.bookingPlace != null && eventDetail.bookingPlace.trim() != '' }">
			<tr>
				<td style="padding-bottom: 20px;">
				<span style="font-weight: bold; color: #4f8c70;">예매처</span>
				<hr style="margin: 5px 0; border-color: #ccc;"/>
				${eventDetail.bookingPlace }
				</td>
			</tr>
			</c:if>

		</table>
		</div>

		
		</div><!-- end contentTitle -->

		<span class="glyphicon glyphicon-stats seoulnori-mid-title" style="font-size: 20px;"></span>
		<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 트렌드지수</span>
		<br/><br/>
		
		<input type="hidden" id="eventIssuePoint" value="${eventDetail.eventIssuePoint}"/>
		<div id="noriChartLabel" class="chartLabel"></div>
		<canvas id="noriChart" width="190" height="190"></canvas>
		<div class="chartTitle">전체지수</div>
		
		<div style="display: inline-block; width: 10px; height: 190px;"></div>
		
		<input type="hidden" id="eventNaverPoint" value="${eventPoint.naverTrendPoint}"/>
		<div id="naverChartLabel" class="chartLabel"></div>
		<canvas id="naverChart" width="190" height="190"></canvas>
		<div class="chartTitle">네이버 검색지수</div>
		
		<div style="display: inline-block; width: 10px; height: 190px;"></div>
		
		<input type="hidden" id="eventTweetPoint" value="${eventPoint.tweetPoint}"/>
		<div id="tweetChartLabel" class="chartLabel"></div>
		<canvas id="tweetChart" width="190" height="190"></canvas>
		<div class="chartTitle">트윗지수</div>
		
		<div style="display: inline-block; width: 10px; height: 190px;"></div>
		
		<input type="hidden" id="eventCount" value="${eventDetail.eventCount}"/>
		<div id="countChartLabel" class="chartLabel"></div>
		<canvas id="countChart" width="190" height="190"></canvas>
		<div class="chartTitle">조회수</div>
			
		
		<br/><br/><br/><br/><br/><br/>
		
		<c:if test="${eventDetail.eventContent!=null }">
		<span class="glyphicon glyphicon-info-sign seoulnori-mid-title" style="font-size: 20px;"></span>
		<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 정보</span>
		<br/><br/>
	
		<div class="row" id="contentDesc" 
			style="padding: 20px; margin-bottom: 20px; border: 1px solid #D4D4D4; ">
			<p>${eventDetail.eventContent }</p>
			
		<%-- 	<img src="${eventDetail.eventThumbnail }" style="display: inline-block; width: 400px;"/> --%>
		<c:if test="${eventDetail.mapX!=null }">
			<c:import url="/view_event/map.jsp"/>
		</c:if>
		
		</div>
		</c:if>
		<br/><br/>
		
		<!-- 트위터 새로고침 버튼 -->
		<font  id="refreshTweet" color="gray">
				<span class="glyphicon glyphicon-refresh seoulnori-mid-title" style="font-size: 20px;"></span>
				<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 실시간트윗</span>
		</font>
		<br/><br/>
		
		<!-- 트위터 보여주는 공간 -->
		<div class="row" id="contentTwitter" style="height: 360px; overflow-y: scroll;">
			<img id="loading" src="${pageContext.request.contextPath }/images/test/loading.gif" style="float:left;"/>
			<table id="twitterTable" class="table table-striped" style="border-bottom: 1px solid #ddd;">

			</table>
		</div>
		<br/><br/><br/>
		
		
		<span class="glyphicon glyphicon-bold seoulnori-mid-title" style="font-size: 20px;"></span>
		<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 블로그</span>
		<br/><br/>
		
		<!-- 블로그 보여주는 공간 -->
		<div class="row" id="contentBlog">

			<c:choose>
				<c:when test="${blogList!=null&&blogList.size()>0}">
					<c:forEach items="${blogList }" var="blog" varStatus="status">
						
						<div class="blogMemo">
							<table>
								<tr>
									<td style="font-size: 16.4px; font-weight: bold; padding-bottom: 10px;">
										<a href="${blog.blogLink}" target="_blank">${blog.blogTitle}</a>
									</td>
								</tr>
								<tr>
									<td>
										<div style="width: 229px; overflow: hidden;">${blog.blogDescription}</div>
									</td>
								</tr>
							</table>
						</div>
						
						<c:if test="${status.index%3 != 2}">
							&nbsp;&nbsp;
						</c:if>
						
					</c:forEach>
					</c:when>
				<c:otherwise>
					검색 결과가 존재하지 않습니다.
				</c:otherwise>
			</c:choose>

		</div>
		<br/><br/><br/>
		
		<span class="glyphicon glyphicon-list-alt seoulnori-mid-title" style="font-size: 20px;"></span>
		<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 뉴스</span>
		<br/><br/>
		
		
		
		<!-- 뉴스 보여주는 공간 -->
		<div class="row" id="contentNews" style="height: 295px; overflow-y: scroll;"  >
			<table id="newsTable" class="table table-striped">
			<c:choose>
				<c:when test="${newsList!=null&&newsList.size()>0}">
					<c:forEach items="${newsList }" var="news">
						<tr>
							<td>
							<a href="${news.eventNewsLink }" target="_blank">${news.eventNewsTitle }</a><br/><br/>
							${news.eventNewsDescription }</td>
						</tr>
					</c:forEach>
					</c:when>
				<c:otherwise>
					<tr><td>검색 결과가 존재하지 않습니다.</td></tr>
				</c:otherwise>
			</c:choose>
			</table>
		</div>
		<br/><br/><br/>
		
	<div class="row" id="contentQnaList" style="padding: 20px;">
		
		<span class="glyphicon glyphicon-comment seoulnori-mid-title" style="font-size: 20px;"></span>
		<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 Q&A</span>
		<br/><br/>
			
			<div id="contentQnaListDiv" style="border: 1px solid #ddd; border-bottom: 0;
									background-color: #F5F5F5; height: 340px; width: 500px;
									overflow-y: scroll; padding: 20px 0;">
			
			<c:choose>
				<c:when test="${ qnaList != null && qnaList.size() != 0 }">
					<!-- Q&A가 있을 때 -->
					<c:forEach items="${qnaList}" var="qna">
						
						<c:choose>
							<c:when test="${qna.member.memberType == 'member'}">
								<!-- 회원이 올린 질문글 -->
								<table class="qnaQuestion" id="qnaTalk${qna.eventQnaNum}">
									<tr>
										<td class="qnaRightFirstTd">
											<div class="well qnaRightDiv">
												<b>${qna.member.nickname}</b><br/>
												${qna.eventQnaContent}
												<c:if test="${ rightEventManager == 'Y' }">
													<a href="#" style="font-size: smaller; font-weight: bold;"
														id="replyQna" onclick="return addReplyForm('${qna.eventQnaNum}');">답글</a>
												</c:if>
												<br/>
												<span style="font-size: smaller;">${qna.eventQnaRegDate}</span>
												<c:if test="${sessionScope.member.userId == qna.member.userId }">
													<a href="#contentQnaList" style="font-size: smaller; font-weight: bold;" 
														id="deleteQna" onclick="deleteQna('${qna.eventQnaNum}');">삭제</a>
												</c:if>
											</div>
										</td>
										<td class="qnaRightSecondTd">
											<img src="${pageContext.request.contextPath}/images/event/rightTriangle.png"/>
										</td>
									</tr>
								</table>
								
							</c:when>
							<c:otherwise>
								<!-- 이벤트매니저 혹은 관리자가 답변한 글 -->
								<table class="qnaAnswer" id="qnaTalk${qna.eventQnaNum}">
									<tr>
										<td class="qnaLeftFirstTd">
											<img src="${pageContext.request.contextPath}/images/event/leftTriangle.png"/>
										</td>
										<td class="qnaLeftSecondTd">
											<div class="well qnaLeftDiv">
												<b>${qna.member.nickname} | 행사담당자</b><br/>
												${qna.eventQnaContent}
												<br/>
												<span style="font-size: smaller;">${qna.eventQnaRegDate}</span>
												<c:if test="${sessionScope.member.userId == qna.member.userId }">
													<a href="#contentQnaList" style="font-size: smaller; font-weight: bold;"
														id="deleteQna" onclick="deleteQna('${qna.eventQnaNum}');">삭제</a>
												</c:if>
											</div>
										</td>
									</tr>
								</table>
								
							</c:otherwise>
						</c:choose>
						
					</c:forEach>					
				</c:when>
				
				<c:otherwise>
					<!-- Q&A가 없을 때 -->
					<div style="margin-top: 130px; text-align: center; color: gray;">
						행사에 대해 궁금한 점은<br/>Q&A로 남겨주세요:)
					</div>
				</c:otherwise>
			</c:choose>
			</div>

			<input type="hidden" id="memberIdCheck" value="${member.userId}" />
			<input type="hidden" id="memberTypeCheck" value="${member.memberType}" />
			<input type="hidden" id="rightEventManager" value="${rightEventManager}" />
			
			<div id="sendQna" class="qnaRegArea">
				<form method="post" id="submitQnaForm" action="${pageContext.request.contextPath}/add_qna.do">
					<textarea id="sendQnaForm" name="eventQnaContent" 
										class="form-control qnaRegForm" style="height: 60px;"></textarea>
					<input type="hidden" name="sendQnaEventId" value="${eventDetail.eventId}"/>
					<input type="submit" id="sendQnaBtn" class="btn btn-default qnaRegBtn" value="보내기"/>
				</form>
			</div>
			
			<div id="sendReply" class="qnaRegArea" style="display: none;">
				<form method="post" action="${pageContext.request.contextPath}/qna_add_reply.do">
					<textarea id="sendReplyForm" name="eventReplyContent"
										class="form-control qnaRegForm" style="height: 60px;"></textarea>
					<input type="submit" id="sendReplyBtn"  value="답글달기"
								class="btn btn-default qnaRegBtn" style="background-color: #E8F4EE;"/>
					<input type="hidden" name="sendReplyEventId" value="${eventDetail.eventId}"/>
					<input type="hidden" name="eventQnaNumMod" id="eventQnaNumMod"/>
				</form>
			</div>
	
		</div>
		<br/><br/><br/>
		
		<span class="glyphicon glyphicon-pencil seoulnori-mid-title" style="font-size: 20px;"></span>
		<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 후기쓰기</span>
	    <form id="reviewForm" onsubmit="return formChk(this);" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/review_add.do" >	
				<div class="row" id="contentReviewForm" style="padding: 20px; ">
					<table>
						<tr>
							<td colspan="2">
								<font color="#00CC99">
								<label class="checkbox-inline">
									<input type="radio" name="starPoint" value='5'/>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
								</label>
								<label class="checkbox-inline">
									<input type="radio" name="starPoint" value='4'/>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
								</label>
								<label class="checkbox-inline">
									<input type="radio" name="starPoint" value='3'/>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
								</label>
								<label class="checkbox-inline">
									<input type="radio" name="starPoint" value='2'/>
										<span class="glyphicon glyphicon-star"></span>
										<span class="glyphicon glyphicon-star"></span>
								</label>
								<label class="checkbox-inline">
									<input type="radio" name="starPoint" value='1'/>
										<span class="glyphicon glyphicon-star"></span>
								</label>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="reviewCnt" name="reviewContent" class="form-control" style="width: 810px; margin: 10px 0"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="reviewImage"><font color="gray">이미지</font>&nbsp;</label>
								 <input id="reviewImg" type="file" name="reviewImage" style="display: inline-block;"/>
							</td>
							<td style="text-align: right;">
								<input type="hidden" name="eventId" value="${eventDetail.eventId}">
								<input type="submit"  value="후기등록" class="btn btn-default btn-sm" id="reviewAddBtn"/>
							</td>
						</tr>
					</table>
				</div>
		</form>
			<input type="hidden" id="addStampSuccess" value="${addStampSuccess}"/>

		
		<hr style="border-color: #ddd; margin-top: 0;" />
			
		<div class="row" id="contentReviewList" style="padding: 20px; ">
			
			<span class="glyphicon glyphicon-list seoulnori-mid-title" style="font-size: 20px;"></span>
			<span class="seoulnori-mid-title" style="font-size: 18px;">&nbsp;노리 후기</span>
			<br/><br/>
			
			<div id="noReview" style="text-align: center;">
				<hr	style="border-color: #ddd; margin-top: 0"/>
				노리 후기를 등록해주세요
				<hr style="border-color: #ddd;"/>
			</div>
			
		<!-- 후기 리스트 보여주는 공간 -->
		<div id="reviewDiv">			  
		</div>
			<table width="813px">
				<tr><td style="text-align: center;">
							<button id="moreReview" class="btn btn-default">더보기</button>
						</td></tr>
			</table>
			<br/>
			<br/>
		</div>
	</div>

	<div class="col-md-2"></div>

</div>
<!-- Modal : 사진 업로드 -->
	<div class="modal fade" id="addStampModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header" style="border-bottom: 1px solid #ddd; background-color: #3a9e8b; color: white;
	      																border-top-left-radius: 5px; border-top-right-radius: 5px;">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
	        				style="color: white; text-shadow: 0 1px 0 gray; opacity: 0.5;">×</button>
	        <h4 class="modal-title">내 캘린더 담기</h4>
	      </div>
	      
	      <div class="modal-body">
	      
		      <div>
					<table id="stampTable" width="700px" class="table" >
						<tr>
							<td style="border: 0; padding-top: 20px; text-align: center; font-weight: bold;">
								<div style="color: #3a9e8b;">
								<c:if test="${stamp1!=null}">
								<img src="http://70.12.109.69:9090/SeoulNori/images/test/${stamp1}.png" width="200px">&nbsp;&nbsp;
								</c:if>
								<c:if test="${stamp2!=null}">
								<img src="http://70.12.109.69:9090/SeoulNori/images/test/${stamp2}.png" width="200px">
								</c:if>
								<br/><br/>
									<span class="glyphicon glyphicon-ok-sign"></span>
									스탬프가 발급되었습니다.<br/>
									내 스탬프 페이지로 이동하시겠습니까?
								</div>
							</td>
						</tr>
					</table>
			</div>
			
	      </div>
	      <div class="modal-footer" style="margin: 0; border-top: 1px solid #ddd; text-align: center; padding: 18px;">
	        <input type="button" id="goToMyStamp" class="btn btn-primary" value="YES">
	        <input type="reset" class="btn btn-default" data-dismiss="modal" value="NO">
	      </div>
	      
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal : 사진 업로드 -->







	<!-- Modal : 사진 업로드 -->
	<div class="modal fade" id="addCalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header" style="border-bottom: 1px solid #ddd; background-color: #3a9e8b; color: white;
	      																border-top-left-radius: 5px; border-top-right-radius: 5px;">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" 
	        				style="color: white; text-shadow: 0 1px 0 gray; opacity: 0.5;">×</button>
	        <h4 class="modal-title">내 캘린더 담기</h4>
	      </div>
	      
	      <div class="modal-body">
	      
		      <div>
					<table id="imageTable" width="700px" class="table" >
						<tr>
							<td style="border: 0; padding-top: 20px; text-align: center; font-weight: bold;">
								<div style="color: #3a9e8b;">
									<span class="glyphicon glyphicon-ok-sign"></span>
									《${eventDetail.eventTitle}》을(를) 내 캘린더에 담았습니다.<br/>
									내 캘린더 페이지로 이동하시겠습니까?
								</div>
							</td>
						</tr>
					</table>
			</div>
			
	      </div>
	      <div class="modal-footer" style="margin: 0; border-top: 1px solid #ddd; text-align: center; padding: 18px;">
	        <input type="button" id="goToMyCalendar" class="btn btn-primary" value="YES">
	        <input type="reset" class="btn btn-default" data-dismiss="modal" value="NO">
	      </div>
	      
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal : 사진 업로드 -->

</body>
</html>