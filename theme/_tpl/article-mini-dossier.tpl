{{ $list_count = 0 }}
{{ list_related_articles }} {{ $list_count = $list_count + 1 }} {{ /list_related_articles }}
		
<div class="article-mini layoutdossier">
	<info>({{ $list_count }}) Artikel</info>
				
	{{ $section = $gimme->section->url_name }}

	{{ if $section!="alltag" and $section!="kultur" and $section!="politik" }} {{ $section = "dossiers" }} {{ /if }}
	
	<div class="title section-{{ $section }}">
		<div class="image section-{{ $section }}">
		{{ image rendition="thumbnail" }}
			<img src="{{ $image->src }}" align="left" />
		{{ /image }}
		</div>
		<div class="descr">
			<span class="minih2"><a href="{{ uri options="section" }}">Dossier</a></span> / 
			<span class="capitalize"><a href="{{ uri options="article" }}">{{ $gimme->article->title }}</a></span>
			<description>
				{{ $gimme->article->full_text->first_paragraph|truncate:110:"...":true }}
			</description>
		</div>
		<div style="clear: both"></div>
	</div>
	
	{{ if $list_count }}
		<div class="list">
			<ul>
			{{ list_related_articles }}
				<li><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a> <time>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</time></li>
			{{ /list_related_articles }}
			</ul>
		</div>
	{{ /if }}
	
</div>
