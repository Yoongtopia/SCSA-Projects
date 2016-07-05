<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/jssor.core.js"></script>
<script type="text/javascript" src="./js/jssor.utils.js"></script>
<script type="text/javascript" src="./js/jssor.slider.js"></script>
<script type="text/javascript" src="./js/jquery-1.11.1.min.js"></script>

	<style type="text/css">
		ul > li {
			list-style: none;
		}
		
		img.user_head{
			width: 10px;
			height: 100%;
			margin-right: 5px;
		}
		
	/* 	ul.cmt_list > li{
			height: 30px;
			width: 500px;
			margin-top: 5px;
			margin-bottom: 5px;
			line-height: 25px;
			border-bottom: 1px solid rgba(0, 0, 0, .15);
		}
		ul.cmt_list > li > span{
			float: right;
			margin-right: 10px;
		}
		ul.cmt_list{
			
		} */
		
		#notMyProduct{
			position: absolute;
			left: 100px;
		}
		#yesMyProduct{
			position: absolute;
			left: 180px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$("#request").click(function(){
				var request = confirm("판매자에게 구매요청을 보냅니다.");
				if (request) {
					$("#privateInfo").css("display","block");
				}
			});
		});

	</script>
	
</head>
<body style="background-color: black;">
<c:import url="m_menu.jsp"></c:import>
<div align="center" style="position:absolute; background-color:white; height: 700px; width: 100%; overflow:scroll">
			
<!-- 상품모달시작 -->
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
    <div style="width: 100%">
    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles (except 'top', 'left', 'width' and 'height') to css file or css block. -->
    <div id="slider1_container" style="position: relative; width: 500px; height: 500px; overflow: hidden;">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(./img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 500px; height: 500px;
            overflow: hidden;">
         
         <c:forEach items="${product.imgList}" var="img">
			<c:if test="${img.img_main eq '1'}">
				 <div>
				     <img u="image" alt="" src="${pageContext.request.contextPath}/images/${img.img}"/>
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
					 <img u="image" alt="" src="${pageContext.request.contextPath}/images/${img.img}"/>
					 <img u="thumb" alt="" src="${pageContext.request.contextPath}/images/${img.img}"/>
				 </div>
			  </c:otherwise>
			</c:choose>
		 </c:forEach>     
            
        </div>
        
        <!-- Thumbnail Navigator Skin Begin -->
        <div u="thumbnavigator" class="jssort07" style="position: absolute; width: 500px; height: 100px; left:0px; bottom: 0px;">
            <div style=" background-color: #000; filter:alpha(opacity=30); opacity:.3; width: 100%; height:100%;"></div>
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
            <div u="slides" style="cursor: move;">
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
                        background: url(./img/a09.png) no-repeat;
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
			
			
		</div>
	</div>
	<br/>
		<!-- 정보부분 -->
		<div class="col-md-6">

			<table class="table table-striped">
				<tr class="active">
					<td colspan="2"><b>상품정보</b></td>
				</tr>
				<tr>
					<!-- 설정해야함 -->
				   <td id="productContent" colspan="2">${product.product_content}</td>
				</tr>
				<tr>
					<td>구역번호</td>
					<td>${product.square_num }</td>
				</tr>
				<tr>
					<td>희망가격</td>
					<td id="productPrice"><fmt:formatNumber value="${product.product_price }" pattern="#,###" />원</td>
				</tr>
			</table>
			
			<table class="table table-striped">
				<tr class="active">
					<td colspan="2"><b>판매자정보</b>				
					</td>
				</tr>
					<!-- 설정해야함 -->
						<tr>
							<td>아이디</td>
							<td id="user_id" class="dropdown">
									
									  <c:choose>
										<c:when test="${product.user_id == user.user_id}">
											(내가 등록한 상품)
										</c:when>
										<c:otherwise>
											<%-- <ul>
												<li><a id="seller_info" user_id="${product.user_id}" class="btn btn-warning btn-sm" data-toggle="tooltip" data-placement="right" title="사용자의 샵으로 이동합니다."><i class="large book basic icon"></i>상세정보</a></li>
												<li><a id="sendMsg" receiver="${product.user_id}" class="btn btn-warning btn-sm" data-toggle="tooltip" data-placement="right" title="사용자에게 쪽지를 발송합니다."><i class="large mail outline icon"></i>쪽지보내기</a></li>
											</ul> --%>
										  ${product.user_id }

										</c:otherwise>
									   </c:choose>	
									   
							</td>
						</tr>
						<tr>
							<td>판매자이름</td>
							<td id="userName">${product.user.user_name }</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td id="userUniv">${product.user.user_email }</td>
						</tr>
			</table>
			<div id="privateInfo" style="display: none;">
			<table class="table table-striped">
					<tr class="active">
						<td colspan="2"><b>연락처정보</b></td>
					</tr>
					<tr>
	 					   <td>전화번호</td>
	 					   <td id="userPhone"><a href="tel:${product.user.user_phone }">${product.user.user_phone }</a></td>
					</tr>
			</table>
			</div>
			<c:choose>
			<c:when test="${product.user_id == user.user_id}">
			
		
				
			</c:when>
			<c:otherwise>
			
		
				<div class="col-md-4" style="width: 100%" align="center">
					<button class="btn btn-warning btn-sm" id="request" title="판매자에게 구매요청을 보냅니다."><i class="large cart basic icon"></i>구매요청</button>
				</div>
	
			
			</c:otherwise>	
			</c:choose>
		</div>
	</div>
	
	<hr/>
	<div style="width:100%; padding-bottom: 10px;">
		<c:forEach items="${product.cmtList}" var="cmt">
			
				<img class="user_head" src=images/user.png>
				<font color="lightgray">${cmt.user_id}</font> 
				${cmt.cmt_content}
		</c:forEach>
	</div>
	
	
 </div>		
<script type="text/javascript">
$(document).ready(function(){
    $(".dropdown-toggle").dropdown();
});  
</script>
</body>
</html>