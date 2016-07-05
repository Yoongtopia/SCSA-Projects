var interval = 0;

$(document).ready(function() {
	$(".trainLink").hide();
	$(".trainLink", "#board").show();
	$("#bullet").hide();
	$(".present").hide();
	
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
});

function moveRight() {
	setTimeout(function() {
		$('#target').animate({
			left : '+=75px'
		}, 'slow', function() {
			fireCount=0;
			clearTimeout(afterTimeOut);
			afterTimeOut=setTimeout(checkGunshotResult, 1400);
		});
	}, interval);
	interval+=700;
	detection+=1;
}

/*function doubleShot() {
	setTimeout(function() {
		checkEnemyType();
	}, interval);
	for (var i = 0; i < 2; i++) {
		setTimeout(function() {
			checkEnemy();
		}, interval);
		interval+=700;
	}
}*/

function gunShot() {
	setTimeout(function() {
		if(fireCount==0) {
			checkEnemyType();
		}
		checkEnemy();
		fireCount+=1;
	}, interval);
	interval+=700;
}

function present() {
	setTimeout(function() {
		checkFriend();
	}, interval);
	interval+=700;
}

function checkEnemy() {
	if(bullets>0) {
		$('#bullet').show().animate({
			top : '-=180px'
		}, 'fast', function() {
			$('#bullet').hide();
			$('#bullet').css("top","-20px");
		});
		clearTimeout(afterTimeOut);
		afterTimeOut=setTimeout(checkGunshotResult, 1400);
		$(".enemy").each(function(index, item) {
			if (collision($('#target'), $(this))) {
				enemyHP-=100;
				if(enemyHP==0) {
					$(this).hide("shake");
					kill+=1;
				}
				return false;
			}
		});
		bullets-=1;
	}else {
		clearTimeout(afterTimeOut);
		afterTimeOut=setTimeout(checkGunshotResult, 1400);
	}
}

function checkFriend() {
	clearTimeout(afterTimeOut);
	afterTimeOut=setTimeout(checkGunshotResult, 1400);
	$(".friend").each(function(index, item) {
		if (collision($('#target'), $(this))) {
			$(".present", this).show("shake");
			assist+=1;
		}
	});
}

function collision($div1, $div2) {
	var x1 = $div1.offset().left;
	var w1 = $div1.outerWidth(true);
	var r1 = x1 + w1;
	var x2 = $div2.offset().left;
	var w2 = $div2.outerWidth(true);
	var r2 = x2 + w2;
	if (r1 == r2 && x1 == x2 ) {
		return true;
	}
	return false;
}

function checkEnemyType() {
	$(".normalHP").each(function(index, item) {
		if (collision($('#target'), $(this))) {
			enemyHP=100;
		}
	});
	$(".strongHP").each(function(index, item) {
		if (collision($('#target'), $(this))) {
			enemyHP=200;
		}
	});
}
