{{ set_default_section }}

{{ include file="_tpl/community-authors.tpl" }}

{{ if $gimme->article->box!="" }}
	<div class="row adbox community-box">
		{{ $gimme->article->box }}
	</div>
{{ /if }}

{{ list_related_articles }}

	{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox">
			<div class="community-title grey">Weitere Artikel zum Thema</div>
			<div>
	{{ /if }}

{{ if $gimme->article->issue->number > 2 }}
	{{ $publish_date = $gimme->article->publish_date }}
	{{ if $publish_date }}
		<div class="info">
			<date>{{ $publish_date|camp_date_format:"%d.%m.%Y" }}</date> /
			<time>{{ $publish_date|camp_date_format:"%H:%i" }}</time> /
			<author><span>{{ $gimme->article->author->name }}</span></author>
		</div>
	{{ /if }}
	<p>
		<a href="{{ uri options="article" }}" class="baselink">{{ $gimme->article->name }}</a>
	</p>
{{ /if }}

	{{ if $gimme->current_list->at_end }}
		</div>
		</div>
	{{ /if }}

{{ /list_related_articles }}
<div class="row googlead">
	{{ include file="_tpl/adsense.tpl" }}
</div>
<div class="row community-buttons">
	<button onclick="showComments()" class="button-black" type="button">Kommentare<br><span class="num-comments"></span> lesen</button>
	<button style="float: right;" onclick="document.location='#comments'" class="button-black" type="button">Kommentar<br>verfassen</button>
</div>

{{ list_related_articles }}

	{{ if $gimme->article->issue->url_name == "community" }}
		{{ include file="_tpl/community-item.tpl" }}
	{{ /if }}

{{ /list_related_articles }}
