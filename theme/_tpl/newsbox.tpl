{{ $article_section = $gimme->article->section->url_name }}
{{ if $gimme->article->issue->url_name == "blogs" }} {{ $article_section = "blogs" }} {{ /if }}
{{ if $gimme->article->issue->url_name == "dossiers" }} {{ $article_section = "dossiers" }} {{ /if }}

{{ if $gimme->article->type_name == 'ad' }}
	{{ include file="_tpl/newsbox-ad.tpl" }}
{{ elseif $gimme->article->frontpage_doubleview }}	
	{{ include file="_tpl/newsbox-double.tpl" }}
{{ elseif $gimme->article->frontpage_image }}
	{{ include file="_tpl/newsbox-bgimage.tpl" }}
{{ else }}
	{{ include file="_tpl/newsbox-simple.tpl" }}
{{ /if }}