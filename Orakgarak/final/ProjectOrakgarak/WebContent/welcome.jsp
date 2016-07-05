
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>	
	
	<script type="text/javascript" src="./js/scroll/jquery.fullPage.js"></script>
<script type="text/javascript" src="packaged/javascript/semantic.js"></script>

<link rel="stylesheet" href="packaged/css/semantic.css" />
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ORAKGARAK</title>
<script type="text/javascript">


	$(document).ready(function() {
		
		$('#fullpage').fullpage({
			//anchors: ['firstPage', 'secondPage', '3rdPage'],
			menu: '#menu',
			loopTop: true,
			loopBottom: true
		});
		
		
		$("#moreBtn1").click(function(){
			$(this).hide();
			$("#morestory1").css('display','inline');
		});
		
		$("#moreBtn2").click(function(){
			$(this).hide();
			$("#morestory2").css('display','inline');
		});
		
		$("#moreBtn3").click(function(){
			$(this).hide();
			$("#morestory3").css('display','inline');
		});
		
		$("#moreBtn4").click(function(){
			$(this).hide();
			$("#morestory4").css('display','inline');
		});
		
		
		setInterval(movingeyeleft, 1000);
		
		function movingeyeleft(){
			$(".movingeye").css('left',"437px");
			
		}
		
		setInterval(movingeyecenter, 700);
		
		function movingeyecenter(){
			$(".movingeye").css('left',"444px");
			
		}
		

		$("#loginBtn").click(function() {
			$('.ui.modal.login').modal('show');
		});

		$(".signupBtn").click(function() {
			$('.ui.modal.signup').modal('show');
		});
		
		
	$("#loginbutton").click(loginSubmit);
	$(document).keydown(function(e){
		if(e.keyCode == 13){
			loginSubmit();
		}
	});
	
	
	function loginSubmit(){
		$.getJSON("${pageContext.request.contextPath }/user_login.do",
				{"email":$("#logemail").val(),
				 "password":$("#logpassword").val()}, function(jsonObj){					 
					if(jsonObj.status){
						if(jsonObj.favorite!=null){
						var stockCode=jsonObj.favorite.favList[0].stockCode;
						console.log("stockCode:"+stockCode);
						location.replace("${pageContext.request.contextPath}/stock_detail.do?stockCode="+stockCode);
						}else{
							location.replace("${pageContext.request.contextPath}/stock_detail.do?stockCode=005930");
						}
					}else{
						$(".login.field").addClass("error");
						$("#headermsg").remove();
						$(".header.login").empty();
						$('<span/>').html(" 아이디와 비밀번호를 확인해주세요").css('color',"#E75859").css('font-family',"font-family:'Nanum Gothic' !important").appendTo(".header.login");
					};
				});
		
	};
		
		$("#email").blur(function(){
			
				$.getJSON("${pageContext.request.contextPath}/check_id.do",
						{"email" : $("#email").val()},
						function(jsonObj){
							if(jsonObj.status){
								$("#idMsg").text(jsonObj.message);
								$("#registBtn").attr('disabled',false);
							}else{
								$("#email").focus();
								$("#idMsg").text(jsonObj.message);
								$("#registBtn").attr('disabled',true);
							}
					});
			
		});
		
		
		$("#name").blur(function(){
			
			$.post("${pageContext.request.contextPath}/check_name.do",
					{"name" : $("#name").val()},
					function(jsonObj){
						if(jsonObj.status){
							$("#nameMsg").text(jsonObj.namemessage);
							$("#submitBtn").attr('disabled',false);
						}else{
							$("#name").focus();
							$("#nameMsg").text(jsonObj.namemessage);
							$("#submitBtn").attr('disabled',true);
						}
				});
		
	});
		
		function singupSubmit(){
		$('.ui.form.signup')
		  .form({
			  			  
			  email:{
			    	identifier:'email',
			    	rules:[
						{
						type:'empty',
			    		prompt:'이메일을 입력해주세요'
						},
						{
							type:'email',
							prompt:'이메일 형식을 확인해주세요'
						}
						
			    ]
			    
			    },
			    
			    name:{
				    identifier:'name',
				    rules:[
				      {
				    	  type:'empty',
				    	  prompt:'이름을 입력해주세요'
				      }
				      ]
				    },
			  
			  password: {
		      identifier: 'password',
		      rules: [
		        {
		          type: 'empty',
		          prompt: '비밀번호를 입력해주세요'
		        },
		         {
		          type: 'match[password2]',
		          prompt: '비밀번호체크를 확인해주세요'
		        }
		      ]
		    },
		    		    
		  age:{
		    	identifier:'age',
		    	rules:[
					{
						type:'empty',
		    			prompt:'나이를 입력해주세요'
					}						
		    ]
		    
		    },
		    phone:{
		    	identifier:'phone',
		    	rules:[
					{
						type:'empty',
		    			prompt:'연락처를 입력해주세요'
					}						
		    ]
		    
		    }
		  
		  });
		}
	});
	
	
			
	
</script>

<style type="text/css">


body{
	margin:0;
	font-family: 'Nanum Gothic' !important;
}

#lsbox {
	margin-top: 250px;
}

.moreBtn{
	font-weight: bold;
	font-size:0.8em;
}

.center{
	margin:0 auto;
	width:602px;
}

.center img{
	align:center;
}

#section1{
	width : 1423px;
	height : 596px;
	
}

#section2{
	background-color: #D3D3D3;
}

/* #section2{
	background-color: #E97A6F;
}
 */
#section4{
	background-color: #D5DDD2;
}

#aboutus{
	background-color: #B7CBD3;
}

section{
	margin: 0 auto;
	padding:270px 0;
	height : 596px;
}



#investimg{
	width:602px;
}

#allimg{
	width:654px;
	position : relative;
}

#crying{
	width:951px;
}


#ourpicture{
	font-size: 0.7em;
	text-align: center;
	margin:0 auto;
}

#ourpicture img{
	width:200px;
	margin:20px;
	align:center;
}


.ui.menu.welcome{
	background-color: #e64a3c;
	height:100px !important;
}

.ui.menu .header.item{
	background-color: rgba(0, 0, 0, 0) !important;
}
.ui.menu.welcome a{
	color:white;
	background-color: #e64a3c;
}

.movingeye{
	position: absolute;
	left:442px;
	top: 250px;
	transition: left .2s;
}

.movingeye.left{
	position: absolute;
	left:439px;
	top: 250px;
	transition: left .2s;
}


.tilt {
  -webkit-transition: all 0.3s ease;
     -moz-transition: all 0.3s ease;
       -o-transition: all 0.3s ease;
      -ms-transition: all 0.3s ease;
          transition: all 0.3s ease;
            overflow: hidden;
}
 
.tilt:hover {
  -webkit-transform: rotate(20deg);
  -moz-transform: rotate(20deg);
  -ms-transform: rotate(20deg);
  -o-transform: rotate(20deg);
   transform: rotate(20deg);
  /* -webkit-box-shadow: 0 0 40px rgba(255,255,255,.6), inset 0 0 40px rgba(255,255,255,1);
  -moz-box-shadow: 0 0 40px rgba(255,255,255,.6), inset 0 0 40px rgba(255,255,255,1);
   box-shadow: 0 0 40px rgba(255,255,255,.6), inset 0 0 40px rgba(255,255,255,1); */
    cursor: pointer;
}

.img1{
	position : absolute;
}

.movingeye.center {
	position : absolute;
	left : 440px;
	top :250px;
}

section h2{
	text-align: center;
	font-family: 'Nanum Gothic' !important;
}

/* 멤버소개 */
.membername{
	font-size:1.5em;
	font-weight:700;
}

.memberrole{
	font-size:1.5em;
}

.memberstory{
	font-size:1.5em;

}

#ourpicture td{
	width:200px;
	padding: 5px 15px 5px 15px;
}

.moreBtn{
	cursor: pointer;
}

</style>
</head>
<body>
<!-- bottom step bar -->


<!-- 헤더입니다 -->
	
	<div class="ui fixed large menu welcome">
		<div id="headercontents">
 		<span class="item" style="margin-left:10%;">
    		<img src="${pageContext.request.contextPath}/img/so_1.png" width="200px">
  		</span>
  		<a id="loginBtn" class="item header" style="margin-left:40%;">
    		<i class="user icon"></i> Login
  		</a>
  		<a id="signupBtn" class="item header signupBtn">
    		<i class="ok sign icon"></i> SignUp
  		</a>
  		</div>
	</div>
<!-- section들 -->
<div id="fullpage">

<section id="section1" class="section">
		<div class="center" id="allimg">
			<img class="img1" src="${pageContext.request.contextPath}/img/welcome/all.png">
			<img class="movingeye" src="${pageContext.request.contextPath}/img/welcome/eye.png">
		</div>
	</section>
	
	<section id="section2" class="section">
		<div class="center" id="crying" style="width:754px;">
			<img src="${pageContext.request.contextPath}/img/welcome/sujung2_01.png">
			<h2>개미투자자들은 왜 항상 잃기만 할까요?</h2>
		</div>	
	</section>
	
	<section id="section3" class="section">
		<div class="center">
			<img src="${pageContext.request.contextPath}/img/welcome/3_02.png">
			<h2>제대로 된 정보를 가지고 투자하지 않기 때문입니다</h2>
		</div>	
	</section>
	
	<section id="section4" class="section">
		<div class="center" style="width:753px;">
			<img src="${pageContext.request.contextPath}/img/welcome/4_01.png" width="753px">
			<h2>하지만 분석은 오래걸리며, 복잡하고 비용이 많이 듭니다</h2>
		</div>
	</section>
	
	<section id="section5" class="section">
		<div class="center">
			<img src="${pageContext.request.contextPath}/img/welcome/5_01.png">
			<h2>오락가락은 3가지 주요 금융공학 모델과 빅데이터, 최근 추세를 활용하여<br> 각 주식을 분석하고 평가한 정보를 제공합니다. </h2>
		</div>
	</section>
	
	<section id="section6" class="section">
		<div class="center">
			<img src="${pageContext.request.contextPath}/img/welcome/6_02.png" style="width:90%">
			<h2>여기, 오락가락 레포트에서 확인할 수 있습니다</h2>
		</div>
	</section>
	
	<section id="section7" class="section" style="background: rgb(255, 255, 231);">
		<div class="center">
			<h2>Our VISION</h2>
			<br>
			<p style="font-size:1.3em; font-weight:bold;line-height:1.6em;">
			&nbsp;&nbsp;“오락가락은 정확한 주식 가치를 분석 할 수 있는 틀을 제공합니다. 이를 통해 스스로 데이터를 가공하기 어려운 개인투자자들도 가치 있는 정보를 쉽게 획득할 수 있도록 하고자 하는 목표를 가지고 있습니다. 정보는 많아졌지만, 가치 있는 정보를 찾기는 더욱 어려워졌습니다. 오락가락은 기존의 정보에서 더 나아가 가치 있고 직관적인 정보를 제공하고자 하는 마음에서 출발했습니다.”
			</p>
			
		</div>
	</section>
	
	<section id="section8" class="section" style="background-color: rgb(226, 226, 226);">
		<div class="center" style="width:829px;">
			<img src="${pageContext.request.contextPath}/img/welcome/9_01.png">
			<img src="${pageContext.request.contextPath}/img/welcome/9_02.png" width="600px;">
		</div>
	</section>
	
	<section id="section9" class="section">
		<div class="center" style="width:488px;">
			<img src="${pageContext.request.contextPath}/img/welcome/p10.png"><br>
			<a class="signupBtn" style="margin-left:380px;margin-bottom:400px; position:absolute;">지금 당장 <strong style="cursor: pointer;">회원가입</strong></a>
		</div>
	</section>
	


	<section id="aboutus" class="section">
		<div>
			<p> <h2>WE ARE BLUEBULLS</h2> <p>
			
			<table id="ourpicture" style="width:980px;padding:20px;">
				<tr>
					<td><img class="tilt" src="${pageContext.request.contextPath}/img/welcome/jung.png"></td>
					<td><img class="tilt" src="${pageContext.request.contextPath}/img/welcome/choi.png"></td>
					<td><img class="tilt" src="${pageContext.request.contextPath}/img/welcome/go.png"></td>
					<td><img class="tilt" src="${pageContext.request.contextPath}/img/welcome/cha.png"></td>
				</tr>
				
				
				<tr>
			
					<td>
					
					<span class="membername">정민철</span><br/>
					<span class="memberrole">FINANCIAL SPECIALIST</span>
					</td>
					<td>
					<span class="membername">최현진</span><br/>
					<span class="memberrole">WEB DEVELOPER</span></td>
					<td>
					<span class="membername">고락가락</span><br/>
					<span class="memberrole">SEXY KILLER</span></td>
					<td>
					<span class="membername">차승환</span><br/>
					<span class="memberrole">WEB DEVELOPER</span></td>
				</tr>
				
				<tr>
			
					<td style="text-align: left; vertical-align: top;">
					<span class="memberstory">&nbsp;&nbsp;정민철은 유학파임에도 불구하고 그의 첫인상은 청학동 출신입니다...<span id="moreBtn1" class="moreBtn">[더보기]</span> <span id="morestory1" style="display:none;">자유의 상징 미국에서 8년이나 살았지만 그 누구보다 가부장적입니다. 그는 한식매니아이며 가장 좋아하는 음식은 김치찌게 입니다. 그리고 노량진에서 횟값을 깎는 재주를 가지고 있습니다. 어디에서도 유학파의 흔적을 찾을 수 없어 학벌위조 논란이 있었지만 피자집에서 한국인은 아무도 시키지 않는 하와이안딜라이트를 시키는 것을 통해 유학파임을 짐작해볼 수 있습니다. 아무튼 그는 금융을 사랑해서 이 프로젝트가 시작되었습니다.</span></span>
					</td>
					<td style="text-align: left; vertical-align: top;">
					<span class="memberstory">&nbsp;&nbsp;최현진은 서강대에서 경영학을 전공했으며 적응력이 뛰어난 장점을 가지고 있습니다..<span id="moreBtn2" class="moreBtn">[더보기]</span> <span id="morestory2" style="display:none;">남자 셋뿐인 팀에 들어와 엄청난 적응력으로 그들을 모두 자신의 기쁨조로 만들어버리더니 스페인여행을 계획중인 지금은 시에스타에 적응하기 위해 점심을 먹고나면 낮잠을 즐기고 있습니다. 그리고 그녀는 막걸리 애주가로 술에 취하면 주변사람을 때리는 버릇이 있습니다. 그래서 회식자리에서 그녀의 옆자리는 늘 비어있다는 후문입니다. 아무튼 그녀는 오락가락에서 코딩과 디자인을 맡아서 방향잃은 코드에 영혼을 불어넣었습니다.</span></span>
					</td>
					<td style="text-align: left; vertical-align: top;">
					<span class="memberstory">&nbsp;&nbsp;고락윤은 서울대학교 경영학과에 출신으로 기계덕후의 기질을 버리지 못하고 IT업계로 흘러들어왔습니다...<span id="moreBtn3" class="moreBtn">[더보기]</span> <span id="morestory3" style="display:none;">남다른 그의 아방가르드한 패션감각과 깔매치 능력을 범인(凡人)은 미처 따라가지 못해 시대를 잘못타고 났다는 평이 있습니다. 또한, 투철한 실험정신으로 맥콜과 요거트를 섞어 먹는 신메뉴를 개발해 주변인들에게 전파하고 있는 선구자이기도 합니다. 프로그래밍 능력도 타의 추종을 불허하는 그는 현재 블루불스에서 섹시한 알고리즘 개발을 맡고 있습니다.</span></span>
					</td>
					<td style="text-align: left; vertical-align: top;">
					<span class="memberstory">&nbsp;&nbsp;차승환은 공대로 유명한 인하대에서 정치외교학을 전공했습니다...<span id="moreBtn4" class="moreBtn">[더보기]</span> <span id="morestory4" style="display:none;">그는 한 번 본 것을 까먹지 않고 기억하는 능력을 가지고 있습니다. 그는 정민철의 계좌번호까지 빠짐없이 외우는데 쓰잘데기 없다는 평도 많이 받습니다. 차승환 천재설이 제기되고 있지만 신은 그에게 올라프의 얼굴을 주었습니다. 그의 코드는 창의적으며 예측불허입니다. 아무도 상상하지 못한 방법으로 문제를 해결해내는 그는 현재 블루불스에서 야매 디버깅 전문가로 활동중입니다.</span></span>
					</td>
				</tr>
				
			</table>
			
			
		</div>
	</section>
</div>
	
<!-- 로그인모달입니다. -->
	<div class="ui modal small login">
		<i class="close icon"></i>
		<div class="header login">
			<div id="headermsg">LogIn</div>
		</div>

		<div class="content">
			<div class="ui form segment">
				<%-- <form action="${pageContext.request.contextPath }/user_login.do" --%>
					<!-- method="post"> -->
					<div class="login field">
						<label>Username</label>
						<div class="ui left labeled icon input">
							<input type="text" placeholder="Enter your Email" name="email" id="logemail">
							<i class="user icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
					<div class="login field">
						<label>Password</label>
						<div class="ui left labeled icon input">
							<input type="password" placeholder="Enter your password"
								name="password" id="logpassword"> <i class="lock icon"></i>
							<div class="ui corner label">
								<i class="icon asterisk"></i>
							</div>
						</div>
					</div>
					<div class="ui error message">
						<div class="header">아이디/비밀번호를 다시 확인해주세요</div>
					</div>
					<div>
						<button class="ui red submit button" id="loginbutton">LogIn</button>
						<!-- <input type="submit" value="LogIn" class="ui red submit button"> -->
					</div>
				<!-- </form> -->
			</div>
		</div>
	</div>

<!-- 사인업모달입니다. -->
	<div class="ui modal small signup">
		<i class="close icon"></i>
		<div class="header">SignUp</div>

		<div class="content">
			<div class="ui form segment signup" id="updatebox">
				<form method="post" action="${pageContext.request.contextPath}/user_regist.do">
					<div class="field">
						<label>Email &nbsp;&nbsp;<span id="idMsg"></span></label>
						<input type="text" id="email" name="email">
					</div>
					<div class="field">
						<label>Name &nbsp;&nbsp;<span id="nameMsg"></span></label>
						<input type="text" id="name" name="name">
					</div>
					<div class="field">
						<label>Password</label>
						<input type="password" id="password" name="password">
					</div>
					<div class="field">
						<label>Password Check</label>
						<input type="password" id="password2">
					</div>

					<div class="field">
						<label>Age</label>
						<input type="text" id="age" name="age" placeholder="ex)30">
					</div>
					<div class="field">
						<label>Phone</label>
						<input type="text" id="phone" name="phone" placeholder="ex)010-1234-5678">
					</div>

					<div>
						<input type="submit" value="등록" id="submitBtn"
							class="ui red submit button" />
					</div>
				</form>
				<div class="ui error message"></div>
			</div>
		</div>
	</div>

		

</body>
</html>