<img src="{{ $article->image->imageurl }}" style="display: none;" />
<a class="content-single newsbox section-{{ $article_section }} layoutbgimage" ontouchstart="" href="{{ $article->url }}"
	style="background-image: url({{ $article->image->imageurl }});">

	<div class="info_block">
		<div>
			<span class="info">
				<time>
					{{ if $article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
						{{ $article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $article->publish_date|camp_date_format:"%d.%m.%Y" }}
					{{ /if }}
				</time> | 
			</span>
			<h1><span>{{ $article->name }}</span></h1>
		</div>
	</div>

	<span class="favorite checked"><span>Favorite</span></span>
	
</a>