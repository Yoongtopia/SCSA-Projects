$(document).ready(function() {

	// Scrollto
	$('#smooth').scrollTo({
		speed:300
	});

	$('#smooth-2').scrollTo({
		speed:300
	});

	$('#smooth-3').scrollTo({
		speed:300
	});

	$('#smooth-4').scrollTo({
		speed:300
	});

	$('#smooth-5').scrollTo({
		speed:300
	});

	$('#smooth-6').scrollTo({
		speed:300
	});


	$('#smooth-7').scrollTo({
		speed:300
	});
});

(function(c){c.fn.scrollTo=function(b){var a={offset:0,speed:"slow",override:null,easing:null};if(b){if(b.override)b.override=-1!=override("#")?b.override:"#"+b.override;c.extend(a,b)}return this.each(function(b,e){c(e).click(function(b){b.preventDefault();var d=a.override?a.override:c(e).attr("href");history.pushState?(history.pushState(null,null,d),console.log(a.easing),c("html,body").stop().animate({scrollTop:c(d).offset().top+a.offset},a.speed,a.easing)):c("html,body").stop().animate({scrollTop:c(d).offset().top+
a.offset},a.speed,a.easing,function(){window.location.hash=d})})})}})(jQuery);