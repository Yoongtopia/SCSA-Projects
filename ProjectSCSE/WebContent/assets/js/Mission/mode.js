var detectLight = true;
var redSign = false;
var greenSign = false;
var redSignal = "red";
var buttonLimit = 0;

function setRedSign(signal) {
	if (signal == "red") {
		redSign = true;
	}
}

$(function() {
	
	$(".trainLink").hide();
	$(".trainLink", "#board").show();
	$(".trainLink", "#board1").show();
	$(".trainLink", "#board2").show();
	$(".trainLink", "#board3").show();
	$(".trainLink", "#board4").show();

	// 비워두기 버튼 생성
	$(document).on("click","#notPaintBtn",function() {
		$("<li class='items notPaint' id='notPaint();'></li>").append($("<div class='trainLink' style='display: none'></div>")).appendTo("#selector");
		
	});

	// 색칠하기 버튼 생성
	$(document).on("click","#paintBtn",function() {
		$("<li class='items paint' id='paint();'></li>").append($("<div class='trainLink' style='display: none'></div>")).appendTo("#selector");
		
	});

	// 위로 가기 버튼 생성
	$(document).on("click", "#moveUpBtn", function() {
		$("<li class='items' id='moveUp();'>앞</li>").appendTo("#selector");
	});

	// 아래로 가기 버튼 생성
	$(document).on("click", "#moveDownBtn", function() {
		$("<li class='items' id='moveDown();'>뒤</li>").appendTo("#selector");
	});

	// 오른쪽으로 가기 버튼 생성
	$(document).on("click", "#moveRightBtn", function() {
		$("<li class='items' id='moveRight();'>우</li>").appendTo("#selector");
	});

	// 왼쪽으로 가기 버튼 생성
	$(document).on("click", "#moveLeftBtn", function() {
		$("<li class='items' id='moveLeft();'>좌</li>").appendTo("#selector");
	});

	// 반복문 버튼 생성
	$(document).on("click",	"#loopBtn2", function() {
		$li1 = $("<li class='items startFor2' id='for2'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$li2 = $("<li class='items endFor' id='}'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$("#selector").append($li1, $li2);
		
	});

	$(document).on("click","#loopBtn3",	function() {
		$li1 = $("<li class='items startFor3' id='for3'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$li2 = $("<li class='items endFor' id='}'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$("#selector").append($li1, $li2);
		
	});
	$(document).on("click","#loopBtn4",	function() {
		$li1 = $("<li class='items startFor4' id='for4'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$li2 = $("<li class='items endFor' id='}'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$("#selector").append($li1, $li2);
		
	});
	$(document).on("click","#loopBtn5",function() {
		$li1 = $("<li class='items startFor5' id='for5'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$li2 = $("<li class='items endFor' id='}'></li>").append($("<div class='trainLink' style='display: none'></div>"));
		$("#selector").append($li1, $li2);
		
	});

	// 이중 반복문 버튼 생성
	$(document)
			.on(
					"click",
					"#doubleLoopBtn",
					function() {
						$li1 = $("<li class='items' id='for1'></li>")
								.text("회")
								.prepend(
										$("<input type='text' id='forLoop1' size='1'>"));
						$li2 = $("<li class='items' id='}'>이중반복</li>");
						$("#selector").append($li1, $li2);
					});

	$("#selector, #board, #board1, #board2, #board3, #board4").sortable({
		connectWith : ".sortable",
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

	/*
	 * $("#selector").sortable({ connectWith : ".sortable", forcePlaceholderSize :
	 * false, stop : function() { copyHelper && copyHelper.remove(); }, revert :
	 * true });
	 * 
	 * $(".sortable").sortable({ receive : function(e, ui) { copyHelper = null; },
	 * revert : true });
	 */

	$(".trafficLight1").css("backgroundColor", "red").attr("id", "redLight");
	setTimeout(function() {
		$(".trafficLight1").css("backgroundColor", "green").attr("id",
				"greenLight");
	}, 2000);
	setTimeout(function() {
		$(".trafficLight1").css("backgroundColor", "red")
				.attr("id", "redLight");
	}, 4000);
	setInterval(function() {
		setTimeout(function() {
			$(".trafficLight1").css("backgroundColor", "green").attr("id",
					"greenLight");
		}, 2000);
		setTimeout(function() {
			$(".trafficLight1").css("backgroundColor", "red").attr("id",
					"redLight");
		}, 4000);
	}, 4000)
	$(".trafficLight2").css("backgroundColor", "green")
			.attr("id", "greenLight");
	setTimeout(function() {
		$(".trafficLight2").css("backgroundColor", "red")
				.attr("id", "redLight");
	}, 2000);
	setTimeout(function() {
		$(".trafficLight2").css("backgroundColor", "green").attr("id",
				"greenLight");
	}, 4000);
	setInterval(function() {
		setTimeout(function() {
			$(".trafficLight2").css("backgroundColor", "red").attr("id",
					"redLight");
		}, 2000);
		setTimeout(function() {
			$(".trafficLight2").css("backgroundColor", "green").attr("id",
					"greenLight");
		}, 4000);
	}, 4000)
});

// 색칠하기
function paint() {
	setTimeout(function() {
		$("#targetSquare").css("background-color", "#579EED");

		$("#targetSquare").next().attr("id", "targetSquare");
		$("#targetSquare").attr("id", "blackSquare");
		answer += 1;
	}, interval);
	interval += 100;
}

// 색칠안하기
function notPaint() {
	setTimeout(function() {
		$("#targetSquare").css("background-color", "#FFDEAD");

		$("#targetSquare").next().attr("id", "targetSquare");
		$("#targetSquare").attr("id", "whiteSquare");
		answer += 0;
	}, interval);
	interval += 100;
}

// 위로간다
function moveUp() {
	$('#target').animate({
		top : '-=75px'
	}, function() {
		clearTimeout(afterTimeOut);
		checkFailure();
		afterTimeOut = setTimeout(function() {
			checkSuccess();
		}, 700);
	});
	detection = detection - 7;
}

// 아래로 간다
function moveDown() {
	$('#target').animate({
		top : '+=75px'
	}, function() {
		clearTimeout(afterTimeOut);
		checkFailure();
		afterTimeOut = setTimeout(function() {
			checkSuccess();
		}, 700);
	});
	detection = detection + 7;
}
// 오른쪽으로 간다
function moveRight() {
	$('#target').animate({
		left : '+=75px'
	}, function() {
		clearTimeout(afterTimeOut);
		checkFailure();
		checkLight();
		if (!detectLight) {
			if (redSign) {
				wait(2000);
			}
			detectLight = true;
		}
		afterTimeOut = setTimeout(function() {
			checkSuccess();
		}, 700);
	});
	detection = detection + 1;
}
// 왼쪽으로 간다
function moveLeft() {
	detection = detection - 1;
	$('#target').animate({
		left : '-=75px'
	}, function() {
		clearTimeout(afterTimeOut);
		checkFailure();
		afterTimeOut = setTimeout(function() {
			checkSuccess();
		}, 700);
	});

}
// 충돌 체크 함수
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

	if (b1 == b2 && y1 == y2 && r1 == r2 && x1 == x2) {
		$('#target').attr("id", "finished").stop(true);
		return true;
	}
	return false;
}

// 신호등 충돌 체크 함수
function lightCollision($div1, $div2) {
	var x1 = $div1.offset().left;
	var y1 = $div1.offset().top;
	var h1 = $div1.outerHeight(true);
	var w1 = $div1.outerWidth(true);
	var b1 = y1 + h1;
	var r1 = x1 + w1;
	var x2 = $div2.offset().left;
	var y2 = $div2.offset().top;
	var h2 = $div2.outerHeight(true);
	var b2 = y2 + h2;
	if (r1 == x2 && y1 == y2 && b1 == b2) {
		return true;
	}
	return false;
}

function checkSuccess() {
	if (collision($('#target'), $('#goal'))) {
		$("#goal").hide("shake");
		$("#CorrectModal").modal("show");
		$("#nextBtn").show();
		$("#retryBtn").show();
		successUpdate();
	} else {
		$("#WrongModal").modal("show");
		$("#retryBtn").show();
		failUpdate();
	}
}

function checkFailure() {
	$(".fail").each(function(index, item) {
		if (collision($('#target'), $(this))) {
			$("#WrongModal").modal("show");
			$("#retryBtn").show();
			f();
			/* location.reload(); */
			return false;
		}
	});
}

function checkLight() {
	$(".light").each(function(index, item) {
		var flag = lightCollision($('#target'), $(this));
		if (flag) {
			if ($(this).attr("id") == "greenLight") {
				detectLight = true;
			} else {
				detectLight = false;
			}
		}
	});
}

function wait(msecs) {
	var start = new Date().getTime();
	var cur = start;
	while (cur - start < msecs) {
		cur = new Date().getTime();
	}
}