{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}

<div class="center_contentbar">
	<a name="mobile_startpoint"></a>

	<div class="titlebox section-front">
		<h2><a href="{{ uri options="publication" }}">Artikel</a> / </h2><h1>{{ $user->author->name }}</h1>
	</div>

	{{ $articles = array() }}
	{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName issue greater_equal 3" order="bypublishdate desc" }}
		{{ if not $articles[$gimme->article->number] }}
			{{ $articles[$gimme->article->number]=true }}
			{{ include file="_tpl/article-mini.tpl" }}
		{{ /if }}
	{{ /list_articles }}
</div>