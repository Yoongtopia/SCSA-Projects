$(document).ready(function() {
	$("body").on("click", "path", function() {
		var square_num = $(this).attr('square_num');
		location.href="product_list_by_square.do?square_num="+square_num; 			
	});

	
	$('.dropdown-toggle').dropdown();
	
	/* 모달 변수 설정 */
	var modal = $('#palet').plainModal({duration : 500});
	
	/* 상품상세정보 모달창 띄우기 */
	$("body").on("click", ".box", function() {
		modal.plainModal('open', {offset : {left : 200,top : 150}});
		
		$($('#palet').children()[0]).css("left", "0px");
		$($('#palet').children()[1]).css("left", "1300px");
		
		$.get("product_detail.do", {
			"product_num" : $(this).attr("product_num")
		}, function(data) {
			$("#sub1_palet").html(data);

		}, "html");
	});
	
	/* 판매자 상세정보 */
	$("body").on("click", "#seller_info", function() {
		$.get("user_detail.do", {"user_id" : $(this).attr("user_id")}, 
				function(data) {$("#sub2_palet").html(data);}, "html");
		modal.children().animate({"left" : "-=1300px"}, 1600);
		
		var $container = $('#container');
		$container.imagesLoaded(function() {
			$container.masonry({
				itemSelector : '.box2'
			});
		});

	});
	
	/* 상품 상세정보로 돌아가기 */
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

	/* 쪽지 보내기 */
	$("body").on('click', '#sendMsg', function() {
		receiver = $(this).attr("receiver");
		var url = "send_msg_page.do?user_id=" + receiver;
		window.open(url, "_blank","height=300,width=400");
	});
	
	/*사진 새창띄워서 크게보기*/
	$("body").on('click', ".expansion", function(){
		var product = $("#product_num").text();
		var url = "product_image_expansion.do?product_num=" +product;
		window.open(url, "_blank","height=800,width=700");
	})
	
	/* 구매요청 */
	$("body").on('click', '#request', function() {
		/* 개인정보 보이기*/
		$("#privateInfo").show();
	});
	
	/* */
	$("div.delbtn").click(function (e) {
		e.stopPropagation();
	});
	
	$("body").on('click', "#deleteWishlistBtn", function(){
		if(confirm("정말 삭제하시겠습니까?")){
		$.post("delete_wishlist.do",
				{"product_num": $("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("삭제되었습니다.");
						modal.plainModal('close');
					}else{
						alert("삭제에 실패하였습니다.");
					}
				}, "json");
		}
	});
	
	$("body").on('click', "#addWishlist", function(){
		if(confirm("정말 추가하시겠습니까?")){
		$.post("add_wishlist.do",
				{"product_num": $("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("위시리스트에 추가되었습니다.");
						modal.plainModal('close');
					}else{
						alert("위시리스트 추가에 실패하였습니다.");
					}
				}, "json");
		}
		
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
