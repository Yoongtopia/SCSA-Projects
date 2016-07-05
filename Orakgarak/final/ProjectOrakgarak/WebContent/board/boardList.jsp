		<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">
<script type="text/javascript">
	$(document).ready(function(){		
		
		$("#registBtn").click(function(){
			$('.ui.large.modal.regist').modal('show');
		});
		
		$('.ui.form.regist')
		  .form({
		    Title: {
		      identifier: 'boardTitle',
		      rules: [
		        {
		          type: 'empty',
		          prompt: '제목을 입력해 주세요'
		        }
		      ]
		    },
		  	Content: {
		  		identifier: 'boardContent',
		  		rules: [
		  		{
		  		   type: 'empty',
		  		   prompt: '내용을 입력해 주세요'
		  		}        
		  	  ]
		  
		  	}
		  }); // ui form
	
		
		/*  $("#gong2").each(function(index, value){
				  if($("#gong").text("공지")){
					  $("#gong2").attr("class", "ui ignored red message");
					  $("#gong").attr("class", "ui ignored info message");
					  
				  }else{
					  $("#gong2").attr("class", "");
				  }
				  
				  
			  }); */ 
	
		
		  
		  
		
	}); //reday
</script>
<style type="text/css">

#blist{
	width:860px;
	margin:30px auto;
}

#blist a{
	text-decoration: none;
	color:black;
}

a{
	text-decoration: none;
}

a:hover, #title:hover{
	color: #e74c3c;
}
td{
	text-align: center;
}
#registBtn{
	margin-top:5px;
	border-radius:3px;
	position: relative;
	border: none;
	padding:7px;
	background-color: #e74c3c;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 100%;
	height:36px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 50px;
	cursor: pointer;
}
#registBtnWrapper{
	text-align:right;
	margin-right:30px;
}

#search{
	width: 180px;
	height: 22px;
	padding: 4px!important;
	font: normal 12px "Ruda", Arial, sans-serif;
	color: #b3b3b3;
	border: solid 3px #9cc787;
	-webkit-border-radius: 0!important;
	-moz-border-radius: 0!important;
	border-radius: 0!important;
	margin: 0 auto;
	
}

#searchBoardBtn{
	
	position: relative;
	border: none;
	background-color: #9cc787;
	color: #f9f6e5;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	overflow: hidden;
	z-index: 1000;
	width: 100%;
	height:36px;
	-webkit-transition: opacity 0.1s 0.5s;
	transition: opacity 0.1s 0.5s;
	width: 50px;
	margin-bottom: 15px;
	
}

.pagination a{
	padding:7px !important;
	font-size: 0.7rem !important;
	font-weight: bold;
	
}

#boardWrapper{
	width:930px;
	margin: 0 auto;
}

.ui.header{
	width: 900px;
	margin: 0 auto;
}
.ui.header:first-child {
	margin-top: 30px;
}

</style>

<%-- <form method="post" action="${pageContext.request.contextPath }/board_search.do">
<div>
	<label for="searchBoard">검색</label>
	<input type="text" id="search" name="search"/>
	<!-- <input type="submit" value="검색" id="searchBtn"/> -->
	<button><img src="./img/search2.png" width="20px" height="20px"></button>
</div>
</form> --%>


<div id="boardWrapper">
	<h2 class="ui header"style="padding: 10px; width:900px; margin: 0 auto;">
		<i class="chat icon" style="color:orange"></i> 토론게시판
	</h2>
	<hr style="width: 900px">
	<!-- <div class="ui header">
		<span style="padding: 10px;background-color:#575E61; color:white">
			<i class="chat icon"></i> 토론게시판
		</span>
	</div> -->





<!-- 게시글 목록 -->
<div>
<table class="ui basic table" id="blist" style="top:50px;">
  <thead>
    <tr>
	    <th style="text-align: center; width: 56px; font-weight:bold;">No</th>
	    <th style="text-align: center; width: 125px; font-weight:bold;">Category</th>
	    <th style="text-align: center; width: 503px; font-weight:bold;">Title</th>
	    <th style="text-align: center; width: 94px; font-weight:bold;">Writer</th>
	    <th style="text-align: center; width: 162px; font-weight:bold;">Date</th>
	    <th style="text-align: center; width: 70px; font-weight:bold;">Hits</th>
  </tr>
  </thead>
 <%--  <tbody>
  	<c:choose>
	<c:when test="${not empty board }">
	<c:forEach items="${board}" var="list">
	<tr>
      <td>${list.boardNo }</td>
      <c:if test="${list.boardCategory == '1' }">
      <td style="background-color: #e74c3c; color: #FFF;">공지</td>
      </c:if>
      <c:if test="${list.boardCategory == '2' }">
      <td>잡담</td>
      </c:if>
      <td style="text-align: left; padding-left: 20px"><a id="title" href="${pageContext.request.contextPath }/board_detail.do?boardNo=${list.boardNo}">${list.boardTitle }</a></td>
      <td>${list.boardWriter}</td>
      <td>${list.boardDate }</td>
      <td>${list.boardHits }</td>
    </tr>
    </c:forEach>
	</c:when>
	</c:choose>
  </tbody> --%>
  
   <tbody>
  	<c:choose>
	<c:when test="${not empty board }">
	<c:forEach items="${board}" var="list">
      <c:choose>
      <c:when test="${list.boardCategory == 1 }">
	<tr>
      <td style="background-color: #FFF; font-size:0.9em; font-weight:bold;">${list.boardNo }</td>
      <td style="background-color: #FFF;"><span style="background-color:#e74c3c; padding:3px; color:white; font-size:0.8em; font-weight:bold;">공지</span></td>
      <td style="text-align: left; padding-left: 20px; background-color: #FFF;">
      	<a style="font-weight: bold;" id="title" href="${pageContext.request.contextPath }/board_detail.do?boardNo=${list.boardNo}">${list.boardTitle }</a>
      </td>
      <td style="background-color: #FFF;">${list.boardWriter}</td>
      <td style="background-color: #FFF;">${list.boardDate }</td>
      <td style="background-color: #FFF;">${list.boardHits }</td>
    </tr>
      </c:when>
      <c:otherwise>
    <tr>
      <td style="font-size:0.9em; font-weight:bold;">${list.boardNo }</td>
       
      <td><span style="padding:3px; color:black; font-size:0.8em; font-weight:bold;">잡담</span></td>
      
      <td style="text-align: left; padding-left: 20px"><a id="title" href="${pageContext.request.contextPath }/board_detail.do?boardNo=${list.boardNo}">${list.boardTitle }</a></td>
      <td>${list.boardWriter}</td>
      <td>${list.boardDate }</td>
      <td>${list.boardHits }</td>
    </tr>
      </c:otherwise>
      </c:choose>
    </c:forEach>
	</c:when>
	<c:otherwise>
	</c:otherwise>
	</c:choose>
  </tbody>
</table>


</div>
<!-- 등록 모달입니다. -->
	<div class="ui large modal regist">
		<i class="close icon"></i>
		<div class="header">새글 등록</div>

		<div class="content">
			<div class="ui form segment regist" id="updatebox">
				<form method="post" action="${pageContext.request.contextPath}/board_write.do?userId=${sessionScope.user.email}">
					<div class="field">
						<label>Category&nbsp;&nbsp;<span id="category"></span></label>
						<select name="boardCategory">
						<c:if test="${sessionScope.user.email == 'admin@orakgarak.com'}">
							<option value="1">공지사항</option>
							</c:if>
							<option value="2">잡담</option>
						</select>
					</div>
					<div class="field">
						<label>Title</label>
						<input type="text" id="boardTitle" name="boardTitle" size="60" style="margin-bottom: 10px;">
					</div>
					<div class="field">
						<label>Content</label>
						<textarea cols="60" rows="10" name="boardContent"></textarea>
					</div>

					<div style="width: 170px; margin: 0 auto;">
						<input type="submit" value="등록" id="submitBtn"	class="ui red submit button" />
						<input type="reset" value="취소" id="resetBtn" class="ui red submit button"/>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="registBtnWrapper">
<a id="registBtn"><i class="pencil icon"></i>글쓰기</a>
</div>


<!-- 페이징 처리 -->
<div style="text-align: center; margin-bottom: 15px;">
<div class="ui pagination menu">
<c:if test="${pu.startPageNum<pu.pageNum }">
<a class="icon item" href="${pageContext.request.contextPath }/board_list.do?pageNum=${pu.pageNum-1}">
	<i class="left arrow icon"></i>&nbsp; Previous
</a>
</c:if>
<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
	<c:choose>
		<c:when test="${i==pu.pageNum }">
			<a class="item" href="${pageContext.request.contextPath }/board_list.do?pageNum=${i }">
			<span style="font-size: 20px; font-weight: 700; color: #e74c3c;">${i}</span>
			</a>
		</c:when> 
	<c:otherwise>
		<a class="item" href="${pageContext.request.contextPath }/board_list.do?pageNum=${i }">${i }</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pu.endPageNum>pu.pageNum }">
<a class="icon item" href="${pageContext.request.contextPath }/board_list.do?pageNum=${pu.pageNum+1}">
  Next &nbsp;<i class="right arrow icon"></i>
</a>
</c:if>
</div>

</div>


<!-- 게시글 검색 -->
<form method="post" action="${pageContext.request.contextPath }/board_search.do">
<div id="bsearchWrapper">
	<div id="bsearchbox" style="width: 250px; margin: 0 auto;">
    <input type="text" id="search" name="search" placeholder="글제목 or 작성자 입력.."/>
    <input type="submit" value="검색" id="searchBoardBtn"/>
    </div>
</div>
</form>

</div>
