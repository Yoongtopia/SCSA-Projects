//기본 유저 속도
	var speed = 15;
	
	//총점수
	var totalScore = 0;
	
	//키가 눌리는 걸 받기 위한 배열
	var keys = {};
	
	var score = 0;
	var lifeCount = -1;
	var life = 0;
	
	var enemyCount = 0;
	
	var url3 = "";
	
	var imgsrc = "";
	
	var methodSpeed=0;
	
	var combo=0;
	
	var collisionFlagLife = "";
	var collisionFlagCombo = "";
	var elseCollisionFlagCombo = "";
	var endingFlagCombo = "";
	var comboInterval = "";
	var isIntervalInProgress = false;
	
function commonFunction() {
	combo=0;
	totalScore = 0;
	clearInterval(death);
	clearInterval(comboInterval);
	$("#end").attr("id","targetScore");
	isIntervalInProgress = false;
	setUserSpeed();
	setBackground();
	setEnemyCharacter();
	collisionFlagLife = $("#ifCollisionLife").next().attr("id");
	elseCollisionFlagCombo = $("#ifCollisionCombo").next().attr("id");
	endingFlagCombo = $("#orExceedPoint").next().attr("id");
	comboActivate();
	if ( isIntervalInProgress ) {
		return false;
	}else {
		isIntervalInProgress = true;
		death = setInterval(checkDeath, 300);
	}
	
}

function quiz2Function() {
	setUserSpeed();
	setBackground();
	setEnemyCharacter();
	$("#enemyGroup").empty();
	$("#enemyGroup").append(imgsrc);
	animateDivDefault();
}

function comboActivate() {
	comboInterval = setInterval(function() {
		combo = 1 + combo;
		var comboBonus = parseInt($("#comboBonus").val());
		var comboConstraint = $("#comboConstraint").val();
	  	$("#targetCombo").text(combo+"콤보");
	  	if(combo >= comboConstraint) {
	  		$("#comboAlert").text("+" + comboBonus + "점!").show();
	  		totalScore = comboBonus + totalScore;
	  	  	$("#targetScore").text(totalScore);
	  		setTimeout(function() {
				$("#comboAlert").hide();
			}, 500);
	  	}
	  	if(endingFlagCombo == "ending") {
  	  		checkEnding();
  	  	}
	}, 2000);	
}

function setEnemyCharacter() {
	var image3 = "/ProjectSCSE/assets/image/Chapter05/" + $("select[name=enemySelection]").val();
	$("#enemyGroup").empty();
	imgsrc = "<img src='" + image3 + "' class='obstacle' style='top: 50%; left: 50%;'>";
}

function setUserCharacter() {
	if($("#userCharacterBoard").children().size()!=1) {
		$("#MakeAgainModal").modal("show");
		return;
	}
	var image = $("select[name=characterSelection]").val();
	var url = "/ProjectSCSE/assets/image/Character/";
	$("#player").css("background","url('"+url+image+"')");
	$("#player").css("background-size","cover");
}

function setBackground() {
	var image2 = $("select[name=backgroundSelection]").val();
	var url2 = "/ProjectSCSE/assets/image/Chapter05/";
	$("#playground").css("background","url('"+url2+image2+"')");
	$("#playground").css("background-size","cover");
}

$(document).ready(function() {
	
	$(document).on("click", "#easyTest", function() {
		commonFunction();
		easyMethod();
	});
	
	$(document).on("click", "#normalTest", function() {
		commonFunction();
		normalMethod();
	});
	
	$(document).on("click", "#hardTest", function() {
		commonFunction();
		hardMethod();
	});
	
	$( "#selector, #board, #board1, #board2, #board3, #board4, .board" ).sortable({
	      connectWith: ".sortable",
	      items : "li:not(.ui-state-disabled)",
			start : function(event, ui) {
				$(".trainLink", ui.item).hide();
			},
			update : function(event, ui) {
				$(".trainLink", "#board").show();
				$(".trainLink", "#board1").show();
				$(".trainLink", "#board2").show();
				$(".trainLink", "#board3").show();
				$(".trainLink", "#board4").show();
			}
	    }).disableSelection();
	
	// chapter2 : 유저 속도 결정
	$("#changeSpeed").on("click", function(){
		setUserSpeed();
	});
	
	// chapter3 : 유저 캐릭터 결정
	$("#changeChar").on("click", function(){
		setUserCharacter();
	 });
	
	// chapter4 : 배경 결정
	$("#changeback").on("click", function(){
		setBackground();
	});
	
	// chapter5 : 적 캐릭터 결정
	$("#enemyCheck").on("click", function(){
		setEnemyCharacter();
	});
	
	//쿠키런 좀비로했다는 가정하에
	var image = "zzangu.png";
	var url = "/ProjectSCSE/assets/image/Character/";
	$("#player").css("background",
			"url('" + url + image + "')");
	$("#player").css("background-size", "cover");

	//배경바꾸기
	var image2 = "sea.jpg";
	var url2 = "/ProjectSCSE/assets/image/Chapter05/";
	$("#playground").css("background",
			"url('" + url2 + image2 + "')");
	$("#playground").css("background-size", "cover");

	$("#enemyCheck").on("click",function() {
		var image3 = $("select[name=enemySelection]").val();
		url3 = "/ProjectSCSE/assets/image/Chapter05/";
		
		//이미지 src로 박기
	});

	//키 다운 체크
	$(this).keydown(function(e) {
		// chapter1
		/*if($("#keyBoard").children().size()!=8) {
			alert("다시 조립해주세요 ㅠㅠ");
			return;
		}*/
		keys[e.which] = true;
		keypressed(keys);
	});
	
	//키가 올라가면 지움
	$(this).keyup(function(e) {
		delete keys[e.which];
	});

	function keypressed() {

		for ( var key in keys) {
			// chapter1
			var left = $("#leftDirection").prev().children().val();
			var right = $("#rightDirection").prev().children().val();
			var down = $("#downDirection").prev().children().val();
			var up = $("#upperDirection").prev().children().val();
			
			/*var left = 65;
			var right = 68;
			var down = 83;
			var up = 87;*/
			
			// chapter1
			if (left==""||up==""||down==""||right==""){
				$("#NullKey").modal("show");
				break;
			}

			// Directions - Up, Right, Left, Down
			if (key == up) { // Player Up
				if($('#player').position().top > 0){
					$('#player').stop(true, false).animate({
						top : '-=' + speed + ''
					}, 0);
				}
			}

			if (key == right) { // Player Right
				//-150은 캐릭터 크기
				if($('#player').position().left < $(window).width()*0.74 - 100){	
					$('#player').stop(true, false).animate({
							left : '+=' + speed + ''
						}, 0);
				}
			}

			if (key == down) { // Player Down
				//캐릭터 크키 -10 정도 해줘야 잘됨.
				if($('#player').position().top < $(window).height()*0.74 -100 -10){	
					$('#player').stop(true, false).animate({
						top : '+=' + speed + ''
					}, 0);
				}
			}

			if (key == left) { // 'A' and 'a' Key - Player Left
				if($('#player').position().left > 0){
					$('#player').stop(true, false).animate({
						left : '-=' + speed + ''
					}, 0);
				}
			}
		}
	}
	
	$(window).resize(function() {
		$("#playground").css("width", $(window).width()*0.74);
		$("#playground").css("height", $(window).height()*0.74);
	});
	
	$("#playground").css("width", $(window).width()*0.74);
	$("#playground").css("height", $(window).height()*0.74);
		
	// chapter6 : 적 수 결정
	$("#enemyNum").on("click", function(){

	});
	
	// chapter7 : 점수 결정
	$("#scoreBtn").on("click", function() {
		setScore();
	});
	
	// chapter8 : 라이프 수 결정
	$("#lifeBtn").on("click", function(){
		setLifeNum();
	});
    
});

function makeNewPosition(){
    var h = $('#playground').height();
    var w = $('#playground').width();
    
    var nh = Math.floor(Math.random() * h);
    var nw = Math.floor(Math.random() * w);
    
    return [nh,nw];    
    
};

function animateDivDefault(){
	totalScore = 10 + totalScore;
  	$("#targetScore").text(totalScore);
	enemySpeed = 2500;
	$(".obstacle").each(function(){
	    var newq = makeNewPosition();
		$(this).animate({ top: newq[0], left: newq[1] }, enemySpeed, function(){
			animateDivDefault();       
	    });
	});
}

function checkEnding() {
	if(totalScore >= $("#endingPoint").val()) {
		$("#MissionClearModal").modal("show");
		clearInterval(death);
		isIntervalInProgress = false;
		clearInterval(comboInterval);
		$("#targetScore").attr("id", "end");
		return;
	}
}

function animateDiv(){
//	var enemyCount = $("#enemyGroup").children().length;
  	totalScore = 10 + totalScore;
  	$("#targetScore").text(totalScore);
	var enemySpeed = 5000/methodSpeed;
	$(".obstacle").each(function(){
	    var newq = makeNewPosition();
		    $(this).animate({ top: newq[0], left: newq[1] }, enemySpeed, function(){
	    animateDiv();       
	    });
	});
}

//충돌함수
function collision($div1, $div2) {
      var x1 = $div1.offset().left;
      var y1 = $div1.offset().top;
      var h1 = $div1.outerHeight(true);
      var w1 = $div1.outerWidth(true);
      var b1 = y1 + h1;
      var r1 = x1 + w1;
      var x2 = $div2.offset().left;
      var y2 = $div2.offset().top;
      var h2 = $div2.outerHeight(true);
      var w2 = $div2.outerWidth(true);
      var b2 = y2 + h2;
      var r2 = x2 + w2;
        
      if (b1 < y2 || y1 > b2 || r1 < x2 || x1 > r2) return false;
      return true;
    };

function checkDeath(){
	$(".obstacle").each(function() {
		if(collision($('#player'), $(this))){
			if(collisionFlagLife == "minusLife") {
				minusLife();
				if(elseCollisionFlagCombo == "defaultCombo") {
					defaultCombo();
				}
			}
		}
	});
}

function minusLife() {
	lifeCount--;
	if((lifeCount == 0) && (endingFlagCombo == "ending")){
		$("#lifeTable tr td:nth-child(1)").remove();
		$("#DeathModal").modal("show");
		clearInterval(death);
		isIntervalInProgress = false;
		clearInterval(comboInterval);
		$("#targetScore").attr("id", "end");
		return;
	} else {
		$("#lifeTable tr td:nth-child(1)").remove();
		clearInterval(death);
		isIntervalInProgress = false;
		setTimeout(function() {
			if ( isIntervalInProgress ) {
				return false;
			}else {
				isIntervalInProgress = true;
				death = setInterval(checkDeath, 300);
			}
		}, 1000);
	}
}

function defaultCombo() {
	combo=0;
	$("#targetCombo").text(combo+"콤보");
	return;
}

function setUserSpeed() {
	speed = $("#speed").val()*5;
}

function setLifeNum() {
	$(".targetLife").empty();
	lifeCount = life;
	for(var i=0; i<life; i++) {
		var td = $("<td/>").text("♥").attr("class","lifes");
		$(".targetLife").append(td);
	}
	return;
}

function setScore() {
	if($("#scoreBoard").children().size()!=1) {
		$("#MakeAgainModal").modal("show");
		return;
	}
	score = $("#score").val();
}

function easyMethod() {
	methodSpeed = $(".enemySpeedOrder","#easyMethodBoard").children().val();
	life = $(".lifeOrder","#easyMethodBoard").children().val();
	setLifeNum();
	$("#enemyGroup").empty();
	enemyCount = $(".enemyNumOrder","#easyMethodBoard").children().val();
	for(var i = 1; i<=enemyCount; i++){
		$("#enemyGroup").append(imgsrc);
	};
	animateDiv();
}

function normalMethod() {
	methodSpeed = $(".enemySpeedOrder","#normalMethodBoard").children().val();
	life = $(".lifeOrder","#normalMethodBoard").children().val();
	setLifeNum();
	$("#enemyGroup").empty();
	enemyCount = $(".enemyNumOrder","#normalMethodBoard").children().val();
	for(var i = 1; i<=enemyCount; i++){
		$("#enemyGroup").append(imgsrc);
	};
	animateDiv();
}

function hardMethod() {
	methodSpeed = $(".enemySpeedOrder","#hardMethodBoard").children().val();
	life = $(".lifeOrder","#hardMethodBoard").children().val();
	setLifeNum();
	$("#enemyGroup").empty();
	enemyCount = $(".enemyNumOrder","#hardMethodBoard").children().val();
	for(var i = 1; i<=enemyCount; i++){
		$("#enemyGroup").append(imgsrc);
	};
	animateDiv();
}

function setEnemyNum() {
	/*var image3 = "/ProjectSCSE/assets/image/Chapter05/" + $("select[name=enemySelection]").val();
	$("#enemyGroup").empty();
	imgsrc = "<img src='" + image3 + "' class='obstacle' style='top: 50%; left: 50%;'>";*/
	$("#enemyGroup").empty();
	var enemyCount = $("#enemy").val();
	for(var i = 1; i<=enemyCount; i++){
		$("#enemyGroup").append("<img src='/ProjectSCSE/assets/image/Chapter05/enemy_meteora.png' class='obstacle' style='top: 50%; left: 50%;'>");
	};
	animateDiv();
}