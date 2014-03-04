{{ include file="_tpl/mobile-controlbar.tpl" }}

{{ if $gimme->article->issue->number == 5 }}
{{ $article_section = "blogs" }}
{{ $article_class = "blog" }}
{{ else }}
{{ $article_section = $gimme->section->url_name }}
{{ $article_class = $gimme->article->type_name }}
{{ /if }}

<div class="addbar">
	{{ include file="_html/control-icons.html" }}
</div>

<div class="contentbar section-{{ $article_section }}">

	{{ include file="_html/control-sharebox.html" }}

	<div class="miniarticle hidden">
		{{ include file="_tpl/article-mini.tpl" }}
	</div>

	{{ if $gimme->article->issue->number < 5 }}
	<div class="titlebox section-{{ $gimme->section->url_name }}">
		<h2 style="text-transform: capitalize;">{{  $gimme->article->type_name }} / </h2><h1><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></h1>
	</div>

	{{ elseif $gimme->article->issue->number == 5 }}
	<div class="titlebox section-blogs">
		<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
	</div>
	<div class="blogbox">
		<div class="info_block">
			{{ if $gimme->article->publish_date }}
			<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> |
			<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
			{{ /if }}
		</div>
		<div class="author mainauthor">
			<a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a>
		</div>
	</div>

	{{ elseif $gimme->article->type_name == "kolumne"  }}
	<div class="titlebox section-alltag">
		<h2 >KOLUMNE / </h2><h1><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></h1>
	</div>


	{{ elseif $gimme->article->type_name == "kommentar"  }}
	<div class="titlebox section-alltag">
		<h2 >Kommentar / </h2><h1><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></h1>
	</div>





	{{ /if }}

	<article class="{{ $article_class }}">
		{{ if $gimme->article->content_accessible }}

		<header>
			{{if $gimme->article->type_name == "kolumne" }}
			<div class="blogbox">

				<div class="info_block">
					{{ if $gimme->article->publish_date }}
					<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> |
					<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
					{{ /if }}
				</div>

				<div class="article_top">
					<div class="title"><a name="top" id="articleTitle">{{ $gimme->article->name }}</a></div>
				</div>
				<div class="deck font-sens">
					{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
					{{ $gimme->article->deck }}
				</div>
			</div>
			{{elseif $gimme->article->issue->number == 5 }}
			<div class="blogbox">

				<div class="article_top">
					<div class="title"><a name="top" id="articleTitle">{{ $gimme->article->name }}</a></div>
				</div>

			</div>

			{{ else }}



			<div class="article_top">
				<h1 id="articleTitle">{{ $gimme->article->name }}</h1>

				<div class="deck font-sens">
					{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
					{{ $gimme->article->deck }}
				</div>
			</div>

			<div class="article_info_mobile">
				{{ if $gimme->article->publish_date }}
				{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
				{{ /if }}
				|
				{{ /if }}
				{{ $gimme->article->author->name }}
			</div>

			{{ /if }}

			{{ render file="_tpl/article-gallery.tpl" }}
		</header>

		<div class="mcontentbar">
			{{ include file="_tpl/article-info.tpl" }}

			<div class="font-sens">{{ $gimme->article->full_text }}</div>

			<div style="clear:both"></div>
		</div>

		{{ else }}
		<p><em>403</em></p>
		{{ /if }}
	</article>

	{{ if $gimme->article->box_under != "" }}
	<div class="row adbox community-box">
		{{ $gimme->article->box_under }}
	</div>
	{{ /if }}

	<div class="article-community mobile"></div>

	{{ if $gimme->article->no_forum or $gimme->preview }}
	<!-- Community disabled -->

	{{ if $gimme->preview }}
	{{ if $gimme->article->issue->number > 2 && !$gimme->article->frontpage_doubleview }}
		{{ include file="_tpl/newsbox.tpl" }}
	{{ else }}
	<div class="sidebar">
		{{ include file="_tpl/community-item.tpl" }}
	</div><br clear="all"/>
	{{ /if }}
	{{ /if }}

	{{ else }}
	<!-- Article forum -->
	<div class="forum">

		<a name="comments"></a>
		<div id="disqus_thread"></div>

	</div><!-- /forum -->
	<script language="JavaScript">
	var disqus_identifier = '{{ $gimme->article->number }}';
	var disqus_url = 'http://{{ $gimme->publication->site }}' + '{{ uripath }}';
	</script>

	{{ /if }}

</div>

{{ if $gimme->preview }}
{{ if $gimme->article->issue->number > 2 && $gimme->article->frontpage_doubleview }}
{{ include file="_tpl/newsbox.tpl" }}
{{/if}}
{{/if}}
