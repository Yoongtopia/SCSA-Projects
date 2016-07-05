<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.min.css">
<style type="text/css">


a{
	text-decoration: none;
	color:black;
}

a:hover{
	color: #e74c3c;
}

#icon{

	color: rgba(0, 0, 0, .4);
}

#icon:hover{
	color: #e74c3c;
}

#btn{
	margin-left:10px;
	font-weight: 700;
	color: #e74c3c;
}

#btn:hover{
	color: #FFFFFF;
	background-color: #e74c3c;
}

.profileicon{
	width: 50px;
	height: 50px;
}

.boardtable{
	width:870px;
	margin:0 auto;
	border-bottom: 1px solid rgb(206, 195, 195);
}

.boardtable td{
	padding: 10px;
}

.boardtable .title{
	font-weight: bold;
	font-size: 1.5em;
}

.boardtable .writer{
	font-size:0.8em;
}

.boardtable .date{
	color:gray;
	font-size:0.7em;
}
.titlep{
	margin-bottom: 2px;
}

.writerp{
	margin-top:2px;
	text-align: right;
}

.contentb td{
	padding-top:25px;
	padding-bottom:80px;
}

.next{
	text-align: right;
	font-size: 0.9em;
	border: 0;
}

#icons{
	text-align: right;
}
#submit{
	float: right;
}
#replybox{
	width:870px;
	margin:0 auto;
}

#replyContent{
	height:15px;
}

.pagination a{
	padding:7px !important;
	font-size: 0.7rem !important;
	font-weight: bold;
	
}

</style>
<script type="text/javascript">
/* 	$(document).ready(function(){
		
		$("#replySubmit").click("form");
		 $(document).keypress(function(event) {
 			 
		        if (event.keyCode == 13) {
		        	
		        	$("form").submit();
		        }
		 });
		
	}); */

</script>

<!-- 게시물 상세보기입니다 -->
<div>
	<table class="boardtable">
		<tr>
			<td style="text-align:right;">
			<c:if test="${not empty sessionScope.user.email && sessionScope.user.email == 'admin@orakgarak.com' || not empty sessionScope.user.email && sessionScope.user.name == board.boardWriter }">
			<a class="small ui button" id="btn" href="${pageContext.request.contextPath }/board_updateMove.do?boardNo=${board.boardNo}">수정</a>
			<a class="small ui button" id="btn" href="${pageContext.request.contextPath }/board_delete.do?boardNo=${board.boardNo}">삭제</a>
			</c:if>
			<a class="small ui button" id="btn" href="${pageContext.request.contextPath }/board_list.do">목록</a>
			</td>
			
		</tr>
		<!-- <tr>
			<td id="icons"><i class="eraser icon"></i><i class="trash icon"></i><i class="list layout icon"></i></td>
		</tr> -->
		<tr id="titlebar">
			<td>
				<p class="titlep"><span class="title">${board.boardTitle }</span></p>
				<p class="writerp"><span class="writer">작성자:&nbsp;${board.boardWriter }</span>&nbsp;<span class="date">${board.boardDate } 등록</span></p>
			</td>
		</tr>
	</table>
	<table class="boardtable contentb">
		<tr>
			<td>${board.boardContent }</td>
		</tr>
	</table>
	<table class="boardtable next">
		<tr>
			<td>
			
			<a name="pre" href="${pageContext.request.contextPath }/board_detail.do?boardNo=${prev.boardNo }"><i class="left arrow icon"></i>이전글</a>&nbsp;
			<a name="next" href="${pageContext.request.contextPath }/board_detail.do?boardNo=${next.boardNo }">다음글<i class="right arrow icon"></i></a>
			</td>
		</tr>
	</table>
</div>


<!-- 리플 -->
<div id="replybox">

<form class="ui reply form" method="post" action="${pageContext.request.contextPath }/reply_write.do?boardNo=${board.boardNo}">
    <div class="field">
      <textarea name="replyContent" id="replyContent"></textarea>
    </div>
    <input type="submit" value="Add Comment" id="replySubmit" class="ui red submit button">
</form>
<br/>
<div class="ui comments" style="margin-top: 40px;">
 <c:forEach items="${reply }" var="list">
  <div class="comment">
    <a class="avatar" id="img">
    <c:choose>
    	<c:when test="${list.replyWriter == '관리자'}">
		<img alt="" src="./image/bluebulls.png">
		</c:when>
    	<c:when test="${list.replyWriter == '올라프'}">
		<img alt="" src="./image/olaf.png">
		</c:when>
		<c:when test="${list.replyWriter == '최현진'}">
		<img alt="" src="./image/thomas.png">
		</c:when>
		<c:when test="${list.replyWriter == '고락윤'}">
		<img alt="" src="./image/koala.png">
		</c:when>
		<c:when test="${list.replyWriter == 'Donkey'}">
		<img alt="" src="./image/donkey.png">
		</c:when>
		<c:when test="${list.replyWriter != '관리자' }">
      	<img src="./image/ant.gif">
		</c:when>
		
	</c:choose>
    
    </a>
     <div class="content" id="boss"  align="left">
     	 <a href="${pageContext.request.contextPath }/reply_delete.do?replyNo=${list.replyNo}&boardNo=${board.boardNo}" style="float: right; " id="icon">
        	<i class="medium remove icon"></i>
        </a> 
      <a class="author">${list.replyWriter }</a>
      <div class="metadata">
        <div class="date">${list.replyDate }</div>
       
      </div>
      <div class="text">
        <span>${list.replyContent}</span><br/>
       
        
      </div>
      <!-- <div class="actions" style="float: right;">
      	
      </div> -->
    </div>
  </div>
 </c:forEach>

</div>
 
</div>
<!-- </div> -->


<!-- 페이징 처리 -->
<div style="text-align: center; margin-bottom: 10px;">
<div class="ui pagination menu" align="center">
<c:if test="${pu.startPageNum<pu.pageNum }">
<a class="icon item" href="${pageContext.request.contextPath }/board_detail.do?pageNum=${pu.pageNum-1}&boardNo=${board.boardNo}">
	<i class="left arrow icon"></i>&nbsp; Previous
</a>
</c:if>
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a class="item" href="${pageContext.request.contextPath }/board_detail.do?pageNum=${i}&boardNo=${board.boardNo}">
			<span style="font-size: 20px; font-weight: 700; color: #e74c3c;">${i}</span>
			</a>
		</c:when> 
	<c:otherwise>
		<a class="item" href="${pageContext.request.contextPath }/board_detail.do?pageNum=${i}&boardNo=${board.boardNo}">${i }</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pu.endPageNum>pu.pageNum }">
<a class="icon item" href="${pageContext.request.contextPath }/board_detail.do?pageNum=${pu.pageNum+1}&boardNo=${board.boardNo}">
  Next &nbsp;<i class="right arrow icon"></i>
</a>
</c:if>
</div>
</div>

 <script type="text/javascript">
	$(document).ready(function(){
		var min = '${minimum}';
		var max = '${maximum}';
		var no = '${board.boardNo}';
		
		if (min == no) {
			$("a[name=pre]").hide();
		}
		if(max == no){
			$("a[name=next]").hide();
		}
		
		/* $("#submit").click(function(){
			$.post("${pageContext.request.contextPath }/reply_write.do?boardNo=${board.boardNo}",
					{"replyContent" : $("#replyContent").val()}, success, "json"); 
					
				//alert("F5를 눌러주세요");
		}); //submit */
		
/* 		$("delete").click(function(){
			$.post("${pageContext.request.contextPath}/reply_delete.do?replyNo=${list.replyNo}", "json");
		}); //delete */
		
		/* $(".delete").on("click", function() {
			alert($(this).attr("id"));
			$.getJSON("${pageContext.request.contextPath}/reply_delete.do",
					{ "replyNo" : $(this).attr("id"), "boardNo" : item.boardNo },
					function(jsonObj) {
						$("#"+jsonObj.replyNo).remove();
					});
		}); */

	}); //ready

	/* function success(jsonObj){
		$(".content").empty();
		$(jsonObj.list).each(function(index,item){

			var img = $("<img/>").attr('class',"profileicon").attr('src', "${pageContext.request.contextPath}/image/ant.gif");
			var avatar = $("<a/>").attr("class","avatar").append(img);
			var author = $("<a/>").attr("class","author").text(item.replyWriter);
			var date = $("<span/>").attr("class","date").text(item.replyDate);
			var div1 = $("<div/>").attr("class","metadata").append(date);
			var text = $("<span/>").text(item.replyContent);
			var div2 = $("<div/>").attr("class","text").append(text);
			var del = $("<a/>").attr('href','${pageContext.request.contextPath}/reply_delete.do?replyNo='+item.replyNo+"&boardNo="+item.boardNo).text("Delete");
			var div3 = $("<div/>").attr("class","action").append(del);
			var div4 = $("<div/>").attr("class","content").append(author,div1,div2,div3);
			
			$("<div/>").attr("class","comment").attr('id', item.replyNo).append(avatar,div4).appendTo("#boss");
		});
	} */
	
	/* function deleteReply(replyNo, boardNo) {
		location.href="${pageContext.request.contextPath}/reply_delete.do?replyNo="+replyNo+"&boardNo="+boardNo;
	} */
</script>