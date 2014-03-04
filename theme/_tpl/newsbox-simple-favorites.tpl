<a class="content-single newsbox section-{{ $article_section }} layoutsimple" href="{{ $article->url }}" ontouchstart="">

	<div class="newsboxcontent">
		<div class="newsboxheading">
			{{ if $article->issue->url_name == "dossiers" }}
				<h2>Dossier</h2>
				<h1><span>{{ $article->name }}</span></h1>

			{{ elseif $article->issue->url_name == "blogs" }}
				<h2>Blog</h2>
				<h1><span>{{ $article->section->name }}</span></h1>

			{{ elseif $article->issue->url_name == "klkm" }}
				<h2>{{ $article->type_name }}</h2>
				<h1><span>{{ $article_author }}</span></h1>
				
			{{ else }}
				<h1><span>{{ $article->name }}</span></h1>
				
			{{ /if }}
		</div>
				
		<description>
			<p>
				{{ if $article->deck=="" }} 
					{{ $article->full_text->first_paragraph|strip_tags|truncate:400:"...":true }}
				{{ else }}
					{{ $article->deck|strip_tags }}
				{{ /if }}
			</p>
		</description>	
	</div>
	<div class="info_block">
		<time>
			{{ if $article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
				{{ $article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $article->publish_date|camp_date_format:"%d.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author>{{ $article_author }}</author>
	</div>

	<span class="favorite checked"><span>Favorite</span></span>
</a>