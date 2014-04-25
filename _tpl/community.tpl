{{ if !$custom }}<div id="community">{{ /if }}

{{ if !preg_match("/Journal/", $smarty.server.HTTP_USER_AGENT) || $custom }}



<div class="row socialbox">
	<a href="http://twitter.com/journalb" target="_blank">
	    <div style="float: left; width: 60px;">Follow<br>us on<br>Twitter</div>
    	<div style="float: left; margin-right: 15px; margin-top: 8px;" class="icon icon-twitter"></div>
    </a>
    <a href="http://www.facebook.com/journalb.bern" target="_blank">
	    <div style="float: left; width: 59px; margin-left: 1em;">Join<br>us on<br>Facebook</div>
	    <div style="float: left; margin-top: 8px; margin-left: 7px;" class="icon icon-facebook"></div>
    </a>
</div>

<!-- Start community feed -->



<!-- End community feed -->

{{ include file="_tpl/community-spenden.tpl" }}

{{ list_articles length="20" order="byPublishDate desc" constraints="issue is 2 type is fweet is_ad is off" ignore_section="true" ignore_issue="true" }} 
	{{ include file="_tpl/community-item.tpl" }}
{{ /list_articles }}


<div class="community-ads">
	{{ list_articles order="byPublishDate desc" constraints="issue is 2 type is fweet is_ad is on" ignore_section="true" ignore_issue="true" }} 
		{{ include file="_tpl/community-item.tpl" }}
	{{ /list_articles }}
</div>



<script type="text/javascript">

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

/* disqus: */
    if ($('#disqus_thread').length == 0) {
    	$('body').append('<div class="hidden" id="disqus_thread"></div>');
    }
	var disqus_config = function () { 
		this.language = "de_formal";
		this.callbacks.afterRender = [helloDisqus];
	};
	(function() {
		/* Forum widget */
		var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		/* Comment counter */
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(s);
	})();
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

</script>

{{ /if }}

{{ if !$custom }}</div>{{ /if }}