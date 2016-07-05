<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/imagesloaded.pkgd.js"></script>
<script src="js/classie.js"></script>
<!-- 기본적으로 제이쿼리 말구 masonry랑 이미지로디드 필요함  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.box {
	border: 1px solid black; margin : 5px;
	padding: 5px;
	float: left;
	border-radius: 5px;
	margin: 5px;
}
/* 이미지 퍼센트로~ */
.col3 {
	width: 30%;
}
.box img {
	display: block;
	width: 100%;
}
</style>
</head>
<body>
<div id="container">
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039951/" title="Stanley by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039951_3a47ccd509.jpg" alt="Stanley"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039885/" title="Officer by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4131/5013039885_0d16ac87bc.jpg" alt="Officer"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039583/" title="Tony by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4086/5013039583_26717f6e89.jpg" alt="Tony"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646070/" title="Kendra by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4146/5013646070_f1f44b1939.jpg" alt="Kendra"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039541/" title="Giraffe by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4144/5013039541_17f2579e33.jpg" alt="Giraffe"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039741/" title="Gavin by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4153/5013039741_d860fb640b.jpg" alt="Gavin"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039697/" title="Anita by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039697_a15e41fcd8.jpg" alt="Anita"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646314/" title="Take My Portrait by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4124/5013646314_c7eaf84918.jpg" alt="Take My Portrait"></a>
    </div>
  
    <div class="box col3" >
      <a href="http://www.flickr.com/photos/nemoorange/5013040075/" title="Wonder by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4089/5013040075_bac12ff74e.jpg" alt="Wonder"></a>
    </div>
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039951/" title="Stanley by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039951_3a47ccd509.jpg" alt="Stanley"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039885/" title="Officer by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4131/5013039885_0d16ac87bc.jpg" alt="Officer"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039583/" title="Tony by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4086/5013039583_26717f6e89.jpg" alt="Tony"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646070/" title="Kendra by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4146/5013646070_f1f44b1939.jpg" alt="Kendra"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039541/" title="Giraffe by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4144/5013039541_17f2579e33.jpg" alt="Giraffe"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039741/" title="Gavin by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4153/5013039741_d860fb640b.jpg" alt="Gavin"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039697/" title="Anita by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039697_a15e41fcd8.jpg" alt="Anita"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646314/" title="Take My Portrait by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4124/5013646314_c7eaf84918.jpg" alt="Take My Portrait"></a>
    </div>
  
    <div class="box col3" >
      <a href="http://www.flickr.com/photos/nemoorange/5013040075/" title="Wonder by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4089/5013040075_bac12ff74e.jpg" alt="Wonder"></a>
    </div>
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039951/" title="Stanley by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039951_3a47ccd509.jpg" alt="Stanley"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039885/" title="Officer by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4131/5013039885_0d16ac87bc.jpg" alt="Officer"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039583/" title="Tony by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4086/5013039583_26717f6e89.jpg" alt="Tony"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646070/" title="Kendra by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4146/5013646070_f1f44b1939.jpg" alt="Kendra"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039541/" title="Giraffe by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4144/5013039541_17f2579e33.jpg" alt="Giraffe"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039741/" title="Gavin by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4153/5013039741_d860fb640b.jpg" alt="Gavin"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039697/" title="Anita by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039697_a15e41fcd8.jpg" alt="Anita"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646314/" title="Take My Portrait by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4124/5013646314_c7eaf84918.jpg" alt="Take My Portrait"></a>
    </div>
  
    <div class="box col3" >
      <a href="http://www.flickr.com/photos/nemoorange/5013040075/" title="Wonder by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4089/5013040075_bac12ff74e.jpg" alt="Wonder"></a>
    </div>
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039951/" title="Stanley by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039951_3a47ccd509.jpg" alt="Stanley"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039885/" title="Officer by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4131/5013039885_0d16ac87bc.jpg" alt="Officer"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039583/" title="Tony by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4086/5013039583_26717f6e89.jpg" alt="Tony"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646070/" title="Kendra by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4146/5013646070_f1f44b1939.jpg" alt="Kendra"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039541/" title="Giraffe by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4144/5013039541_17f2579e33.jpg" alt="Giraffe"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039741/" title="Gavin by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4153/5013039741_d860fb640b.jpg" alt="Gavin"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039697/" title="Anita by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039697_a15e41fcd8.jpg" alt="Anita"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646314/" title="Take My Portrait by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4124/5013646314_c7eaf84918.jpg" alt="Take My Portrait"></a>
    </div>
  
    <div class="box col3" >
      <a href="http://www.flickr.com/photos/nemoorange/5013040075/" title="Wonder by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4089/5013040075_bac12ff74e.jpg" alt="Wonder"></a>
    </div>
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039951/" title="Stanley by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039951_3a47ccd509.jpg" alt="Stanley"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039885/" title="Officer by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4131/5013039885_0d16ac87bc.jpg" alt="Officer"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039583/" title="Tony by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4086/5013039583_26717f6e89.jpg" alt="Tony"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646070/" title="Kendra by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4146/5013646070_f1f44b1939.jpg" alt="Kendra"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039541/" title="Giraffe by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4144/5013039541_17f2579e33.jpg" alt="Giraffe"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039741/" title="Gavin by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4153/5013039741_d860fb640b.jpg" alt="Gavin"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039697/" title="Anita by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039697_a15e41fcd8.jpg" alt="Anita"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646314/" title="Take My Portrait by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4124/5013646314_c7eaf84918.jpg" alt="Take My Portrait"></a>
    </div>
  
    <div class="box col3" >
      <a href="http://www.flickr.com/photos/nemoorange/5013040075/" title="Wonder by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4089/5013040075_bac12ff74e.jpg" alt="Wonder"></a>
    </div>
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039951/" title="Stanley by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039951_3a47ccd509.jpg" alt="Stanley"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039885/" title="Officer by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4131/5013039885_0d16ac87bc.jpg" alt="Officer"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039583/" title="Tony by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4086/5013039583_26717f6e89.jpg" alt="Tony"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646070/" title="Kendra by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4146/5013646070_f1f44b1939.jpg" alt="Kendra"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039541/" title="Giraffe by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4144/5013039541_17f2579e33.jpg" alt="Giraffe"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039741/" title="Gavin by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4153/5013039741_d860fb640b.jpg" alt="Gavin"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013039697/" title="Anita by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4113/5013039697_a15e41fcd8.jpg" alt="Anita"></a>
    </div>
  
    <div class="box col3">
      <a href="http://www.flickr.com/photos/nemoorange/5013646314/" title="Take My Portrait by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4124/5013646314_c7eaf84918.jpg" alt="Take My Portrait"></a>
    </div>
  
    <div class="box col3" >
      <a href="http://www.flickr.com/photos/nemoorange/5013040075/" title="Wonder by Dave DeSandro, on Flickr"><img src="http://farm5.static.flickr.com/4089/5013040075_bac12ff74e.jpg" alt="Wonder"></a>
    </div>
</div>
	<script type="text/javascript">
		$(function() {
			/* 코드는 이게 끝!! */
			var $container = $('#container');
			$container.imagesLoaded(function() {
				$container.masonry({
					itemSelector : '.box'
				});
			});

		});
	</script>
</body>
</html>