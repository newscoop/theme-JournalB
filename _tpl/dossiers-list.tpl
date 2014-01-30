{{ assign var="column" value="0" }}
{{ assign var="article_section" value="dossiers" }}

<div class="newsrows dynrows temprows">
	{{ list_articles }}
		
		{{ include file="_tpl/newsbox-simple.tpl" }}
						
	{{ /list_articles }}
</div>