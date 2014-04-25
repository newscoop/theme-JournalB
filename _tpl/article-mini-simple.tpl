<div class="article-mini layoutsimple">
	<info>
		{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
			{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
		{{ else }}
			{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
		{{ /if }}
		 | {{ if $user->author->name=="" }} {{ $gimme->article->author->name }} {{ else }} {{ $user->author->name }} {{ /if }}
	</info>

	{{ if $gimme->issue->number == 5 }}
		{{ $articlemini_section = "blogs" }}
	{{ else }}
		{{ $articlemini_section = {{ $gimme->section->url_name }} }}
	{{ /if }}

	<div class="title section-{{ $articlemini_section }}">
		<div class="image section-{{ $articlemini_section }}">
		{{ image rendition="thumbnail" }}
			<img src="{{ $image->src }}" align="left" style="width: 100px; height: 66px;" />
		{{ /image }}
		</div>
		<div class="description">
			{{ if $gimme->issue->url_name == "blogs" }}<span class="minih2"><a href="{{ uri options="section" }}">Blog</a></span> / {{ /if }}
			{{ if $gimme->issue->url_name == "klkm" }}<span class="minih2" style="text-transform: capitalize;">{{ $gimme->article->type_name }}</span> / {{ /if }}
			<span class="capitalize"><a href="{{ uri options="article" }}">{{ $gimme->article->title }}</a></span>
		</div>
		<div style="clear: both"></div>
	</div>
	<div class="description">
		{{ if $gimme->article->deck=="" }}
			{{ $gimme->article->full_text->first_paragraph|strip_tags|truncate:280:"...":true }}
		{{ else }}
			{{ $gimme->article->deck|strip_tags|truncate:280:"...":true }}
		{{ /if }}
	</div>
</div>
