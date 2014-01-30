<div class="row adbox authorbox">
	<div class="community-title grey">Autor/Autorin</div>
	<div class="description">
		<div class="author-block">
			<div style="background-image:url('{{ $user->author->picture->imageurl }}')" class="author-pic"></div>
			<div class="author-name">
			  {{ if $user->author->user->defined }}
			    <a href="{{ $view->url(['username' => $user->author->user->uname], 'user') }}">
			  {{ /if }}
			  {{ $user->author->name }}
			  {{ if $user->author->user->defined }}
			    </a>
			  {{ /if }}	
			</div>
			<div class="author-bio">
				{{ $user->author->biography->text }}
			</div>
		</div>
	</div>
</div>