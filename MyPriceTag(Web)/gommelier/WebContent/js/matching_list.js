$(document).ready(function() {
	/*$("body").on("mouseover", ".box", function() {
		$(this).children(".name, .weight").show();
	}).on("mouseout", ".element-item", function() {
		$(this).children(".name").hide();
	});*/
	
	$('.dropdown-toggle').dropdown();
	
	/* ��� ��� �ڵ� */
	var modal = $('#palet').plainModal({duration : 500});
	
	/* �󼼺��� */
	$("body").on("click", ".product_detail_go", function() {
		modal.plainModal('open', {offset : {left : 200,top : 150}});
		
		$($('#palet').children()[0]).css("left", "0px");
		$($('#palet').children()[1]).css("left", "1300px");
		
		$.get("product_detail.do", {
			"product_num" : $(this).attr("product_num")
		}, function(data) {
			$("#sub1_palet").html(data);	
		}, "html");
	});
	
	/* ����� ���� */
	$("body").on("click", "#seller_info", function() {
		$.get("user_detail.do", {"user_id" : $(this).attr("user_id")}, 
				function(data) {$("#sub2_palet").html(data);}, "html");
		modal.children().animate({"left" : "-=1300px"}, 1600);
	});
	
	/* �Դ� ������?? */
	$("body").on('click', ".box2", function() {
		$.get("product_detail.do", {
			"product_num" : $(this).attr("product_num")
		}, function(data) {
			$("#sub1_palet").html(data);	
		}, "html");
		
		modal.children().animate({"left" : "+=1300px"}, 1600);
	});
	
	/* �ڷΰ��� */
	$("body").on("click", "#back", function(){
		alert("back");
		modal.children().animate({"left" : "+=1300px"}, 1600);
	});

	/* ���������� */
	$("body").on('click', '#sendMsg', function() {
		receiver = $(this).attr("receiver");
		var url = "send_msg_page.do?user_id=" + receiver;
		window.open(url, "_blank","height=300,width=400");
	});
	
	/*사진 새창띄워서 크게보기*/
	$("body").on('click', ".expansion", function(){
		var product = $("#productNumTR").children("td:nth-child(2)").text();
		alert(product);
		var url = "product_image_expansion.do?product_num=" +product;
		window.open(url, "_blank","height=800,width=700");
	})
	
	/* ��û�ϱ� */
	$("body").on('click', '#request', function() {
		/* �񵿱� ��û ó�� �ʿ���*/
		$("#privateInfo").show();
	});
	
	/* �ɼ� ��ư Ŭ��*/
	$("div.delbtn").click(function (e) {
		e.stopPropagation();
	});
	
	$("body").on('click', "#deleteWishlistBtn", function(){
		alert($("#product_num").text());
		$.post("delete_wishlist.do",
				{"product_num": $("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("�����Ǿ���ϴ�");
						modal.plainModal('close');
					}else{
						alert("������������ ������ �־���ϴ�");
					}
				}, "json");
	});
	
	$("body").on('click', "#addWishlist", function(){
		alert($("#product_num").text());
		$.post("add_wishlist.do",
				{"product_num": $("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("�߰��Ǿ���ϴ�");
						modal.plainModal('close');
					}else{
						alert("�߰��������� ������ �־���ϴ�");
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
