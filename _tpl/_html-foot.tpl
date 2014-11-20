{{ if $DEV_ENV }}
<center style="font-size:60%"><script language="JavaScript">document.write(navigator.userAgent + ' - native:' + NATIVE_APP + ' mobile:' + MOBILE_WEB + ' v{{ $VER_ENV }}')</script></center>
<!-- DEV -->
<script src="{{ url static_file='_js/library.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/community.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/faves.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/swipe.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/slider.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/general.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/tabs.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/magnific.popup.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/fancybox/jquery.mousewheel-3.0.4.pack.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/fancybox/jquery.fancybox-1.3.4.pack.js' }}" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="{{ url static_file='_js/fancybox/jquery.fancybox-1.3.4.css' }}" media="screen" />
<script type="text/javascript">
		$(document).ready(function() {
			/*

			$("#various1").fancybox({
				'titlePosition'		: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
			});;
		});
	</script>
<!-- /DEV -->
{{ else }}
<!-- PROD -->
<script src="{{ url static_file="_js/all.min.js" }}" type="text/javascript"></script>
<!-- /PROD -->
{{ /if }}

<div id="fb-root"></div>

<script type="text/javascript">
if (NATIVE_APP) {
	$.get('/mobile/controlbar', function(data) { $('.controlbar_mobile_front').html(data); });
}
if (MOBILE_WEB) {
	/* browser-update */
	var $buoop = { l: 'de', text: 'Um die volle Funktionalit&auml;t der Journal-B-Website zu geniessen, empfehlen wir Ihnen, ihren Browser auf die neuste Version aufzur&uuml;sten' }
	$buoop.ol = window.onload;
	window.onload=function(){
	 try {if ($buoop.ol) $buoop.ol();}catch (e) {}
	 var e = document.createElement("script");
	 e.setAttribute("type", "text/javascript");
	 e.setAttribute("src", "http://browser-update.org/update.js");
	 document.body.appendChild(e);
	}
	/* /browser-update */
}
</script>

<script type="text/javascript">
/* disqus: */
if (NATIVE_APP && document.location.protocol != 'http:') {
	$('#disqus_thread').html('Für die Kommentarfunktion ist eine Internetverbindung erforderlich.');
	initFavorites();
} else {
	if ($('#disqus_thread').length == 0) {
		$('body').append('<div class="hidden" id="disqus_thread"></div>');
	}
	var disqus_config = function () {
		this.language = "de";
		this.callbacks.afterRender = [helloDisqus];
		if (typeof disqus_identifier != 'undefined') {
			this.page.identifier = disqus_identifier;
			this.page.url = disqus_url;
		}
	};
	(function() {
		// Forum widget
		var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		// Comment counter
	    var s = document.createElement('script'); s.async = true;
	    s.type = 'text/javascript';
	    s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
	    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(s);
	})();
}
/* /disqus */

/* flattr: */
/* <![CDATA[ */
(function() {
	var flt = document.createElement('script'); flt.type = 'text/javascript'; flt.async = true;
	flt.src = '//api.flattr.com/js/0.6/load.js?mode=auto';
	(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(flt);
})();
/* ]]> */
/* /flattr */

/* google_analytics: */
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34737515-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
/* /google_analytics */
</script>
</body>
</html>
