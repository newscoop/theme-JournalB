<div class="article_info">
	{{ $i = 0 }}
	{{ list_article_authors }}
		{{ $ren = false }}
		{{ foreach from=$rendered_authors item=author }} {{ if $author == $gimme->author->name }} {{ $ren = true }} {{ break }} {{ /if }} {{ /foreach }}
		{{ if not $ren }}
			{{ $i = $i + 1 }}
			{{ $rendered_authors[$i] = $gimme->author->name }}
		{{ /if }}
		<div class="author" type="{{ $gimme->author->type }}" {{ if $ren }}style="display: none;"{{ /if }}>
		  {{ if $gimme->author->user->defined }}
			<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
		  {{ /if }}
		  <span>{{ $gimme->author->name }}</span>
		  {{ if $gimme->author->user->defined }}
			</a>
		  {{ /if }}
		</div>
	{{ /list_article_authors }}
	<time>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y<br>%H:%i" }}</time>
</div>