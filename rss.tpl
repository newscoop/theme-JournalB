<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/">
<channel>
<title>{{$gimme->publication->name}}</title>
<link>{{ url options="root_level" }}</link>
<description>{{$siteinfo.description}}</description>
<language>{{ $gimme->language->code }}</language>
<copyright>Copyright {{$smarty.now|date_format:"%Y"}}, {{$gimme->publication->name}}</copyright>
<lastBuildDate>{{$smarty.now|date_format:"%a, %d %b %Y %H:%M:%S"}} +0100</lastBuildDate>
<ttl>60</ttl>
<generator>Newscoop</generator>
<image>
	<url>{{ url static_file="_img/logo.png" }}</url>
	<title>{{$gimme->publication->name}}</title>
	<link>{{ url options="root_level" }}</link>
</image>
<atom:link href="{{ url options="root_level" }}/de/static/rss" rel="self" type="application/rss+xml" />
{{list_articles length="20" ignore_issue="true" ignore_section="true" constraints="type is news type is blog type is kolumne type is kommentar" order="bypublishdate desc"}}
<item>
<title>{{$gimme->article->name|escape }}</title>
<link>{{ url options="article" }}</link>
<description>
{{ list_article_images length="1" }}
&lt;img src="{{$gimme->article->image->thumbnailurl}}" border="0" align="left" hspace="5" /&gt;
{{ /list_article_images }}
{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8'}}
&lt;br clear="all"&gt;
</description>
<category domain="{{ url options="section" }}">{{$gimme->section->name}}</category>
{{if $gimme->article->author->name}}
<atom:author><atom:name>{{ $gimme->article->author->name }}</atom:name></atom:author>
{{/if}}
<pubDate>{{$gimme->article->publish_date|date_format:"%a, %d %b %Y %H:%M:%S"}} +0100</pubDate>
<guid isPermaLink="true">{{ url options="article" }}</guid>
</item>
{{/list_articles}}
</channel>
</rss>
