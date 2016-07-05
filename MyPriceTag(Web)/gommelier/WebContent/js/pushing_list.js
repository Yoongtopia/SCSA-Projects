$(document).ready(function() {
	/*$("body").on("mouseover", ".box", function() {
		$(this).children(".name, .weight").show();
	}).on("mouseout", ".element-item", function() {
		$(this).children(".name").hide();
	});*/
	
	$('.dropdown-toggle').dropdown();
	
	/* 모달 관련 코드 */
	var modal = $('#palet').plainModal({duration : 500});
	
	/* 상세보기 */
	$("body").on("click", ".act", function() {
		modal.plainModal('open', {offset : {left : 200,top : 150}});
		
		$($('#palet').children()[0]).css("left", "0px");
		$($('#palet').children()[1]).css("left", "1300px");
		
		$.get("product_detail.do", {
			"product_num" : $(this).attr("product_num")
		}, function(data) {
			$("#sub1_palet").html(data);	
		}, "html");
	});
	
	/* 유저상세 보기 */
	$("body").on("click", "#seller_info", function() {
		$.get("user_detail.do", {"user_id" : $(this).attr("user_id")}, 
				function(data) {$("#sub2_palet").html(data);}, "html");
		modal.children().animate({"left" : "-=1300px"}, 1600);
	});
	
	/* 함더 상세정보?? */
	$("body").on('click', ".box2", function() {
		$.get("product_detail.do", {
			"product_num" : $(this).attr("product_num")
		}, function(data) {
			$("#sub1_palet").html(data);	
		}, "html");
		
		modal.children().animate({"left" : "+=1300px"}, 1600);
	});
	
	/* 뒤로가기 */
	$("body").on('click', "#back", function() {
		modal.children().animate({"left" : "+=1300px"}, 1600);
	});

	/* 쪽지보내기 */
	$("body").on('click', '#sendMsg', function() {
		receiver = $(this).attr("receiver");
		var url = "send_msg_page.do?user_id=" + receiver;
		window.open(url, "_blank","height=300,width=400");
	});
	
	/* 요청하기 */
	$("body").on('click', '#request', function() {
		/* 비동기 요청 처리 필요함*/
		$("#privateInfo").show();
	});
	
	/* 옵션 버튼 클릭*/
	$("div.delbtn").click(function (e) {
		e.stopPropagation();
	});
	
	$("body").on('click', "#deleteWishlistBtn", function(){
		alert($("#product_num").text());
		$.post("delete_wishlist.do",
				{"product_num": $("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("삭제되었습니다");
						modal.plainModal('close');
					}else{
						alert("삭제과정에서 문제가 있었습니다");
					}
				}, "json");
	});
	
	$("body").on('click', "#addWishlist", function(){
		alert($("#product_num").text());
		$.post("add_wishlist.do",
				{"product_num": $("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("추가되었습니다");
						modal.plainModal('close');
					}else{
						alert("추가과정에서 문제가 있었습니다");
					}
				}, "json");
	});
	
	$("body").on('click', "#modifyBtn", function(){
		alert($("#product_num").text());
		$.get("product_modify.do", {"product_num" : $("#product_num").text()}, 
				function() {$("#sub2_palet").html(data);}, "html");
	});
	
	$("body").on('click', "button.close", function(){
		$("#palet").plainModal('close');
	});

});
