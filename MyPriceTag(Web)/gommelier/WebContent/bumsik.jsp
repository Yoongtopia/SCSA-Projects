<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html xml:lang="en" lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>Multiple Image</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1">
<link rel="stylesheet" href="http://picoolio.net/lib/Peafowl/peafowl.css">
    <script>document.documentElement.className += " js";(function(w,d,u){w.readyQ=[];w.bindReadyQ=[];function p(x,y){if(x=="ready"){w.bindReadyQ.push(y);}else{w.readyQ.push(x);}};var a={ready:p,bind:p};w.$=w.jQuery=function(f){if(f===d||f===u){return a}else{p(f)}}})(window,document)</script><link rel="stylesheet" href="http://picoolio.net/app/themes/Peafowl/style.css">
<link rel="stylesheet" href="http://picoolio.net/app/themes/Peafowl/custom_hooks/style.css">
<link rel="shortcut icon" href="./images/background/title_logo.png">
</head>

<script>
var devices=["phone","phablet","tablet","laptop","desktop"];window_to_device=function(){var e=[480,768,992,1024,1680],t=[],n="",r=window.innerWidth>0?window.innerWidth:screen.width;for(var i=0;i<devices.length;++i){if(r>=e[i]){t.push(devices[i])}}if(t.length==0)t.push(devices[0]);n=t[t.length-1];for(var i=0;i<devices.length;++i){document.documentElement.className=document.documentElement.className.replace(devices[i],"");if(i==devices.length-1){document.documentElement.className+=" "+n}document.documentElement.className=document.documentElement.className.replace(/\s+/g," ")}if(n=="laptop"||n=="desktop"){var s=document.getElementById("pop-box-mask");if(s!==null){s.parentNode.removeChild(s)}}document.documentElement.click()};window_to_device();$(document).ready(function(){PF.obj.devices=window["devices"];PF.fn.window_to_device=window["window_to_device"]})
</script>



<body id="home" class="fluid ">

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42506744-1', 'picoolio.net');
  ga('send', 'pageview');

</script>
<div id="home-top-bar-placeholder" class="top-bar-placeholder background-black"></div>

<div id="home-cover">
	<div id="home-cover-content" class="c20 fluid-column center-box padding-left-10 padding-right-10">
		<div class="home-buttons"><a data-trigger="anywhere-upload-input" class="btn btn-big red">Upload</a></div>
	</div>
</div>

<div class="content-width">
	
			
	<div id="home-pics-feature" class="filled">
		<div id="content-listing-tabs" class="tabbed-listing">
			<div id="home-pics-feature-overlay"></div>
			
<div id="home-pics" class="tabbed-content content-listing visible" data-action="list" data-list="image" data-params="" data-params-hidden="">
		<div class="pad-content-listing"><div class="list-item c8 gutter-margin-right-bottom privacy-public" data-id="jMR" data-album-id="" data-type="image" data-description="">
	<div class="list-item-image">
		<a href="http://picoolio.net/image/jMR" class="image-container">
			
			<img src="http://picoolio.net/images/2014/05/12/9rxPPtzgNTw.md.jpg" alt="9rxPPtzgNTw.jpg">
		</a>
		<div class="list-item-privacy"><span class="btn-lock icon-eye-blocked"></span></div>
		 
	</div>
</div><div class="list-item c8 gutter-margin-right-bottom privacy-public" data-id="jM0" data-album-id="" data-type="image" data-description="">
	<div class="list-item-image">
		<a href="http://picoolio.net/image/jM0" class="image-container">
			
			<img src="http://picoolio.net/images/2014/05/12/8edfc5e2d3fb4dad1d0c93e9a132709c.md.jpg" alt="8edfc5e2d3fb4dad1d0c93e9a132709c.jpg">
		</a>
		<div class="list-item-privacy"><span class="btn-lock icon-eye-blocked"></span></div>
		 
	</div>
</div><div class="list-item c8 gutter-margin-right-bottom privacy-public" data-id="jMy" data-album-id="" data-type="image" data-description="">
	<div class="list-item-image">
		<a href="http://picoolio.net/image/jMy" class="image-container">
			
			<img src="http://picoolio.net/images/2014/05/12/3sQ9T-2AilA.jpg" alt="3sQ9T-2AilA.jpg">
		</a>
		<div class="list-item-privacy"><span class="btn-lock icon-eye-blocked"></span></div>
		 
	</div>
</div></div>
	</div>

<!--googleoff: index-->

<div data-template="content-listing" class="hidden">
	<div class="pad-content-listing"></div>
	<div class="content-listing-more">
		<button class="btn btn-big grey" data-action="load-more">Load more</button>
	</div>
	<div class="content-listing-loading"></div>
	<div class="content-listing-pagination"><a data-action="load-more">Load more</a></div>
</div>
<div data-template="content-listing-empty" class="hidden">
	
<div class="content-empty">
	<span class="icon icon-drawer"></span>
	<h2>There's nothing to show here.</h2>
</div></div>
<div data-template="content-listing-loading" class="hidden">
	<div class="content-listing-loading"></div>
</div><!--googleon: index-->		</div>
	</div>
	
		<div id="home-join" class="c20 fluid-column center-box text-align-center">
		<h1>Sign up to unlock all the features</h1>
		<p>Manage your content, create private albums, customize your profile and more.</p>
		<div class="home-buttons"><a href="http://picoolio.net/signup" class="btn btn-big blue">Create account</a></div>
	</div>
		
</div>


<div id="powered-by" class="footer">Powered by <a href="http://chevereto.com">Chevereto image hosting script</a></div>


<!--googleoff: index-->
<div id="anywhere-upload" class="upload-box fixed">

	<div class="content-width">
	
    	<div class="upload-box-inner">

        	<div class="upload-box-heading">
				<div class="upload-box-status">
					<div data-group="upload">
						<span class="icon icon-download2 cursor-pointer" data-trigger="anywhere-upload-input"></span>
						<h2 class="phone-hide phablet-hide"><a data-trigger="anywhere-upload-input">Drag and drop images here to upload</a></h2>
						<h2 class="tablet-hide laptop-hide desktop-hide"><a data-trigger="anywhere-upload-input">Select the images to upload</a></h2>
						<div class="phone-hide phablet-hide upload-box-status-text">You can also <a data-trigger="anywhere-upload-input">browse from your computer</a> or <a data-modal="form" data-target="anywhere-upload-paste-url">add image URLs</a>.</div>
						<div class="tablet-hide laptop-hide desktop-hide upload-box-status-text">You can also <a data-trigger="anywhere-upload-input-camera">take a picture</a>.</div>
					</div>
					<div data-group="uploading" class="soft-hidden">
						<span class="icon icon-cloud-upload"></span>
						<h2>Uploading <span data-text="queue-size">0</span> <span data-text="queue-objects">images</span> (<span data-text="queue-progress">0</span>% queue done)</h2>
						<div class="upload-box-status-text">The queue is being uploaded. It will take just a few seconds to complete.</div>
					</div>
					<div data-group="upload-result" data-result="success" class="soft-hidden">
						<span class="icon icon-checkmark-circle color-green"></span>
						<h2>Upload complete</h2>
						<div class="upload-box-status-text">
							<div data-group="user" class="soft-hidden">Content added to <a data-text="upload-target" data-link="upload-target" href="%s">public stream</a>. You can <a data-modal="form" data-target="form-uploaded-create-album">create an album</a> or <a data-modal="form" data-target="form-uploaded-move-album">move the <span data-text="queue-objects">images</span></a> to an existing album.</div>
							<div data-group="guest" class="soft-hidden">You can <a href="http://picoolio.net/signup">create an account</a> or <a href="http://picoolio.net/login">sign in</a> to save future uploads in your account.</div>
						</div>
					</div>
					<div data-group="upload-result" data-result="error" class="soft-hidden">
						<span class="icon icon-cross4 color-grey"></span>
						<h2>No <span data-text="queue-objects">images</span> have been uploaded</h2>
						<div class="upload-box-status-text">Some errors have occured and the system couldn't process your request.</div>
					</div>
				</div>
            </div>
			
			<input id="anywhere-upload-input" data-action="anywhere-upload-input" class="hidden-visibility" type="file" accept="image/*" multiple>
			<input id="anywhere-upload-input-camera" data-action="anywhere-upload-input" class="hidden-visibility" type="file" capture="camera" accept="image/*">
			<ul id="anywhere-upload-queue" class="upload-box-queue content-width soft-hidden" data-group="upload-queue"></ul>
			
			<div id="anywhere-upload-submit" class="btn-container text-align-center margin-bottom-0 soft-hidden" data-group="upload-queue-ready">
				<div data-group="upload">
					<button class="btn btn-big plain margin-right-5" rel="tooltip" data-tiptip="top" title="Toogle upload privacy" data-login-needed="1" data-action="upload-privacy" data-privacy="public"><span class="icon icon-unlocked" data-lock="icon-lock" data-unlock="icon-unlocked"></span></button><button class="btn btn-big green" data-action="upload" data-public="Upload" data-private="Private upload">Upload</button> <span class="btn-alt">or <a data-action="cancel-upload">cancel</a></span>
				</div>
				<div data-group="uploading" class="soft-hidden">
					<button class="btn plain disabled btn-big plain margin-right-5" disabled data-action="upload-privacy-copy"><span class="icon icon-unlocked" data-lock="icon-lock" data-unlock="icon-unlocked"></span></button><button class="btn btn-big disabled off" disabled>Uploading</button> <span class="btn-alt">or <a data-action="cancel-upload" data-button="close-cancel">cancel</a><a data-action="cancel-upload-remaining" data-button="close-cancel" class="soft-hidden">cancel remaining</a></span>
				</div>
			</div>
			
			<div id="anywhere-upload-report">
				<div data-group="upload-result" data-result="mixted" class="soft-hidden margin-top-10 text-align-center upload-box-status-text">Note: Some images couldn't be uploaded. <a data-modal="simple" data-target="failed-upload-result">learn more</a></div>
				<div data-group="upload-result" data-result="error" class="soft-hidden margin-top-10 text-align-center upload-box-status-text">Check the <a data-modal="simple" data-target="failed-upload-result">error report</a> for more information.</div>
			</div>

        	<div class="upload-box-allowed-files position-absolute"><span class="phone-hide">jpg png bmp gif</span> <span>max 20 MB</span></div>
			<div class="upload-box-close position-absolute">
				<a data-action="close-upload" data-button="close-cancel"><span class="btn-icon icon-close"></span><span class="btn-text">close</span></a>
				<a data-action="cancel-upload" data-button="close-cancel" class="soft-hidden"><span class="btn-icon icon-close"></span><span class="btn-text">cancel</span></a>
				<a data-action="cancel-upload-remaining" data-button="close-cancel" class="soft-hidden"><span class="btn-icon icon-close"></span><span class="btn-text">cancel remaining</span></a>
			</div>
            
						<script>
				$(document).ready(function() {
					if(typeof CHV == "undefined") {
						CHV = {obj: {}, fn: {}, str:{}};
					} else {
						if(typeof CHV.fn.uploader == "undefined") {
							CHV.fn.uploader = {};
						}
					}
					CHV.fn.uploader.embed_modes = {"links":{"label":"Links","options":{"viewer-links":{"label":"Viewer links","template":"%URL_VIEWER%","size":"viewer"},"direct-links":{"label":"Direct links","template":"%URL%","size":"full"}}},"html-codes":{"label":"HTML Codes","options":{"html-embed":{"label":"HTML embed","template":"<img src=\"%URL%\" border=\"0\">","size":"full"},"html-embed-original":{"label":"HTML original linked","template":"<a href=\"%URL_VIEWER%\"><img src=\"%URL%\" border=\"0\"><\/a>","size":"full"},"html-embed-medium":{"label":"HTML medium linked","template":"<a href=\"%URL_VIEWER%\"><img src=\"%MEDIUM_URL%\" border=\"0\"><\/a>","size":"medium"},"html-embed-thumbnail":{"label":"HTML thumbnail linked","template":"<a href=\"%URL_VIEWER%\"><img src=\"%THUMB_URL%\" border=\"0\"><\/a>","size":"thumb"}}},"bbcodes":{"label":"BBCodes","options":{"bbcode-embed":{"label":"BBCode embed","template":"[img]%URL%[\/img]","size":"full"},"bbcode-embed-original":{"label":"BBCode original linked","template":"[url=%URL_VIEWER%][img]%URL%[\/img][\/url]","size":"full"},"bbcode-embed-medium":{"label":"BBCode medium linked","template":"[url=%URL_VIEWER%][img]%MEDIUM_URL%[\/img][\/url]","size":"medium"},"bbcode-embed-thumbnail":{"label":"BBCode thumbnail linked","template":"[url=%URL_VIEWER%][img]%THUMB_URL%[\/img][\/url]","size":"thumb"}}}};
				});
			</script>
			<div data-group="upload-result" data-result="success" class="c14 center-box soft-hidden">
				<div class="input-label margin-bottom-0">
					<label for="uploaded-embed-toggle">Embed codes</label>
					<div class="c7 margin-bottom-10">
						<select name="uploaded-embed-toggle" id="uploaded-embed-toggle" class="text-input" data-combo="uploaded-embed-toggle-combo">
							<optgroup label="Links">
	<option value="viewer-links" data-size="viewer">Viewer links</option>
	<option value="direct-links" data-size="full">Direct links</option>
</optgroup><optgroup label="HTML Codes">
	<option value="html-embed" data-size="full">HTML embed</option>
	<option value="html-embed-original" data-size="full">HTML original linked</option>
	<option value="html-embed-medium" data-size="medium">HTML medium linked</option>
	<option value="html-embed-thumbnail" data-size="thumb">HTML thumbnail linked</option>
</optgroup><optgroup label="BBCodes">
	<option value="bbcode-embed" data-size="full">BBCode embed</option>
	<option value="bbcode-embed-original" data-size="full">BBCode original linked</option>
	<option value="bbcode-embed-medium" data-size="medium">BBCode medium linked</option>
	<option value="bbcode-embed-thumbnail" data-size="thumb">BBCode thumbnail linked</option>
</optgroup>						</select>
					</div>
					<div id="uploaded-embed-toggle-combo">
						<div data-combo-value="viewer-links" class="switch-combo">
										<textarea class="r2" name="viewer-links"></textarea>
									</div>
<div data-combo-value="direct-links" class="switch-combo soft-hidden">
										<textarea class="r2" name="direct-links"></textarea>
									</div>
<div data-combo-value="html-embed" class="switch-combo soft-hidden">
										<textarea class="r2" name="html-embed"></textarea>
									</div>
<div data-combo-value="html-embed-original" class="switch-combo soft-hidden">
										<textarea class="r2" name="html-embed-original"></textarea>
									</div>
<div data-combo-value="html-embed-medium" class="switch-combo soft-hidden">
										<textarea class="r2" name="html-embed-medium"></textarea>
									</div>
<div data-combo-value="html-embed-thumbnail" class="switch-combo soft-hidden">
										<textarea class="r2" name="html-embed-thumbnail"></textarea>
									</div>
<div data-combo-value="bbcode-embed" class="switch-combo soft-hidden">
										<textarea class="r2" name="bbcode-embed"></textarea>
									</div>
<div data-combo-value="bbcode-embed-original" class="switch-combo soft-hidden">
										<textarea class="r2" name="bbcode-embed-original"></textarea>
									</div>
<div data-combo-value="bbcode-embed-medium" class="switch-combo soft-hidden">
										<textarea class="r2" name="bbcode-embed-medium"></textarea>
									</div>
<div data-combo-value="bbcode-embed-thumbnail" class="switch-combo soft-hidden">
										<textarea class="r2" name="bbcode-embed-thumbnail"></textarea>
									</div>
					</div>
				</div>
			</div>
			
        </div>
		
    </div>
	
	<div class="hidden">
		<div id="anywhere-upload-item-template">
			<li>
				<a class="block image-link" data-group="image-link" href="#file" target="_blank"></a>
				<div class="result done block"><span class="icon icon-checkmark-circle"></span></div>
				<div class="result failed block"><span class="icon icon-warning"></span></div>
				<div class="load-url block"><span class="big-icon icon-url-loading"></span></div>
				<div class="preview block"></div>
				<div class="progress block">
					<div class="progress-percent"><b data-text="progress-percent">0</b><span>%</span></div>
					<div class="progress-bar" data-content="progress-bar"></div>
				</div>
				<div class="cancel" data-action="cancel"><span class="icon-cross4"></span></div>
			</li>
		</div>
		<div id="anywhere-upload-paste-url" data-submit-fn="CHV.fn.uploader.paste_url">
			<h1>Add image URLs</h1>
			<div class="modal-form junkstr-tag-form r2">
				<textarea placeholder="Add the image URLs here" name="urls"></textarea>
			</div>
		</div>
	</div>
	
		
	<div data-modal="failed-upload-result" class="hidden">
		<h1>Error report</h1>
		<ul data-content="failed-upload-result" style="max-height: 115px;" class="overflow-auto"></ul>
	</div>
	
</div>
<!--googleon: index-->

<div data-modal="login" class="hidden">
	<h1>Login needed</h1>
	<p>To use all the features of this site you must be logged in. If you don't have an account you can <a href="http://picoolio.net/signup">sign up</a> right now.</p>
	<div class="position-relative overflow-auto margin-top-20">
		<div class="c6 grid-columns">
			<form method="post" action="http://picoolio.net/login" data-prevent="false">
				<div class="input"><input type="text" class="text-input" name="login-subject" placeholder="Username or Email address" autocomplete="off" required></div>
				<div class="input"><input type="password" class="text-input" name="password" placeholder="Password" autocomplete="off" required><button type="submit" class="icon-input-submit"></button></div>
				<div class="input">
					<div class="checkbox-label margin-0 display-inline-block"><input type="checkbox" name="keep-login-modal" id="keep-login-modal"><label for="keep-login-modal">Keep me logged in</label></div>
					<div class="float-right"><a href="http://picoolio.net/account/password-forgot">forgot?</a></div>
				</div>
			</form>
		</div>
				<div class="c9 grid-columns float-right">
			<div class="or-separator c2 float-left margin-left-10 margin-right-10"><span class="separator">or</span></div>
			<div class="c6 float-left margin-left-10">
				<h2>Sign in with another account</h2>
				<ul class="sign-services sign-services-compact margin-top-10">
<li class="margin-left-0"><a class="sign-service btn-twitter" href="http://picoolio.net/connect/twitter"><span class="btn-icon icon-twitter"></span><span class="btn-text phone-hide">Twitter</span></a></li><li class="margin-left-0"><a class="sign-service btn-facebook" href="http://picoolio.net/connect/facebook"><span class="btn-icon icon-facebook"></span><span class="btn-text phone-hide">Facebook</span></a></li><li class="margin-left-0 margin-right-0"><a class="sign-service btn-google" href="http://picoolio.net/connect/google"><span class="btn-icon icon-google"></span><span class="btn-text phone-hide">Google</span></a></li></ul>
			</div>
		</div>
			</div>
</div>

<!--[if lte IE 7]><script src="http://picoolio.net/lib/Peafowl/js/lte-ie7.js"></script><![endif]-->
<script src="http://picoolio.net/lib/Peafowl/js/jquery.min.js"></script>
<script src="http://picoolio.net/lib/Peafowl/js/scripts.js"></script>
<script>(function($,d){$.each(readyQ,function(i,f){$(f)});$.each(bindReadyQ,function(i,f){$(d).bind("ready",f)})})(jQuery,document)</script>
<script src="http://picoolio.net/lib/Peafowl/peafowl.js"></script>
<script src="http://picoolio.net/app/lib/chevereto.js"></script>

<script>
PF.obj.config.base_url = "http://picoolio.net/";
PF.obj.config.json_api = "http://picoolio.net/json";
PF.obj.config.listing.items_per_page = "12";
PF.obj.config.auth_token = "b8c36f7b32e99fe7930b6a1357a593afa1ca5a64";

PF.obj.l10n = {"":["Project-Id-Version: Chevereto V3\nPOT-Creation-Date: 2014-05-09 19:42-0400\nPO-Revision-Date: 2014-05-09 19:42-0400\nLast-Translator: Rodolfo Berr\u00edos <inbox@rodolfoberrios.com>\nLanguage-Team: \nLanguage: en\nMIME-Version: 1.0\nContent-Type: text\/plain; charset=UTF-8\nContent-Transfer-Encoding: 8bit\nX-Generator: Poedit 1.6.4\nX-Poedit-Basepath: .\nPlural-Forms: nplurals=2; plural=(n != 1);\nX-Poedit-KeywordsList: _s;_se;_n:1,2;_ne:1,2\nX-Poedit-SourceCharset: UTF-8\nX-Poedit-SearchPath-0: ..\/..\/..\n"]};

if(typeof CHV == "undefined") {
	CHV = {obj: {}, fn: {}, str:{}};
}

CHV.obj.vars = {
	urls: {
		home: PF.obj.config.base_url,
		search: "http://picoolio.net/search"
	}
};

CHV.obj.config = {
	image : {
		max_filesize: "20 MB"
	},
	user: {
		avatar_max_filesize: "1 MB",
		background_max_filesize: "1 MB"
	}
};


</script>

</body>
</html>