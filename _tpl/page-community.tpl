{{ list_related_articles }}

	{{ if $gimme->article->issue->url_name == "community" }}
		{{ include file="_tpl/community-item.tpl" }}
	{{ /if }}
	
{{ /list_related_articles }}