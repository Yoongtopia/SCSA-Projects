var interval = 0;
var code = "";
$(document).on("click", "#run", function() {
	tailor($(".items", "#board"));
	tailor($(".items", "#board1"));
	tailor($(".items", "#board2"));
	tailor($(".items", "#board3"));
	tailor($(".items", "#board4"));
	try {
		eval(code);
		/*squaredPaperResult();*/
	}catch(error) {
		$("#MakeAgainModal").modal("show");
		/*alert("다시 조립해주세요 ㅠㅠ`");*/
		return;
	}
});
function tailor($sortable) {
for (var i = 0; i < $sortable.length; i++) {
	if ($sortable.eq(i).attr("id") == "for3") {
		code = code + "for(i=1; i<=3; i++){";
	}else if($sortable.eq(i).attr("id") == "for4") {
		code = code + "for(j=1; j<=4; j++){";
	}else if($sortable.eq(i).attr("id") == "for5") {
		code = code + "for(k=1; k<=5; k++){";
	}else if($sortable.eq(i).attr("id") == "for2") {
		code = code + "for(l=1; l<=2; l++){";
	}else {
		code = code + $sortable.eq(i).attr("id");
	}
}
}