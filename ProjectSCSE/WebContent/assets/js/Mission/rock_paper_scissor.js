var interval = 0;
var code = "";
var $sortable = "";
var knowEnemy = "";
var winCount = 0;
var playCount = 0;

$(document).ready(function() {
	
	$(".trainLink").hide();
	$(".trainLink", "#board").show();
	
	$( "#selector, #board" ).sortable({
	      connectWith: ".sortable",
	      items: "li:not(.ui-state-disabled)",
	      start: function(event, ui) {
			$(".trainLink", ui.item).hide();
	      },
	      update: function(event, ui) {
	    	$(".trainLink", "#board").show();
	      }
	    }).disableSelection();
	
	/*$("#selector").sortable({
		connectWith : ".sortable",
		forcePlaceholderSize : false,
		stop : function() {
			copyHelper && copyHelper.remove();
		},
		revert : true
	});

	$(".sortable").sortable({
		receive : function(e, ui) {
			copyHelper = null;
		},
		revert : true
	});*/
	
	$("#rpsHeader").children().hide();
	$(".rpsImg").hide();
});

// 결과 체크하는 메서드
function checkResult(knowEnemy, knowMyself) {
	var result = "";
	if(knowEnemy=="rock") {
		if(knowMyself=="rock") {
			result = "draw";
		}else if(knowMyself=="paper") {
			result = "win";
		}else {
			result = "lose";
		}
	}else if(knowEnemy=="paper") {
		if(knowMyself=="rock") {
			result = "lose";
		}else if(knowMyself=="paper") {
			result = "draw";
		}else {
			result = "win";
		}
	}else {
		if(knowMyself=="rock") {
			result = "win";
		}else if(knowMyself=="paper") {
			result = "lose";
		}else {
			result = "draw";
		}
	}
	interval+=1000;
	showAcho(knowEnemy, knowMyself, result);
}

// 아코가 낼 거 결정하는 메서드
function knowAcho() {
	var r = Math.random()*100;
	r = Math.ceil(r);
	if(r>=0 && r<=33) {
		knowEnemy = "rock";
	}else if(r>33 && r<=66) {
		knowEnemy = "paper";
	}else {
		knowEnemy = "scissor";
	}
}

// 코드 에러 체크하는 메서드
function checkError($sortable) {
	for (var i = 0; i < $sortable.length; i++) {
		if($sortable.eq(i).attr("check") == "decision") {
			if($sortable.eq(i+1).attr("check") == "decision") {
				//다시조립해주세요 모달이 여기에 들어 있었음묘.
				$("#MakeAgainModal").modal("show");
				return false;
			}else if($sortable.eq(i+1).attr("id") != "}") {
				$("#MakeAgainModal").modal("show");
				return false;
			}else if($sortable.eq(i-1).attr("check") != "condition") {
				$("#MakeAgainModal").modal("show");
				return false;
			}
		}else if($sortable.eq(i).attr("check") == "condition") {
			if($sortable.eq(i+1).attr("id") == "}") {
				$("#MakeAgainModal").modal("show");
				return false;
			}
		}else if($sortable.eq(i).attr("check") == "startFor") {
			if($sortable.eq($sortable.length-1).attr("check") != "endFor") {
				$("#MakeAgainModal").modal("show");
				return false;
			}
		}
	}
	return true;
}

// 가위! 바위! 보! 글자 뜨는 메서드
function initRps() {
	$("#rpsHeader").children().hide();
	$(".rpsImg").hide();
	interval+=1000;
	setTimeout(function() {
		$("#scissor").show('puff');
	}, interval);
	interval+=1000;
	setTimeout(function() {
		$("#scissor").hide();
		$("#rock").show('puff');
	}, interval);
	interval+=1000;
	setTimeout(function() {
		$("#rock").hide();
		$("#paper").show('puff');
		$("#vs").show("Highlight");
	}, interval);
	interval=1500;
}

// 아코 그림 뜨는 메서드
function showAcho(knowEnemy, knowMyself, result) {
	setTimeout(function() {
		if(knowEnemy == "rock") {
			$("#achoRockImg").show();
		}else if(knowEnemy == "paper") {
			$("#achoPaperImg").show();
		}else {
			$("#achoScissorImg").show();
		}
	}, interval);
	showPlayer(knowMyself, result);
}

// 유저 그림 뜨는 메서드
function showPlayer(knowMyself, result) {
	setTimeout(function() {
		if(knowMyself == "rock") {
			$("#playerRockImg").show();
		}else if(knowMyself == "paper") {
			$("#playerPaperImg").show();
		}else {
			$("#playerScissorImg").show();
		}
		$(".showMent").hide();
	}, interval);
	setTimeout(function() {
		showResult(result);
	}, interval+1000);
	
}