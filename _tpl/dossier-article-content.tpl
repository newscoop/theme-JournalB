<div class="contentbar section-dossiers contentbar-section-dossiers">
	
	<a name="mobile_startpoint"></a>

	<div class="titlebox section-dossiers">
		<h2><a href="{{ uri options="issue" }}">Dossier</a> /</h2>
		<h1>{{ $gimme->article->name }}</h1>
	</div>

	<article>
		<header> 
			{{ dynamic }}
				{{ render file="_tpl/article-gallery.tpl" }}
			{{ /dynamic }}
		</header>
		
		{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
		
		<div class="dossier-content">
			{{ $gimme->article->full_text }}
		</div>
		
	</article>
	
	{{ set_default_section }}

	<div class="dossier-articles newsrows dynrows temprows">
		{{ list_related_articles }}
		
			{{ $article_section = $gimme->article->section->url_name }}
			{{ if $gimme->article->issue->url_name == "blogs" }} {{ $article_section = "blogs" }} {{ /if }}
			{{ if $gimme->article->issue->url_name == "dossiers" }} {{ $article_section = "dossiers" }} {{ /if }}
				
			{{ if $gimme->article->frontpage_image || $gimme->article->frontpage_doubleview }}
				{{ include file="_tpl/newsbox-bgimage.tpl" }}
			{{ else }}
				{{ include file="_tpl/newsbox-simple.tpl" }}
			{{ /if }}
						
		{{ /list_related_articles }}
	</div>

	
	
</div>