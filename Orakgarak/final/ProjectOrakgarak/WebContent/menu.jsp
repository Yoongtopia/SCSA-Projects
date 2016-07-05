<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="./packaged/javascript/jquery-2.1.1.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>
<link rel="stylesheet" href="packaged/css/semantic.css">


<style type="text/css">

#companyList a{
	text-decoration: none;
}

#companyList th{
	text-align: center;
}

#companyList td{
	text-align: center;
}



#name{
	color: #e74c3c;
	font-weight: 700;
}

#top{
position:relative;
width:930px;
	height:70px;
	margin-top:10px;
}

#navigation{
	position: relative;
	top: 0;
	left: 0;
	right: 0;
	height: 50px;
	background: #f3f3f3;
	z-index: 100;
}

#nav_left{
float:left;
padding-left:10px;
}

#nav_right{
float:right;
padding-right:10px;
}

#navigation a{
	display: inline-block;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	padding: 0.2em 0.4em;
	margin: 0 0.4em 0;
	font-size: 0.8em;
	cursor: pointer;
	color: #e74c3c;
	outline: none;
	text-decoration: none;
}

#navigation img{
	margin:15px;
}
#navigation div{
	margin:0;
	background-color: #e74c3c;
	color: white;
}

#navigation li{
	list-style: none;
	display:inline;
}

/* 검색창 적용 css*/

#searchStock{
	width: 180px;
	height: 38px;
	padding: 4px!important;
	font: normal 12px "Ruda", Arial, sans-serif;
	color: #b3b3b3;
	border: solid 3px #e74c3c;
	-webkit-border-radius: 0!important;
	-moz-border-radius: 0!important;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	border-radius: 0!important;
}

#search_form{
position: absolute;
right: 0px;
top: 26px;
}

 #searchBtn{
	
	position: relative;
	border: none;
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
}


/* hover 효과*/

.hovereffect:hover{
	color: #FFFFFF;
	background-color: #e74c3c;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	
	$("#searchBtn").click(searchButtonClicked);	//searchBtn
	
	 $(document).keypress(function (e) {
        if (e.keyCode == 13) {
        	searchButtonClicked();
        }
		
        
    });	
	
	function searchButtonClicked() {
		//alert(document.getElementById("searchStock").value);
		
		$.post("${pageContext.request.contextPath}/search.do",
		{"searchStock" : document.getElementById("searchStock").value},
		function(jsonObj) {
			if (jsonObj.status) {
				$("#companyList tbody").empty();
				$(jsonObj.companyList).each(function(index, item) {
					
					
					var code = item.stockCode;
					var name = item.stockName;
									
					var td1=$('<td/>').html(code);
					var td2=$('<td/>').html(name);
					var a=$('<a/>').attr("href","${pageContext.request.contextPath}/stock_detail.do?stockCode="+code).append(td2);
					var tr=$('<tr/>').append(td1,a);
					tr.appendTo('#companyList tbody');
												
				});
				
				$('.small.modal.search').modal('show');
				
			}
			
		});
		
	
					
	}

 	
	
}); //ready

 
</script>

 <div id="top">
 <div id="logo">
    <a href="${pageContext.request.contextPath }/stock_detail.do?stockCode=${sessionScope.favorite.favList[0].stockCode}"><img src="./img/so_1.png" width="170px"/></a>
      </div>
       	<div id="search_form">
     <input type="text" id="searchStock" name="searchStock" placeholder="종목을 입력하세요.."/>
   		 <input type="submit" value="검색" id="searchBtn"/>   	
       	</div>
   
  </div>
  
  <div id="navigation">
   <ul id="nav_left">
 	  
 	  <li>
      <a href="${pageContext.request.contextPath }/board_list.do">토론게시판</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/detail_search.do">상세검색</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/rank_and_search.do">랭킹</a>
      </li>
      
      
      <li>
      <a href="${pageContext.request.contextPath }/favorite.do">즐겨찾기</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/simulation.do">시뮬레이션센터</a>
      </li>
      
      <li>
      <a href="${pageContext.request.contextPath }/prefer_test.do">투자성향테스트</a>
      </li>
      
      <c:if test="${sessionScope.user.email == 'admin@orakgarak.com' }">
      <li>
      <a href="${pageContext.request.contextPath }/admin_management.do">ADMIN</a>
      </li>
      </c:if>
      
    </ul>
    
    <ul id="nav_right">
    <li>
 	  <span><i class="user icon" style="margin-right:0;"></i><a href="${pageContext.request.contextPath }/mypage.do" id="name" style="color:black; margin-left:0; margin-right:0;">${sessionScope.user.name }</a></span>
 	  </li>
      <li>
      <a href="${pageContext.request.contextPath }/user_logout.do">LOGOUT</a>
      </li>
    </ul>
  </div>




<div class="ui small modal search">
  <i class="close icon"></i>
  <div class="header">
    검색결과
  </div>
  <div class="content" style="margin:0px auto">
    <div class="left">
      	<table class="ui basic table" id="companyList">
  			<thead>
    			<tr>
    				<th>종목코드</th>
    				<th>회사명</th>
 				</tr>
  			</thead>
  			<tbody>
  			</tbody>
</table>
    </div>
  </div>
</div>
  
<!--   <div id="searchWrapper">
	<div id="searchbox">
    <input type="text" id="searchStock" name="searchStock" placeholder="검색할 종목을 입력하세요.."/>
    <input type="submit" value="검색" id="searchBtn"/>
    </div>
</div> -->
  
<!-- </form> -->