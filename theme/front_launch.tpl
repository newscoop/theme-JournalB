<!DOCTYPE html>
<!--[if IE]>
<html class="ie" lang="de">
<!--[else]-->
<html lang="de">
<!--<![endif]--> 
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
	<meta name="author" content="{{ if $gimme->article->defined }}{{ $gimme->article->author->name }} - {{ /if }}{{ $gimme->publication->name }}" >
	{{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
	<meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">
	<meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />

    <link rel="shortcut icon" href="{{ url static_file='_img/favicon.ico' }}">
    
	<style type="text/css">
	
	html, body { height:100%; }
	body { 
		background:none; margin:0; 
	}
	a.launch { 
		display:block; width:100%; height:100%;
		background: url('{{ url static_file='_img/launch.png' }}') no-repeat top center;
		background-size: auto 100%;
		text-indent: -9999px; color:transparent; font-size:0px;
	}
	
	.sharebox {
		position:absolute; width:450px; height:40px;
		bottom:10px; left:50%; margin-left:-155px;
	}
    .sharebox .shareicon {
	    float:left;
	    margin-right: 45px;
	}
	
	</style>
	
</head>
<body id="body" class="front-page">

	<a class="launch" href="http://sagt-was-bern-bewegt.ch/" title="sagt-was-bern-bewegt.ch">
		<h1>Journal B - sagt, was Bern bewegt.</h1>
		<h2>Ab 21. September.</h2>
	</a>
	
<div class="sharebox">
	<div class="shareicon">
		<a href="https://twitter.com/share" class="twitter-share-button" data-via="journalb" data-lang="de" data-size="large" data-related="journalb" data-count="none" data-hashtags="Bern">Twittern</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</div>

	<div class="shareicon">
		<g:plusone annotation="none"></g:plusone>
		<script>window.___gcfg = {lang: 'de'}; (function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'https://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })();</script>
	</div>
	
	<div class="shareicon" style="margin-right:0">
		<div class="fb-like" data-send="false" data-layout="button_count" data-width="100" data-height="30" data-show-faces="false"></div>
		<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/de_DE/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>
	</div>
	
	<div style="clear:both"></div>
</div>

</body>
</html>
