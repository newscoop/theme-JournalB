{{ assign var="DEV_ENV" value="0" scope="global" }}
{{ assign var="VER_ENV" value="v1.5.2.1" scope="global" }}
{{ assign var="DISQUSN" value="journalb" }}
<!DOCTYPE html>
<!--[if IE]>
<html class="ie" lang="de">
<![endif]--><!--[if !IE]><!-->
<html lang="de">
<!--<![endif]-->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <script type="text/javascript">
    if ((window.devicePixelRatio===undefined?1:window.devicePixelRatio)>1) { document.cookie='HTTP_IS_RETINA=1;path=/'; }
    </script>

   	{{ if $DEV_ENV }}
		<link rel="stylesheet/less" type="text/css" href="{{ url static_file='_css/style.less' }}">
		<script src="{{ url static_file='_js/less.min.js' }}" type="text/javascript"></script>
	{{ else }}
		<link rel="stylesheet" type="text/css" href="{{ url static_file="_css/style.css?v=$VER_ENV" }}">
	{{ /if }}

	<link rel="stylesheet" type="text/css" media="print" href="{{ url static_file='_css/print.css' }}">

    <!-- Favicons -->
    <link rel="shortcut icon" href="{{ url static_file='_img/favicon.ico' }}">
    <link rel="apple-touch-icon-precomposed" href="{{ url static_file='_img/57_Journal-B_Web_Icon.png' }}">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{ url static_file='_img/72_Journal-B_Web_Icon.png' }}">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{ url static_file='_img/114_Journal-B_Web_Icon.png' }}">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{ url static_file='_img/144_Journal-B_Web_Icon.png' }}">

	<title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
	<meta name="author" content="{{ if $gimme->article->defined }}{{ $gimme->article->author->name }} - {{ /if }}{{ $gimme->publication->name }}" >
	{{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
	<meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">
	<meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />

	<!-- RSS & Pingback -->
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/de/static/rss/">

	{{ if $gimme->article->defined }}{{* Open Graph protocol metatags for Facebook sharing *}}
	  <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
	  <meta property="og:type" content="article" />
	  <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
	  <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
	  <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}" />
	{{ list_article_images }}
	  <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
	{{ /list_article_images }}
	{{ /if }}

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="{{ url static_file='_js/jquery-1.8.3.min.js' }}"><\/script>')</script>

	<script type="text/javascript">
		function getCookie(a){var b,d,c,e=document.cookie.split(";");for(b=0;b<e.length;b++)if(d=e[b].substr(0,e[b].indexOf("=")),c=e[b].substr(e[b].indexOf("=")+1),d=d.replace(/^\s+|\s+$/g,""),d==a)return unescape(c)};
		var disqus_shortname = '{{ $DISQUSN }}';
    	var DEBUG_MODE = ('{{ $DEV_ENV }}' == '1');
    	var NATIVE_APP = (!!navigator.userAgent.match(/Journal/) || false);
    	var MOBILE_WEB = (!!navigator.userAgent.match(/(Mobile|iPhone|iPad)/) || false);
    	if (navigator.userAgent.match(/Windows/)) { document.write('<link rel="stylesheet" type="text/css" href="{{ url static_file='_css/windows-application.css' }}">'); }
    	if (NATIVE_APP) { document.write('<link rel="stylesheet" type="text/css" href="{{ url static_file="_css/native-application.css" }}">'); }
	</script>

	<!--[if IE]>
	<script src="{{ url static_file='_js/html5shiv.min.js' }}"></script>
	<![endif]-->

</head>