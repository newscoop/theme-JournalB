{{ set_current_issue }}
{{ set_default_section }}
<a name="mobile_startpoint"></a>

<div class="titlebox section-blogs">
	<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
</div>

<script>$('.favorite').hide();</script>

{{ $start = $gimme->url->get_parameter("ls-art0") }}
{{ $articles_on_page = 5 }}
{{ $articles_num_total = 0 }}

<div class="dynrows">
<!-- /start articlerows/ -->
{{ list_articles order="byPublishDate desc" length="`$articles_on_page`" }}

	<div class="blogbox section-blogs">

		<div class="info_block">
			<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
			<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
		</div>
		<div class="author mainauthor"><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></div>
	
		<div class="blogboxcontent">
			<article>
				<header>
					<div class="title"><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></div>
				</header>
				
				{{ image rendition="articlebig" }}
					<img src="{{ $image->src }}" style="width: 100%" alt="{{ $image->caption }} (photo: {{ $image->photographer }})" />
				{{ /image }}
									
				{{ if $gimme->current_list->at_beginning }}
					<description class="font-sens">{{ $gimme->article->full_text }}</description>
				{{ else }}
					<description  class="font-sens">{{ $gimme->article->full_text->first_paragraph }}</description>
				{{ /if }}
			</article>
		</div>
		
		<div class="weiter"><a href="{{ uri options="article" }}">> weiter lesen</a></div>
		
	</div>
	
	{{ $articles_num_total = $gimme->current_list->count }}
			
{{ /list_articles }}

{{ if ($start + $articles_on_page ) < $articles_num_total }}
	<div class="weitere">
		<div class="wline"></div>
		<a href="{{ url options="section" }}?ls-art0={{ $start+5 }}&time={{ php }}echo time();{{ /php }}" onclick="return loadWeitereArtikel(this);">weitere Artikel</a>
	</div>
{{ /if }}

<!-- /end articlerows/ -->
</div>