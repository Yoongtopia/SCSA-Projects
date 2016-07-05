<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
	
 	$(function() {
		
 		/* 클릭하면 slideDown & up */
 		$(".reviewTr").click(function() {
 			if(!$(this).data("clickStatus")){
 				$(this).children().eq(2).children().eq(1).slideDown();
 				$(this).data("clickStatus", 1);
 				$(this).children().eq(2).removeAttr("style");
 			} else {
 				$(this).children().eq(2).children().eq(1).slideUp();
 				$(this).children().eq(2).attr("style","display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;");
 				$(this).data("clickStatus", 0);
 			}
		});
 		
	});
 
 
		function mouseEnter(count){
			$("#"+count).attr("style","cursor:pointer");			
		 }
		 
		 function updateReview(count){
			 $("#reviewTable").hide();
			 $("#num").val(count);
			 $("#reviewUpdateCnt").val($("#cnt"+count).text());
			
			
			if($("#starPoint"+count).val()==5.0 ){
				$("input:radio[value='5']").attr("checked","checked");
			}
			if($("#starPoint"+count).val()==4.0 ){
				$("input:radio[value='4']").attr("checked","checked");
			}
			if($("#starPoint"+count).val()==3.0 ){
				$("input:radio[value='3']").attr("checked","checked");
			}
			if($("#starPoint"+count).val()==2.0){
				$("input:radio[value='2']").attr("checked","checked");
			}
			if($("#starPoint"+count).val()==1.0 ){
				$("input:radio[value='1']").attr("checked","checked");
			}
		 
			$("#reviewUpdateFormTable").show();
			 
		 }
		 
		 /* 후기 form 체크 @OA*/
		function updateFormChk(){
						
		 	if($("input[type=radio]:checked").val()==null||$("input[type=radio]:checked").val().trim()==""){
				alert("별점을 선택해 주세요");
				return false;					
			}
		 
			if($("#reviewUpdateCnt").val()==null ||$("#reviewUpdateCnt").val().trim()==""){ 
				alert("후기 내용을 입력해 주세요");
				return false;
			}
			
					
			if(!$("#reviewUpdateImg").val().endsWith('jpg')||!$("#reviewUpdateImg").val().endsWith('jpeg')){
				alert("확장자가 jpg/jpeg인 파일만 등록 가능합니다.");
				return false;
			}
			
			$("form[name='reviewUpdateForm']").hide();			
			return true;
			
		 };
			 
		$(function(){
			
			$("#reviewUpdateResetBtn").click(function(){
				 $("#reviewTable").show();
				 $("#reviewUpdateFormTable").hide();
			});
			
		}) ;
			 
			 
	</script>
</head>
<body>

	<h2 style="margin-bottom: 20px; margin-left: 30px; color: #4f4f4f">
				REVIEW<font size="4em"><strong>&nbsp;내가 쓴 후기</strong></font>
	</h2>
	<br/>
	<div style="margin: 0 30px;">		
	
	<c:choose>
	<c:when test="${not empty reviewList }">		
		<center>
		<table id="reviewTable" class="table table-hover" style="table-layout:fixed; width: 800px; border-bottom: 1px solid #ddd;">
		  <tr>
		    <th style="text-align: center; width:50px;" >번호</th>
			<th style="text-align: center; width:180px;">행사명</th>
			<th style="text-align: center; width:290px;">후기내용</th>
			<th style="text-align: center; width:130px;">별점</th>
			<th style="text-align: center; width:90px;">작성일</th>
		  </tr>
		
		  <c:forEach items="${reviewList }" var="review" varStatus="status">
		  <tr id="${review.reviewNum}" class="reviewTr" style="cursor:hand" onmouseenter="mouseEnter('${review.reviewNum}')" />
		 <%--  <tr onmouseenter="mouseEnter('${review.reviewNum}')" onmouseleave="mouseLeave('${review.reviewNum}')" style="cursor:hand" > --%>
			<td style="text-align: center; vertical-align: top">${status.count }</td>
			<td style="vertical-align: top;"><a href="${pageContext.request.contextPath }/event_detail.do?eventId=${review.eventId}">${review.eventTitle }</a></td>
			<td style="display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><span id="cnt${review.reviewNum }">${review.reviewContent }</span>
			<div style="display:none;" id="menu${review.reviewNum }" >
				<c:if test="${review.reviewImage != null }">
					<img width="250px" style="padding: 10px;" src="${pageContext.request.contextPath }/images/test/${review.reviewImage }">
					<br/><br/>
				</c:if>
					<div style="text-align: right;" >
					<a><span onclick="updateReview('${review.reviewNum }');" id="update${review.reviewNum }" class='glyphicon glyphicon-edit'></span></a>&nbsp;&nbsp;&nbsp;
					<a id="delete${review.reviewNum }" 
						href="review_remove_from_my.do?reviewNum=${review.reviewNum }"><span class='glyphicon glyphicon-trash'></span></a>
				    </div>
				    <br/>
				</div>
			</td>
			<td style="vertical-align: top;">
			  <font color="#00CC99">
					<label class="checkbox-inline">
						<c:if test="${review.starPoint>=5 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
						</c:if>
						<c:if test="${review.starPoint>=4.5&&review.starPoint<5 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star-empty"></span>
						</c:if>
						<c:if test="${review.starPoint>=4&&review.starPoint<4.5 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>				     	
						</c:if>			     	
						<c:if test="${review.starPoint>=3.5&&review.starPoint<4 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star-empty"></span>				     	
						</c:if>			     	
						<c:if test="${review.starPoint>=3&&review.starPoint<3.5 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
						</c:if>			     	
						<c:if test="${review.starPoint>=2.5&&review.starPoint<3 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star-empty"></span>
						</c:if>			     	
						<c:if test="${review.starPoint>=2&&review.starPoint<2.5 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star"></span>
						</c:if>			     	
						<c:if test="${review.starPoint>=1.5&&review.starPoint<2 }">
							<span class="glyphicon glyphicon-star"></span>
					     	<span class="glyphicon glyphicon-star-empty"></span>
						</c:if>			     	
						<c:if test="${review.starPoint>=1&&review.starPoint<1.5 }">
							<span class="glyphicon glyphicon-star"></span>
						</c:if>			     	
						<c:if test="${review.starPoint>=0.5&&review.starPoint<1}">
							<span class="glyphicon glyphicon-star-empty"></span>
						</c:if>			
					    	</font>
						<c:if test="${event.eventAvgStar>=0&&event.eventAvgStar<0.5}">						
						</c:if>			     	
					</label></font>
			
			
			</td>
			<td style="vertical-align: top;">${review.reviewUpDate }</td>
		  </tr>
		  <input type="hidden" id="starPoint${review.reviewNum }" value="${review.starPoint }">
		  <input type="hidden" id="reveiwImage${review.reviewImage }" value="${review.reviewImage }">
		  </c:forEach>
		</table>
		</center>
	
	    <div style="display:none;" id="reviewUpdateFormTable" >
		  <form name="reviewUpdateForm" id="reviewUpdateForm" enctype="multipart/form-data" 
				action="/SeoulNori/review_update_move_from_my.do" method="post">
			<div class="row" style="padding: 20px;">
				<font color="gray"><span class="glyphicon glyphicon-edit"></span>
				<strong> 후기수정</strong></font>
				<input type="hidden" name="reviewNum" id="num" value="">
				<table style="margin-top: 10px;">
				  <tr>
					<td colspan="2">
					<font color="#00CC99">
					<label class="checkbox-inline">
					<input type="radio" name="starPoint" value="5">
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
					</label>
					<label class="checkbox-inline">
					<input type="radio" name="starPoint" value="4">
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
					</label>
					<label class="checkbox-inline">
					<input type="radio" name="starPoint" value="3">
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
					</label>
					<label class="checkbox-inline">
					<input type="radio" name="starPoint" value="2">
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
					</label>
					<label class="checkbox-inline">
					<input type="radio" name="starPoint" value="1">
						<span class="glyphicon glyphicon-star" display="inline-block"></span>
					</label>
					</font>
					</td>
				  </tr>
				<tr>
				  <td colspan="2">
					<textarea id="reviewUpdateCnt" name="reviewContent" class="form-control" style="width: 100%; margin: 10px 0"></textarea>
				  </td>
				</tr>
				<tr>
				  <td>
				    <label for="reviewImage"><font color="gray">이미지</font></label>
					<input id="reviewUpdateImg" type="file" name="reviewImage" style="display: inline-block;" value="">
				 </td>
				  <td style="text-align: right;">
<!-- 				  	<input type="hidden" name="eventId" value=""> -->
					<input type="submit" value="후기수정"  onclick="updateFormChk();" class="btn btn-default btn-sm">
					<input id="reviewUpdateResetBtn" type="reset" class="btn btn-default btn-sm" value="취소">
				  </td>
				</tr>
			</table>
		  </div>
		</form>
	<center>	
		</div>
		 </c:when>
			 <c:otherwise>
			 	<label style="color: #3a9e8b;"><span class="glyphicon glyphicon-bullhorn"></span> ${sessionScope.member.nickname }님이 작성하신 후기가 존재하지 않습니다.</label>
			 </c:otherwise>
		 </c:choose>
	</center>
</div>	
</body>
</html>
		
		