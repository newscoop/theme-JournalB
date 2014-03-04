{{ assign var="VER_ENV" value=".v1.6" scope="global" }}
{{ assign var="DISQUSN" value="journalb-lab" }}
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
<title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
<link rel="stylesheet" type="text/css" href="{{ url static_file="_css/native-application.css" }}">
<link rel="stylesheet" type="text/css" href="{{ url static_file="_css/style$VER_ENV.css" }}">
</head>
<body>
<div id="disqus_thread"></div>
<script type="text/javascript">
var disqus_identifier = '{{ $gimme->article->number }}';
var disqus_shortname = '{{ $DISQUSN }}';
/* disqus: */
var disqus_config = function () { 
	this.language = "de_formal";
};
(function() {
	/* Forum widget */
	var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
	dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
	(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
})();
/* /disqus */
</script>
</body>
</html>
