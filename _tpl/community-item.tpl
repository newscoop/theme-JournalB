<!-- Article: {{ $gimme->article->name }} -->

{{ if $gimme->article->is_twitter }}

	<a href="{{ $gimme->article->link }}" class="row commentbox layouttwitter {{ if not $gimme->article->icon or $gimme->article->icon=="" }}without_icon{{ /if }} community-item">
		{{ if $gimme->article->icon }}
			<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
		{{ /if }}
		
		<div class="info_block">
			<div class="author"><span>{{ $gimme->article->who }}</span></div>
			{{ if $gimme->article->publish_date }}
				<time>
					{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
						{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
					{{ /if }}
				</time>
			{{ /if }}
		</div>
		<div class="clear"></div>
		<div class="description">{{ $gimme->article->quote|strip_tags }}</div>

		<div class="commentbox-bg"></div>
		
		<div class="icon icon-twitter-white"></div>
		
	</a>
	
{{ elseif $gimme->article->type_name == 'ad' }}	

	<div class="row adbox">
		<div class="community-title grey">Anzeige</div>
		<a href="{{ $gimme->article->link }}" target="_blank">
		{{ if $gimme->article->icon }}
			<div class="image"><img width="100%" src="{{ $gimme->article->icon }}" /></div>
		{{ /if }}
			<div class="title">{{ $gimme->article->where }}</div>
		</a>
		<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
		<div class="lists"><a href="{{ $gimme->article->link }}" target="_blank">{{ $gimme->article->who }}</a></div>
	</div>
	
{{ else }}

	<a class="row commentbox layoutsimple" href="{{ $gimme->article->link }}">
		{{ if $gimme->article->is_highlight }}
			<h1>
				{{ $gimme->article->quote|strip_tags }}
			</h1>
			<time>
				{{ if $gimme->article->who }}
					schrieb {{ $gimme->article->who }}
				{{ /if }}
				{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
					um {{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ else }}
					am {{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
				{{ /if }}
			</time>
			
		{{ else }}
			{{ if $gimme->article->icon }}
				<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
			{{ /if }}
		
			<div class="author">{{ $gimme->article->who }}</div>
			<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
				
			{{ if $gimme->article->publish_date }}
				<time>
					schrieb  
					{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
						um {{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						am {{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }} zu
					{{ /if }} 
				</time>
			{{ /if }}
		{{ /if }}
		
		<br/><span class="community-title white">{{ $gimme->article->where }}</span>
		<div class="commentbox-bg"></div>
	
	{{ if $gimme->article->is_facebook }}<div class="icon icon-facebook-white"></div>{{ /if }}
	{{ if $gimme->article->is_disqus }}<div class="icon icon-disqus-white"></div>{{ /if }}
	
	</a>
		
{{ /if }}