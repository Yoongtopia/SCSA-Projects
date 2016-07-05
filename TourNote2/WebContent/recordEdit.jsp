<%@page import="com.scsa.wapl.entity.Photo"%>
<%@page import="java.util.List"%>
<%@page import="com.scsa.wapl.entity.TravelSpot"%>
<%@page import="com.scsa.wapl.entity.TravelRecord"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

<title>TOUR NOTE</title>

<link rel="stylesheet" type="text/css" href="./css/buttonDefault.css" />
<link rel="stylesheet" type="text/css" href="./css/buttonComponent.css" />
<style>
   @font-face {
  font-family: 'Nanum Gothic';
  font-style: normal;
  font-weight: 700;
  src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.eot);
  src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.eot?#iefix) format('embedded-opentype'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.woff2) format('woff2'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.woff) format('woff'),
       url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Bold.ttf) format('truetype');
  }
  @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 400;
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.eot);
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.eot?#iefix) format('embedded-opentype'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.woff2) format('woff2'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.woff) format('woff'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-Regular.ttf) format('truetype');
  }
  @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 800;
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.eot);
    src: url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.eot?#iefix) format('embedded-opentype'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.woff2) format('woff2'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.woff) format('woff'),
         url(//themes.googleusercontent.com/static/fonts/earlyaccess/nanumgothic/v3/NanumGothic-ExtraBold.ttf) format('truetype');
  }
</style>
<script src="//code.jquery.com/jquery.js"></script>
<script src="./js/buttonModernizr.custom.js"></script>
<script src="./js/buttonClassie.js"></script>
<script type="text/javascript">

	var searchRecord = function(){
		location.replace("${pageContext.request.contextPath}/findTravelRecordListByKeyword.do?keyword="+$("#keyword").val());
	};
	
	var buttons7Click = Array.prototype.slice.call( document.querySelectorAll( '#btn-click button' ) ),
	totalButtons7Click = buttons7Click.length,
	totalButtons9Click = buttons9Click.length;
	
	buttons7Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
	buttons9Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
	
	function activate() {
		var self = this, activatedClass = 'btn-activated';
	
		if( !classie.has( this, activatedClass ) ) {
			classie.add( this, activatedClass );
			setTimeout( function() { classie.remove( self, activatedClass ) }, 1000 );
		}
	}
</script>

  <link rel="stylesheet" href="./css/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  
  <!-- include libraries BS3 -->
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
   <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
   <script src="js/bootstrap.min.js"></script>
   <link href="css/bootstrap4.css" rel="stylesheet">
   <link href="css/bootstrap2.min.css" rel="stylesheet">

  <!-- include summernote -->
  <link rel="stylesheet" href="./dist/summernote.css">
  <script type="text/javascript" src="./dist/summernote.js"></script>
  <script type="text/javascript" src="./lang/summernote-ko-KR.js"></script>
       
  <link rel="stylesheet" href="./styles/jquery.sliderTabs.css">
  <script type="text/javascript" src="./js/jquery.sliderTabs.js"></script>
  
  <link href="./css/semantic.css" rel="stylesheet">
  <link href="./css/menu.css" rel="stylesheet">
  
  <script src="js/lightbox.js"></script>
  <link href="css/lightbox.css" rel="stylesheet" />
    
<style>
*{ font-family: 'Nanum Gothic';}
 
  #gallery { float: left; width: 65%;  }
  .gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .gallery li h5 { margin: 0 0 0.4em; cursor: move; }
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { width: 100%; cursor: move; }
  .cont li { float: left; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }  
 
  #trash { float: right; width: 32%; min-height: 18em; padding: 1%; }
  #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
  #trash h4 .ui-icon { float: left; }
  #trash .gallery h5 { display: none; }
  
  #btn_submit{margin-left: 340px}
  
.sidenav {
	z-index: 200;
	width: 110px;
	position: absolute;
	top: 35%;
}

.sidenav a {
	display: inline-block;
	width: 50px;
	height: 54px;
	color: white;
	font-size: 18px;
	line-height: 54px;
	text-align: center;
	padding-right: 4px;
	margin-left: 23px;
	position: relative
}

.sidenav a span {
	position: absolute;
	margin-right: -180px;
	left: 55px;
	top: 11px;
	display: block;
	opacity: 0;
	background: white;
	font-size: 14px;
	line-height: 26px;
	padding: 2px 8px 0 8px;
	margin-left: -10px;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	color: #464646;
	-moz-transition: all linear 0.2s;
	-o-transition: all linear 0.2s;
	-webkit-transition: all linear 0.2s;
	transition: all linear 0.2s
}

.sidenav a:hover span {
	opacity: 1;
	margin-left: 5px
}

.sidenav a.btt {
	opacity: 0
}

.sidenav .n1 {
	background: url(img/common/sprite.png) 0 top
}

.sidenav .n2 {
	background: url(img/common/sprite.png) -54px top
}

.sidenav .n3 {
	background: url(img/common/sprite.png) 0 bottom
}

.sidenav .n4 {
	background: url(img/common/sprite.png) -54px bottom
}

.sidenav .n5 {
	background: url(img/common/sprite.png) -108px top
}

.sidenav .n6 {
	background: url(img/common/sprite.png) -108px bottom
}

.sidenav .n1.active,.sidenav .n2.active,.sidenav .n3.active,.sidenav .n4.active,.sidenav .n5.active,.sidenav .n6.active
	{
	background: url(img/common/sprite.png) -604px bottom;
	color: #464646;
	font-weight: bold
}

.sidenav .btt {
	background: url(img/common/sprite.png) -325px top;
	width: 100px;
	height: 65px;
	color: #565454;
	line-height: 20px;
	padding-top: 43px;
	padding-right: 4px;
	padding-left: 3px;
	margin-left: -4px;
	font-size: 16px
}

.sidenav .dpdf {
	background: url(img/common/sprite.png) -432px top;
	width: 68px;
	height: 64px;
	color: #565454;
	margin-left: 18px
}

.sidenav .dpdf span {
	top: 18px;
	left: 65px
}

.sidenav hr {
	width: 65px;
	border: 0;
	border-top: dashed 1px #565454;
	margin: 10px 20px
}

.navbar-left {
    float: left !important;
  }
</style>

<script>

  $(function() {

	  $("#searchRecord").click(searchRecord);

	  
	  var slider = $("#mySliderTabs").sliderTabs({
		  width:800,
	  	  mousewheel: true,
	  	  position: "top"
	  	});

      $('.summernote').summernote({
          height: 500,
          width: 800,
          lang:'ko-KR',
    	  toolbar: [
    	            ['style', ['style']],
    	            ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
    	            ['fontname', ['fontname']],
    	            ['fontsize', ['fontsize']], // Still buggy
    	            ['color', ['color']],
    	            ['para', ['paragraph']],
    	            ['height', ['height']],
    	            ['table', ['table']],
    	            ['insert', ['link', 'video', 'hr']],
    	            ['view', ['codeview']],
    	    	  ]
        });
      
      
      $("#btn_submit").click(edit);
      $("#uploadBtn").click(uploadPhotoForm);
      $("#reset").click(reset);
    	                        
    // there's the gallery and the trash
    var $gallery = $( "#gallery" );
    var $cont = $( "#cont" );
    var $trash = $( ".note-editable" );
    
	<% TravelRecord record=(TravelRecord) request.getAttribute("record"); 
	ArrayList<TravelSpot> spotList=(ArrayList<TravelSpot>) record.getTravelSpotList();
	%>
	 
   	acceptance="";
	for(var i=0;i<=<%=spotList.size()%>;i++){
		if(i==0){
			acceptance="#gallery > li, #cont > li";
		} else {
			acceptance=acceptance+",#gallery"+i+" > li, #cont"+i+"> li";
		}
	}
	
    item_photo="";
	for(var i=0;i<=<%=spotList.size()%>;i++){
		if(i==0){
			item_photo="ul.gallery1 > li";
		} else {
			item_photo=item_photo+",ul.gallery"+i+">li";
 		}
	}

   	accept_cont="";
	for(var i=0;i<=<%=spotList.size()%>;i++){
		if(i==0){
			accept_cont="#cont > li";
		} else {
			accept_cont=accept_cont+",#cont"+i+" > li";
		}
	}
	
    item_cont="";
	for(var i=0;i<=<%=spotList.size()%>;i++){
		if(i==0){
			item_cont="ul.cont1 > li";
		} else {
			item_cont=item_cont+",ul.cont"+i+">li";
 		}
	}
	
    // let the gallery items be draggable
    $( acceptance ).draggable({
      cancel: "a.ui-icon", // clicking an icon won't initiate dragging
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
    
    // let the cont items be draggable
    $( accept_cont ).draggable({
      cancel: "a.ui-icon", // clicking an icon won't initiate dragging
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
 
    // let the trash be droppable, accept ting the gallery items
    $trash.droppable({
      accept:acceptance, 
      activeClass: "ui-state-highlight",
      drop: function( event, ui ) {
          var id = $(ui.draggable).find("img").attr("id");
    	  if (id!=null) {
          var address = $(ui.draggable).find("img").attr("src");
          deleteImage( ui.draggable );
          $("#"+id).attr("src", address).attr("width","100").attr("height","100").appendTo($( ".note-editable" ));
    	  } else {
          var contId = $(ui.draggable).find("div").attr("id");
          var cont = $(ui.draggable).find("div").text();
          deleteText( ui.draggable );
          $("#"+contId).text(cont).appendTo($( ".note-editable" )); 
      	}
      }
    }); 

    // let the gallery be droppable as well, accepting items from the trash
    $gallery.droppable({
      accept: "#trash li",
      activeClass: "custom-state-active",
      drop: function( event, ui ) {
        recycleImage( ui.draggable );
      }
    });
 
     // image deletion function
    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
    function deleteImage( $item ) {
      $item.fadeOut(function() {
        var $list = $( "ul", $gallery ).length ?
           	$( "ul", $trash ) :
          
         $item.find( "a.ui-icon-trash" ).remove();
         $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
          $item
            .animate({ width: "48px" })
            .find( "img" )
              .animate({ height: "36px" });
        });
      });
    }
    
    // image deletion function
    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
    function deleteText( $item2 ) {
      $item2.fadeOut(function() {
        var $list2 = $( "ul", $cont ).length ?
           	$( "ul", $trash ) :
          
         $item2.find( "a.ui-icon-trash" ).remove();
         $item2.append( recycle_icon ).appendTo( $list2 ).fadeIn(function() {
          $item2
            .animate({ width: "48px" })
            .find( "img" )
              .animate({ height: "36px" });
        });
      });
    }
    
    // image recycle function
    var trash_icon = "<a href='link/to/trash/script/when/we/have/js/off' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
    function recycleImage( $item ) {
      $item.fadeOut(function() {
        $item
          .find( "a.ui-icon-refresh" )
            .remove()
          .end()
          .css( "width", "96px")
          .append( trash_icon )
          .find( "img" )
            .css( "height", "72px" )
          .end()
          .appendTo( $gallery )
          .fadeIn();
      });
    }
 
    // image preview function, demonstrating the ui.dialog used as a modal window
    function viewLargerImage( $link ) {
      var src = $link.attr( "href" ),
        title = $link.siblings( "img" ).attr( "alt" ),
        $modal = $( "img[src$='" + src + "']" );
 
      if ( $modal.length ) {
        $modal.dialog( "open" );
      } else {
        var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
          .attr( "src", src ).appendTo( "body" );
        setTimeout(function() {
          img.dialog({
            title: title,
            width: 400,
            modal: true
          });
        }, 1 );
      }
    }
 
	  $(item_photo).click(function( event ) {
	      var $item = $( this ),
	        $target = $( event.target );
	      if ( $target.is( "a.ui-icon-zoomin" ) ) {
	    	 viewLargerImage( $target );	      
	      } 
	      return false;
	    });

       // resolve the icons behavior with event delegation
	  $( item_cont ).click(function( event ) {
	    var $item = $( this ),
	      $target = $( event.target );
	
	    if ( $target.is( "a.ui-icon-trash" ) ) {
	      deleteText( $item );
	    } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
	      viewLargerImage( $target );
	    } else if ( $target.is( "a.ui-icon-refresh" ) ) {
	      recycleImage( $item );
	    }
	    return false;
	  });
    });

	  function edit(){
		  $.post("${pageContext.request.contextPath}/editRecord.do",
		  {"recordNum" : "${record.recordNum}",
		   "recordCont" : $('.summernote').code()
		   },
		function(){
			   location.href="${pageContext.request.contextPath}/selectRecord.do?recordNum=${record.recordNum}"
		   });
	  }
	  
	  function uploadPhotoForm(){
		  location.replace("${pageContext.request.contextPath}/recordEditPhotoUpload.jsp?recordNum=${record.recordNum}&spotNum="+$('#snum').val());
	  }
	  function reset(){
		  location.replace("${pageContext.request.contextPath}/editRecordForm.do?recordNum=${record.recordNum}");
	  }
	  
  </script>
</head>
<body>

	 <nav class="sidenav">   
		 <a href="${pageContext.request.contextPath }#top" class="n1"><img src="./images/mainPage/sideButton1.png" width="40px"/><span>TOP</span></a>
		 <c:choose>
			<c:when test="${sessionScope.member!=null && sessionScope.recordNum!=null }">		 
		 		<a href="${pageContext.request.contextPath }/upload_detail.do#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:when>
   	 		<c:otherwise>
		 		 <a href="${pageContext.request.contextPath }#1" class="n2"><img src="./images/mainPage/sideButton2.png" width="40px"  id="n2"/><span>TRAVEL RECORD</span></a>
		    </c:otherwise>
		</c:choose> 
		 <a href="${pageContext.request.contextPath }#2" class="n1"><img src="./images/mainPage/sideButton3.png" width="40px"/><span>TRAVEL BOARD</span></a> 
		 <a href="${pageContext.request.contextPath }#3" class="n1"><img src="./images/mainPage/sideButton4.png" width="40px"/><span>MY TRAVEL</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_notice.do?boardCategory=notice" class="n1"><img src="./images/mainPage/sideButton5.png" width="40px"/><span>NOTICE</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_category.do?boardCategory=qna" class="n1"><img src="./images/mainPage/sideButton6.png" width="40px"/><span>Q&A</span></a> 
		 <a href="${pageContext.request.contextPath }/board_list_faq.do?boardCategory=faq" class="n1"><img src="./images/mainPage/sideButton7.png" width="40px"/><span>FAQ</span></a> 
   	 </nav>
   	 
<div id="snote" style="margin-left:230px;margin-top: 100px">
<div id="mySliderTabs">
	<ul>
	    <c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status">
	    <li><a href="#tabs-${status.count}">${spotList.spotNum}. ${spotList.spotTitle }<br/><br/>${spotList.spotTime}</a></li>
	    </c:forEach>
 	 </ul>
 <c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status"> 
 	 <div id="tabs-${status.count}">
 	 <div class="ui-widget ui-helper-clearfix">
 	 	<ul id="cont${status.count }" class="cont ui-helper-reset ui-helper-clearfix">
				<li class="ui-widget-content ui-corner-tr">
				<div id="div${status.count}">${spotList.spotCont }</div>
				</li>
		</ul>
		<ul id="gallery${status.count }" class="gallery ui-helper-reset ui-helper-clearfix">
			<c:forEach items="${spotList.photoList}" var="photo" varStatus="status_photo">
				<li class="ui-widget-content ui-corner-tr">
				<img id="photo_${status.count}${status_photo.count}" src="${pageContext.request.contextPath}/image/${photo.photoName}" alt="${photo.photoName }"/>
				<a href="${pageContext.request.contextPath}/image/${photo.photoName}" data-lightbox="image-1" data-title="${photo.photoName}">확대</a>
				</li>
			</c:forEach>
		</ul>		
		</div>
	</div>
</c:forEach>
</div>

<div>
<button id="reset">리셋</button>
<br>
<select id="snum">
 <c:forEach items="${record.travelSpotList }" var="spotList" varStatus="status">
    <option value="${spotList.spotNum}">${spotList.spotNum}. ${spotList.spotTitle }</option>
</c:forEach>
</select>
<button id="uploadBtn">사진추가</button>
</div>
<div>
 <form id="noteForm">
 <textarea class="summernote">
 </textarea>
 <br>
  <input type="button" class="btn btn-default" value="저장" id="btn_submit">
  <a href="${pageContext.request.contextPath }/findRecordListById.do"><button type="button" class="btn btn-default">목록으로</button></a>
  <input type="hidden" name="recordNum" value="${record.recordNum }"/>
</form>
</div>
</div>
</body>
</html>