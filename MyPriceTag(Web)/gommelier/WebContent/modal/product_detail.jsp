<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./js/jssor.core.js"></script>
<script type="text/javascript" src="./js/jssor.utils.js"></script>
<script type="text/javascript" src="./js/jssor.slider.js"></script>
<style type="text/css">
	ul > li {
		list-style: none;
	}
	
	img.user_head{
		width: 25px;
		height: 100%;
		margin-right: 20px;
	}
	
	img{
/* 		left: 0px; */
/* 		float: left; */
	}
	
	ul.cmt_list > li{
		height: 35px;
		width: 800px;
		margin-top: 5px;
		margin-bottom: 5px;
		line-height: 30px;
		border-bottom: 1px solid rgba(0, 0, 0, .15);
	}
	
	ul.cmt_list > li > span{
		float: right;
		margin-right: 10px;
	}
	
	ul.cmt_list{
		
	}
	
	#notMyProduct{
		position: absolute;
		left: 100px;
	}
	#yesMyProduct{
		position: absolute;
		left: 180px;
	}
	.dropdown-menu{
		padding: 0px;
	}
	
	.dropdown-menu > li> a{
		color: #FF6600;
		
	}
	#commentWrite{
		position: relative;
	}
	#commentInput{
		position: absolute;
		left: 50px;
	}
	#commentInputBtn{
		position: absolute;
		left: 770px;
	}
	.reCommentWrite{
		position: relative;
	}
	.reCommentInput{
		position: absolute;
		left: 100px;
	}
	.reCommentInputBtn{
		position: absolute;
		left: 700px;
	}
	.table{
		margin-left: 5px;
	}
	.col-md-6{
		padding-left: 0px;
	}
	.col-md-5{
		padding-left: 50px;
	}
	#slider1_container{
		border-radius: 10px;
	}
	.btn btn-default btn-sm reReply{
		background-color: white;
	}	
	.btn btn-default btn-sm delReReply{
		background-color: white;
	}	
	.btn btn-default btn-sm onReReply{
		background-color: white;
	}
	.noneDelReReply{
		height: 30px;
		border: 0px;
	}
	
	.btn-warning{
		border: #FF6600 1px solid; 
		background-color: #FF6600;
	}
	.btn-warning:HOVER{
		background-color: #EE9A00;
	}
	
</style>
<script type="text/javascript">

$(function(){

	$("#userUniv").hide();
	$("#productNumTR").hide();
	/* $("#addWishDiv").hide();
	$("#deleteWishDiv").hide(); */

	$("#deleteBtn").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
		$.getJSON("delete_product_by_num.do",
				{"product_num":$("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						alert("삭제되었습니다.")
						location.reload();
					}else{
						alert("상품삭제에 실패하였습니다.");
					}
				});	
		}
	});
	
	$.getJSON("find_univ_name.do", {
		"univ_code":$("#univCode").text()
	}, function(jsonOBJ){
		if(jsonOBJ.status){
			$("#userUniv").show();
			$("#univCode").hide();
			$("#univName").text(jsonOBJ.userUniv.univ_name);
			$("#univlogo").attr("width", "20px").attr("height", "20px").attr("src", "images/univ_logo/"+jsonOBJ.userUniv.univ_img);
		}else{
			$("#userUniv").show();
			$("#userUniv").text("");
		}
	});

	var product_num = "${product.product_num}"
	$.getJSON("wish_check.do", {
		"product_num":product_num
	}, function(jsonOBJ){
		if(jsonOBJ.status){
			$("#deleteWishDiv").show();
			$("#addWishDiv").hide();
		}else{
			$("#addWishDiv").show();
			$("#deleteWishDiv").hide();
		}
	});
	
});	

</script>
</head>
<body style="background-color: black;">
<div style="position:absolute; background-color:white; height: 700px; width: 900px; x-overflow:scroll; y-overflow:hidden;">
			
<!-- 상품모달시작 -->

		<div class="panel-body" style="margin-left: 30px;">
			<span><h4 style="font-weight: bold;">PRODUCT DETAIL</h4></span>
			<span><h6 style="font-weight: bold;">상품 상세정보</h6></span>
			<hr style="border-style: ridge;"/>
	    	<button type="button" class="close" style="position: absolute; top: 7px; right: 35px; color: black;">&times;</button>
   		</div> 
   		
    	<div class="panel-body">
		<!-- 이미지부분 -->
		<div class="col-md-6">
		
<script>
        jssor_slider1_starter = function (containerId) {
            var options = {
                $AutoPlay: false,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $SlideDuration: 1000,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $DragOrientation: 0,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $Loop: 2,                                       //[Optional] Enable loop(circular) of carousel or not, 0: stop, 1: loop, 2 rewind, default value is 1
                    $SpacingX: 3,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 3,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 6,                              //[Optional] Number of pieces to display, default value is 1
                    /* $ParkingPosition: 204, */                          //[Optional] The offset position to park thumbnail,

                    $ArrowNavigatorOptions: {
                        $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                        $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                        $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                        $Steps: 6                                       //[Optional] Steps to go for each navigation request, default value is 1
                    }
                }
            };

            var jssor_slider1 = new $JssorSlider$(containerId, options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    jssor_slider1.$SetScaleWidth(Math.min(parentWidth, 720));
                else
                    $JssorUtils$.$Delay(ScaleSlider, 30);
            }

            ScaleSlider();
            $JssorUtils$.$AddEvent(window, "load", ScaleSlider);


            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $JssorUtils$.$OnWindowResize(window, ScaleSlider);
            }

            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
            //    $JssorUtils$.$AddEvent(window, "orientationchange", ScaleSlider);
            //}
            //responsive code end
        };
    </script>
    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles (except 'top', 'left', 'width' and 'height') to css file or css block. -->

    
    <div id="slider1_container" style="position: relative; width: 500px; height: 500px; overflow: hidden;">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px; cursor:pointer;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
        <div u="slides" style="cursor: pointer; position: absolute; left: 50px; top: 0px; width: 450px; height: 450px;
            overflow: hidden; border-radius:7px">
         
         <c:forEach items="${product.imgList}" var="img">
			<c:if test="${img.img_main eq '1'}">
				 <div>
				     <img u="image" alt="" src="${pageContext.request.contextPath}/images/${img.img}" class="expansion"/>
				     <img u="thumb" alt="" src="${pageContext.request.contextPath}/images/${img.img}"/>
				 </div>
			</c:if>	
		 </c:forEach> 
			              
		 <c:forEach items="${product.imgList}" var="img">
			<c:choose>
			  <c:when test="${img.img_main eq '1'}">
			  </c:when>	
			  <c:otherwise>
				 <div>
					 <img u="image" alt="" src="${pageContext.request.contextPath}/images/${img.img}" class="expansion"/>
					 <img u="thumb" alt="" src="${pageContext.request.contextPath}/images/${img.img}"/>
				 </div>
			  </c:otherwise>
			</c:choose>
		 </c:forEach>     
            
        </div>
        
        <!-- Thumbnail Navigator Skin Begin -->
        <div u="thumbnavigator" class="jssort07" style="position: absolute; width: 450px; height: 100px; left:50px; bottom: 50px;">
            <div style=" background-color: #000; filter:alpha(opacity=30); opacity:.3; width: 100%; height:100%; border-radius:7px;"></div>
            <!-- Thumbnail Item Skin Begin -->
            <style>
                /* jssor slider thumbnail navigator skin 07 css */
                /*
                .jssort07 .p            (normal)
                .jssort07 .p:hover      (normal mouseover)
                .jssort07 .pav          (active)
                .jssort07 .pav:hover    (active mouseover)
                .jssort07 .pdn          (mousedown)
                */
                .jssort07 .i {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    width: 99px;
                    height: 66px;
                    filter: alpha(opacity=80);
                    opacity: .8;
                }

                .jssort07 .p:hover .i, .jssort07 .pav .i {
                    filter: alpha(opacity=100);
                    opacity: 1;
                }

                .jssort07 .o {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    width: 97px;
                    height: 64px;
                    border: 1px solid #000;
                    transition: border-color .6s;
                    -moz-transition: border-color .6s;
                    -webkit-transition: border-color .6s;
                    -o-transition: border-color .6s;
                }

                * html .jssort07 .o {
                    /* ie quirks mode adjust */
                    width /**/: 99px;
                    height /**/: 66px;
                }

                .jssort07 .pav .o, .jssort07 .p:hover .o {
                    border-color: #fff;
                }

                .jssort07 .pav:hover .o {
                    border-color: #0099FF;
                }

                .jssort07 .p:hover .o {
                    transition: none;
                    -moz-transition: none;
                    -webkit-transition: none;
                    -o-transition: none;
                }
            </style>
            <div u="slides" style="cursor: pointer;">
                <div u="prototype" class="p" style="POSITION: absolute; WIDTH: 99px; HEIGHT: 66px; TOP: 0; LEFT: 0;">
                    <thumbnailtemplate class="i" style="position:absolute;"></thumbnailtemplate>
                    <div class="o">
                    </div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
            <!-- Arrow Navigator Skin Begin -->
            <style>
                    /* jssor slider arrow navigator skin 11 css */
                    /*
                .jssora11l              (normal)
                .jssora11r              (normal)
                .jssora11l:hover        (normal mouseover)
                .jssora11r:hover        (normal mouseover)
                .jssora11ldn            (mousedown)
                .jssora11rdn            (mousedown)
                */
                    .jssora11l, .jssora11r, .jssora11ldn, .jssora11rdn {
                        position: absolute;
                        cursor: pointer;
                        display: block;
                        overflow: hidden;
                    }

                    .jssora11l {
                        background-position: -11px -41px;
                    }

                    .jssora11r {
                        background-position: -71px -41px;
                    }

                    .jssora11l:hover {
                        background-position: -131px -41px;
                    }

                    .jssora11r:hover {
                        background-position: -191px -41px;
                    }

                    .jssora11ldn {
                        background-position: -251px -41px;
                    }

                    .jssora11rdn {
                        background-position: -311px -41px;
                    }
            </style>
            <!-- Arrow Left -->
            <span u="arrowleft" class="jssora11l" style="width: 37px; height: 37px; top: 123px; left: 8px;">
            </span>
            <!-- Arrow Right -->
            <span u="arrowright" class="jssora11r" style="width: 37px; height: 37px; top: 123px; right: 8px">
            </span>
            <!-- Arrow Navigator Skin End -->
        </div>
        <script>
            jssor_slider1_starter('slider1_container');
        </script>

    </div>
    <!-- Jssor Slider End -->
		<c:choose>
			<c:when test="${user == null }">
				
			</c:when>
			<c:when test="${product.user_id == user.user_id}">
			
				<div class="row3" id="yesMyProduct" style="position: relative;">
					<div class="col-md-6" id="modifyProductDiv" style="position: absolute; right: 251px;">
						<a href="product_modify.do?product_num=${product.product_num }">
						<button class="detail_btn btn-warning btn-sm" id="modifyBtn"><i class="large edit icon"></i>수정하기</button>
				  		</a>
				    </div>
				    <div class="col-md-6" id="deleteProductDiv" style="position: absolute; right: 149px;">
						<button class="detail_btn btn-warning btn-sm" id="deleteBtn"><i class="large trash basic icon"></i>삭제하기</button>
					</div>
				</div>			
				
			</c:when>
			<c:otherwise>
			
				<div class="row3" id="notMyProduct">
					<span>
						<button class="btn btn-warning btn-sm" id="request" data-toggle="tooltip" data-placement="bottom" title="판매자에게 구매요청을 보냅니다."><i class="large empty heart icon"></i>구매 요청</button>
					</span>&nbsp;
					<span id="addWishDiv">
						<button class="btn btn-warning btn-sm" id="addWishlist" data-toggle="tooltip" data-placement="bottom" title="해당상품을 위시리스트에 담습니다."><i class="large gift basic icon"></i>위시리스트 담기</button>
					</span>&nbsp;
					<span id="deleteWishDiv">
						<button class="btn btn-warning btn-sm" id="deleteWishlistBtn" data-toggle="tooltip" data-placement="bottom" title="위시리스트에서 삭제합니다"><i class="large trash basic icon"></i>위시리스트에서 삭제</button>
					</span>
				</div>
			
			</c:otherwise>	
			</c:choose>
			<style>
				.detail_btn{
					background-color: #FF6600;
					border: 1px solid #FF6600;
				}
				.detail_btn:HOVER {
					background-color: #F29661;
				}
			</style>


		</div>
		<!-- 정보부분 -->
		<div class="col-md-5">
			<!-- <button type="button" class="close" style="position: absolute; top: 0; right: 0;">&times;</button> -->
			<table class="table">
				<tr class="active">
					<td colspan="2" align="center" style="font-weight: bold;">판매자 정보</td>
				</tr>
					<!-- 설정해야함 -->
						<tr>
							
							<td id="userUniv">
								<span id="univCode">${product.user.univ_code }</span>
								<img id="univlogo">
								<span id="univName"></span>
							</td>				
							<td id="user_id" class="dropdown">
									
									  <c:choose>
										<c:when test="${product.user_id == user.user_id}">
										</c:when>
										<c:otherwise>${product.user.user_name }
										(<span>
											  <a href="#" class="dropdown-toggle" data-toggle="dropdown">${product.user_id }<b class="caret"></b></a>
									          <ul class="dropdown-menu">
									           <li><a id="seller_info" user_id="${product.user_id}" style="background-color: white;" class="btn btn-sm" data-toggle="tooltip" data-placement="right" title="사용자의 샵으로 이동합니다."><i class="large book basic icon"></i>상세정보</a></li>
											   <li><a id="sendMsg" receiver="${product.user_id}" style="background-color: white;" class="btn btn-sm" data-toggle="tooltip" data-placement="right" title="사용자에게 쪽지를 발송합니다."><i class="large mail outline icon"></i>쪽지보내기</a></li>
									          </ul>
										  </span>)
										</c:otherwise>
									   </c:choose>	
							</td>
						</tr> 
						<tr id="productNumTR">
							<td>상품번호</td>
							<td id="product_num">${product.product_num }</td>
						</tr>	
			</table>
			<table class="table">
				<tr class="active">
					<td colspan="2" align="center" style="font-weight: bold;">상품 정보</td>
				</tr>
				<tr>
					<td>희망가격</td>
					<td id="productPrice"><fmt:formatNumber value="${product.product_price }" pattern="#,###" />원</td>
				</tr>
				<tr>
					<td>스퀘어</td>
					<td id="productSquare"><img src="images/square/${product.square_num }.png" width="100px;" height="100px;"></td>
				</tr>
				<tr>
					<!-- 설정해야함 -->
					   <td id="productContent" colspan="2">${product.product_content}</td>
				</tr>
			</table>
			
			
			<table class="table table-striped" id="privateInfo" style="display: none;">
					<tr class="active">
						<td colspan="2" style="font-weight: bold;">연락처정보</td>
					</tr>
						<!-- 설정해야함 -->
					<tr>
	 					   <td>전화번호</td>
	 					   <td id="userPhone">${product.user.user_phone }</td>
					</tr>
			</table>

		</div>
	</div>
	<br/><br/><br/>
	
	<div class="panel-body">
		<div class="col-md-12">
			<h5>C O M M E N T S</h5>
			<div id="commentListDiv">
				<c:forEach items="${product.cmtList}" var="cmt" varStatus="status">
				<ul class="cmt_list">

					<li class="userCmtLI">
						<span class="cmtuserId" style="float:left; font-weight: bold;">${cmt.user_id}</span>
						<span class="cmtContent" style="float:left">${cmt.cmt_content}</span>
						<span class="cmtDate" style="float:left; font-size: 10px; margin-top: 3px;">(${cmt.cmt_date})</span>
						<span class="btn btn-default btn-sm del" target="${cmt.cmt_num}" style="background-color: white; border-color: #8C8C8C;"><img src="${pageContext.request.contextPath}/images/recycleBin.jpg" width="15px;" height="18px;"/></span> 
						<span class="btn btn-default btn-sm reReply" style="background-color: white; border-color: #8C8C8C;">▼</span>
					</li>
									
					<ul class="reCmt_list" style="line-height: 15px;">
					</ul>

					<li style="display: none;">
						<div class="reCommentWrite">
							<input style="width: 600px;" type="text" class="form-control reCommentInput" name="cmt_content" align="center" 
							placeholder="댓글의 댓글을 작성하세요.">
							<button class="btn btn-default reCommentInputBtn" type="button" target="${cmt.cmt_num }" style="background-color: white; border-color: #8C8C8C;"><img src="${pageContext.request.contextPath}/images/write.jpg" width="15px;" height="18px;"/></button>
						</div>	
					</li>
				</ul>
				</c:forEach>
			</div>	
			<div id="commentWrite">
				<input style="width: 720px;" type="text" class="form-control" name="cont" align="center" placeholder="댓글을 작성하세요." id="commentInput">
				<button class="btn btn-default" type="button" id="commentInputBtn" style="background-color: white; border-color: #8C8C8C;"><img src="${pageContext.request.contextPath}/images/write.jpg" width="15px;" height="18px;"/></button>
			</div>
			<br/><br/><br/>
		</div>
	</div>
	
 </div>
 		
<script type="text/javascript">

$(function() {
	/* 이미지 수정 함*/
	$("img[u=image]").css("-webkit-transform","");
	
	var where;
	var product_num = $("#product_num").text();
	/*댓글의댓글보기버튼 두번째 누를때*/
	$("body").on("click", "span.onReReply", function(){
		$(this).parent("li").next("ul").children("li").remove();
		$(this).parent("li").next("ul").hide();
		$(this).parent("li").next("ul").next("li").hide();
		$(this).attr("class", "btn btn-default btn-sm reReply");
	});
	
	/* 댓글의 댓글보기버튼 */
    $("body").on("click", "span.reReply", function(){
		where = $(this);
		$(this).parent("li").next("ul").show();
		$(this).parent("li").next("ul").children("li").remove();
		$(this).parent("li").next("ul").next("li").show();
		$(this).attr("class", "btn btn-default btn-sm onReReply");
		
		$.post("reReply_list.do", 
				{"cmt_num":$(this).parent("li").children("span:nth-child(4)").attr("target")},
				function(jsonOBJ){
					if(jsonOBJ.status){
						$(jsonOBJ.reCmtList).each(function(index, item){					
		
								var span1 = $("<span/>").attr("style", "float:left; margin-top:7px; font-weight: bold;").attr("class", "cmtuserId").text( item.user_id );
								var span2 = $("<span/>").attr("style", "float:left; margin-top:7px; margin-left:10px;").attr("class", "cmtContent").text( item.cmt_content );
								var span3 = $("<span/>").attr("style", "float:left; margin-top:9px; font-size: 10px; margin-left:10px;").attr("class", "cmtDate").text( item.cmt_date ).attr("font-size", "10px");
								var image1 = $("<img/>").attr("src", "${pageContext.request.contextPath}/images/recycleBin.jpg").attr("width", "15px").attr("height", "18px");
								var span4 = $("<span/>").attr("class", "btn btn-default btn-sm delReReply").attr("target", item.cmt_num).append(image1).attr("style", "margin-left:10px; background-color: white; border-color: #8C8C8C;");
								var li = $("<li/>").attr("class", "userReCmtLI").attr("vertical-align", "middle").append(span1, span2, span3, span4);
								$(where).parent("li").next("ul").append(li);
							
						});
					}
				}, "json");
	});
	
	/* 댓글의댓글 입력 */				
	$("body").on("click", "button.reCommentInputBtn", function(){
    	$(this).parent("div").parent("li").parent("ul.cmt_list").children("ul.reCmt_list").children("li").remove();
 		where = $(this).parent("div").parent("li").parent("ul.cmt_list").children("ul.reCmt_list");
 		 $.post("cmt_of_cmt_register.do",
				{"cmt_content":$(this).parent("div").find(".reCommentInput").val(), "product_num":$("#product_num").text(),
				 "parent_num":$(this).attr("target")},
				function(jsonOBJ){
					if(jsonOBJ.status){
						$(".reCommentInput").val("");
						$(jsonOBJ.reCmtList).each(function(index, item){
							var span1 = $("<span/>").attr("style", "float:left; margin-top:7px; font-weight: bold;").attr("class", "cmtuserId").text( item.user_id );
							var span2 = $("<span/>").attr("style", "float:left; margin-top:7px; margin-left:10px;").attr("class", "cmtContent").text( item.cmt_content );
							var span3 = $("<span/>").attr("style", "float:left; margin-top:9px; font-size: 10px; margin-left:10px;").attr("class", "cmtDate").text( item.cmt_date );
							var image1 = $("<img/>").attr("src", "${pageContext.request.contextPath}/images/recycleBin.jpg").attr("width", "15px").attr("height", "18px");
							var span4 = $("<span/>").attr("class", "btn btn-default btn-sm delReReply").attr("target", item.cmt_num).append(image1).attr("style", "margin-left:10px; background-color: white; border-color: #8C8C8C;");
							var li = $("<li/>").attr("class", "userReCmtLI").attr("vertical-align", "middle").append(span1, span2, span3, span4);
							$(where).append(li);
						});
					}else{
						alert("댓글의 댓글 등록실패");
					}
				}, "json") 
	});
	
	/* 걍 댓글입력 */
	$("#commentInputBtn").click(function(){
		$.post("cmt_register.do",
				{"cmt_content":$("#commentInput").val(), "product_num":product_num},
			function(jsonOBJ){
				if(jsonOBJ.status){
					$(".cmt_list").remove();
					$("#commentInput").val("");
					$(jsonOBJ.cmtList).each(function(index, item){
						
						var span1 = $("<span/>").attr("style", "float:left; font-weight: bold;").attr("class", "cmtuserId").text( item.user_id );
						var span2 = $("<span/>").attr("style", "float:left").attr("class", "cmtContent").text( item.cmt_content );
						var span3 = $("<span/>").attr("style", "float:left; font-size: 10px; margin-top: 3px;").attr("class", "cmtDate").text( (item.cmt_date) ).attr("font-size", "10px;");
						var image1 = $("<img/>").attr("src", "${pageContext.request.contextPath}/images/recycleBin.jpg").attr("width", "15px").attr("height", "18px");
						var span4 = $("<span/>").attr("class", "btn btn-default btn-sm del").attr("target", item.cmt_num).attr("style", "background-color: white; border-color: #8C8C8C;").append(image1);
						var span5 = $("<span/>").attr("class", "btn btn-default btn-sm reReply").text( "▼" ).attr("style", "background-color: white; border-color: #8C8C8C;");
						var li1 = $("<li/>").attr("class", "userCmtLI").append(span1, span2, span3, span4, span5);
						
						var ul1 = $("<ul/>").attr("class", "reCmt_list").attr("vertical-align", "middle;");
						
						var input1 = $("<input/>").attr("style", "width:600px; type:text;").attr("class", "form-control reCommentInput").attr("name", "cmt_content").attr("align", "center").attr("placeholder", "댓글의 댓글을 작성하세요^_^");
						var button1 = $("<button/>").attr("class", "btn btn-default reCommentInputBtn").attr("type", "button").attr("target", item.cmt_num).text("저장").attr("style", "background-color: white; border-color: #8C8C8C;");
						var div1 = $("<div/>").attr("class", "reCommentWrite").append(input1, button1);
						var li2 = $("<li/>").attr("style", "display: none;").append(div1);
						
						var userCmtLI = $("<ul/>").attr("class", "cmt_list").append(li1, ul1, li2);

						$("#commentListDiv").append(userCmtLI);
					});
				}else{
					alert("댓글등록 실패");
			}
		}, "json");
	});

    $(".dropdown-toggle").dropdown();
    
    /* 부모댓글삭제 */
    $("body").on("click", "span.del", function() {
    	if(confirm("정말 삭제하시겠습니까? 댓글을 삭제하면 하위 댓글도 삭제됩니다.")){
    		
		$(this).parent("li").next("ul").hide();
		$(this).parent("li").next("li").hide();
		$.post("cmt_delete.do",
				{"cmt_num":$(this).attr("target"), "product_num":$("#product_num").text()},
				function(jsonOBJ){
					if(jsonOBJ.status){
						$(".cmt_list").remove();
						$(jsonOBJ.cmtList).each(function(index, item){
							
							var span1 = $("<span/>").attr("style", "float:left; font-weight: bold;").attr("class", "cmtuserId").text( item.user_id );
							var span2 = $("<span/>").attr("style", "float:left").attr("class", "cmtContent").text( item.cmt_content );
							var span3 = $("<span/>").attr("style", "float:left; font-size: 10px; margin-top: 3px;").attr("class", "cmtDate").text( (item.cmt_date) ).attr("font-size", "10px;");
							var image1 = $("<img/>").attr("src", "${pageContext.request.contextPath}/images/recycleBin.jpg").attr("width", "15px").attr("height", "18px");
							var span4 = $("<span/>").attr("class", "btn btn-default btn-sm del").attr("target", item.cmt_num).attr("style", "background-color: white; border-color: #8C8C8C;").append(image1);
							var span5 = $("<span/>").attr("class", "btn btn-default btn-sm reReply").text( "▼" ).attr("style", "background-color: white; border-color: #8C8C8C;");
							var li1 = $("<li/>").attr("class", "userCmtLI").append(span1, span2, span3, span4, span5);
							
							var ul1 = $("<ul/>").attr("class", "reCmt_list").attr("vertical-align", "middle");
							
							var input1 = $("<input/>").attr("style", "width:600px; type:text;").attr("class", "form-control reCommentInput").attr("name", "cmt_content").attr("align", "center").attr("placeholder", "댓글의 댓글을 작성하세요^_^");
							var button1 = $("<button/>").attr("class", "btn btn-default reCommentInputBtn").attr("type", "button").attr("target", item.cmt_num).text("저장").attr("style", "background-color: white; border-color: #8C8C8C;");
							var div1 = $("<div/>").attr("class", "reCommentWrite").append(input1, button1);
							var li2 = $("<li/>").attr("style", "display: none;").append(div1);
							
							var userCmtLI = $("<ul/>").attr("class", "cmt_list").append(li1, ul1, li2);

							$("#commentListDiv").append(userCmtLI);
						});
					}
				}, "json");
    	}
    	
	});
    
    /* 자식댓글삭제 */
    $("body").on("click", "span.delReReply", function() {      
    
		var parent_num = $(this).parent("li").parent("ul").parent("ul.cmt_list").children("li.userCmtLI").children("span:nth-child(4)").attr("target"); 
    	where = $(this).parent("li").parent("ul").parent("ul.cmt_list").children("ul.reCmt_list");
    	$(this).parent("li").parent("ul").parent("ul.cmt_list").children("ul.reCmt_list").children("li").remove();
		
    	$.post("reCmt_delete.do",
				{"cmt_num":$(this).attr("target"), "product_num":$("#product_num").text(),
				"parent_num":parent_num},
				function(jsonOBJ){
					if(jsonOBJ.status){
						$(jsonOBJ.reCmtList).each(function(index, item){
							
							var span1 = $("<span/>").attr("style", "float:left; margin-top:7px; font-weight: bold;").attr("class", "cmtuserId").text( item.user_id );
							var span2 = $("<span/>").attr("style", "float:left; margin-top:7px; margin-left:10px;").attr("class", "cmtContent").text( item.cmt_content );
							var span3 = $("<span/>").attr("style", "float:left; margin-top:9px; font-size: 10px; margin-left:10px;").attr("class", "cmtDate").text( item.cmt_date );
							var image1 = $("<img/>").attr("src", "${pageContext.request.contextPath}/images/recycleBin.jpg").attr("width", "15px").attr("height", "18px");
							var span4 = $("<span/>").attr("class", "btn btn-default btn-sm delReReply").attr("target", item.cmt_num).append(image1).attr("style", "margin-left:10px; background-color: white; border-color: #8C8C8C;");
							var li = $("<li/>").attr("class", "userReCmtLI").attr("vertical-align", "middle").append(span1, span2, span3, span4);
							$(where).append(li);
							
						});
					}else{
						alert("댓글 삭제 실패");
					}
				}, "json");
	});
})

</script>
</body>
</html>