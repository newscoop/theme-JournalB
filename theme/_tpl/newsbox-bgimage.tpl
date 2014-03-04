{{ image rendition="topfront" }}<img src="{{ $image->src }}" style="display: none;" />{{ /image }}
<a class="content-single newsbox section-{{ $article_section }} layoutbgimage" ontouchstart="" href="{{ uri options="article" }}"
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<div class="info_block">
		<div>
			<span class="info">
				<time>
					{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
						{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
					{{ /if }}
				</time> | 
			</span>
			<h1><span>{{ $gimme->article->name }}</span></h1>
		</div>
	</div>

	<span class="favorite"><span>Favorite</span></span>
</a>