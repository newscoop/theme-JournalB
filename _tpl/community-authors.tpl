{{ if $gimme->issue->number > 4 }}
	{{ $i = 0 }}
	{{ list_article_authors }}
		{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox authorbox">
			<div class="community-title grey">Autor/Autorin</div>
			<div class="description">
		{{ /if }}
			{{ $ren = false }}
			{{ foreach from=$rendered_authors item=author }} {{ if $author == $gimme->author->name }} {{ $ren = true }} {{ break }} {{ /if }} {{ /foreach }}
			{{ if not $ren }}		
				<div class="author-block">
					<div style="background-image:url('{{ $gimme->author->picture->imageurl }}')" class="author-pic"></div>
					<div class="author-name">
					  {{ if $gimme->author->user->defined }}
					    <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
					  {{ /if }}
					  {{ $gimme->author->name }}
					  {{ if $gimme->author->user->defined }}
					    </a>
					  {{ /if }}	
					</div>
					<div class="author-bio">
						{{ $gimme->author->biography->text }}
					</div>
				</div>
				<div class='clear'></div>
				{{ $rendered_authors[$i] = $gimme->author->name }}
				{{ $i = $i + 1 }}
			{{ /if }}
		{{ if $gimme->current_list->at_end }}
			</div>
		</div>
		{{ /if }}
	{{ /list_article_authors }}
{{ /if }}
