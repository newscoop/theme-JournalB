<a class="content-single newsbox section-{{ $article_section }} layoutsimple" href="{{ uri options="article" }}" ontouchstart="">

	<div class="newsboxcontent">
		<div class="newsboxheading">
			{{ if $gimme->article->issue->url_name == "dossiers" }}
				<h2>Dossier</h2>
				<h1><span>{{ $gimme->article->name }}</span></h1>

			{{ elseif $gimme->article->issue->url_name == "blogs" }}
				<h2>Blog</h2>
				<h1><span>{{ $gimme->article->section->name }}</span></h1>

			{{ elseif $gimme->article->type_name == "kolumne" }}
				<h2>Kolumne</h2>
				<h1><span>{{ $gimme->article->name }}</span></h1>

			{{ elseif $gimme->article->type_name == "kommentar" }}
				<h2>Kommentar</h2>
				<h1><span>{{ $gimme->article->name }}</span></h1>

			{{ elseif $gimme->article->issue->url_name == "klkm" }}
				<h2>{{ $gimme->article->type_name }}</h2>
				<h1><span>{{ $gimme->article->author->name }}</span></h1>

			{{ else }}
				<h1><span>{{ $gimme->article->name }}</span></h1>

			{{ /if }}
		</div>

		<description>
			<p>
				{{ if $gimme->article->deck=="" }}
					{{ $gimme->article->full_text->first_paragraph|strip_tags|truncate:400:"...":true }}
				{{ else }}
					{{ $gimme->article->deck|strip_tags }}
				{{ /if }}
			</p>
		</description>
	</div>
	<div class="info_block">
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
			{{ /if }}
		</time> |
		<author>{{ $gimme->article->author->name }}</author>
	</div>

	<span class="favorite"><span>Favorite</span></span>
</a>
<a class="commentcount hidden" href="{{ uri options="article" }}#disqus_thread" data-disqus-identifier="{{ $gimme->article->number }}"></a>