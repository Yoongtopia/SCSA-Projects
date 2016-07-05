<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#twitterButton").click(function(){
			$(".twitterResult").remove();
			
			var query = $("#twitterQuery").val()
			
						
						$.post("${pageContext.request.contextPath}/twitter_write.do",
								 {"query": query} ,
								function(JsonObj){
									$(JsonObj.tweetList).each(function(index,item){
										
										var cDate = new Date(Date.parse(item.createAt));
										var cDate_utc_timeStamp = Date.UTC(cDate.getUTCFullYear(),cDate.getUTCMonth(), cDate.getUTCDate() , 
												cDate.getUTCHours(), cDate.getUTCMinutes(), cDate.getUTCSeconds(), cDate.getUTCMilliseconds());
									
										var now = new Date();																	
										var now_utc_timestamp = Date.UTC(now.getUTCFullYear(),now.getUTCMonth(), now.getUTCDate() , 
										      now.getUTCHours(), now.getUTCMinutes(), now.getUTCSeconds(), now.getUTCMilliseconds());
									
									var time = "";
									if((now_utc_timestamp-cDate_utc_timeStamp)<0){
										time = "방금";
									}else  if((now_utc_timestamp- cDate_utc_timeStamp )/1000<60)	{
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
										var td1= $("<td/>").text(item.text);
										var td2= $("<td/>").text(time);
										var img =$("<img/>").attr("src", item.profileImage);
										var td3= $("<td/>").append(img);
										var td4= $("<td/>").text(item.screenName);
										tr.append(td1,td2,td3,td4);
										tr.appendTo("#twitterTable");
										/*
										var tr = $("<tr class='twitterResult'/>");
										var td= $("<td style='padding: 15px;'/>").appendTo(tr);
										
										var div= $("<div class='media'/>").appendTo(td);
										var a =$("<a class='pull-left'/>").attr("href", "http://twitter.com/"+item.screenName).appendTo(div);
										var img =$("<img  class='media-object'  alt='"+item.screenName+"' width='64px' height='64px' style='border: 1px solid #ddd;'/>").attr("src", item.profileImage).appendTo(a);
									
										var div2= $(" <div class='media-body' style='padding: 5px 0 5px 0;'/>").appendTo(div)
										var strong= $("<strong/>").text(item.name+" ").appendTo(div2);
										var a2 =$("<a />").attr("href", "http://twitter.com/"+item.screenName).appendTo(div2);
										var text = $("<span/>").text("@"+item.screenName).appendTo(a2);
									    var br = $("<br/>").appendTo(div2); 
										var text2=$("<span/>").text(item.text+" ").appendTo(div2);
										if(item.url!=null||item.url.trim()!=""){
										var a3 =$("<a/>").attr("href", item.url).appendTo(div2);
										var text3 = $("<span/>").text(item.url).appendTo(a3);
										}
										var text4 = $("<span/>").text(" "+item.afterText).appendTo(div2);
										
										var div3 = $("<div/>").appendTo(div2);
										var img2 =$("<img src='./images/test/icon_twitter.png'/>").appendTo(div3);
										var text5 = $("<span/>").text(" "+time).appendTo(div3);
										
										tr.appendTo("#twitterTable"); */
										});
						});
			});
	});
	
	
	
	
</script>
</head>
<body>

<h1>트위터 테스트 </h1>
<input type="text" id="twitterQuery">
<button id="twitterButton">검색어 입력</button>
<table id="twitterTable">
<tr><th>트윗 내용</th><th>작성 시간</th><th>이미지</th><th>작성자</th></tr>

</table>

</body>
</html>