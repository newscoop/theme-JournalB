<div style="clear:both"></div>

<div class="footer">

	<div class="footer-sections">
        <ul>
			<li class="nav-front section-front"><a href="/">Front</a></li>
			{{ set_current_issue }}
			{{ list_sections }}
				<li class="nav-{{ $gimme->section->url_name }} section-{{ $gimme->section->url_name }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
			{{ /list_sections }}
			
		</ul>
    </div>

    <div style="display: none;">
		  <div id="inline1">
      <h1>Ups! Werbung?</h1>
      <p>Ja, Werbung für Medienvielfalt in Bern. Seit mehr als zwei Jahren berichtet Journal B über Politik, Kultur und Alltag. Finanziert durch Mitgliederbeiträge.</p>
<p>Herzlichen Dank, wenn auch Sie in Zukunft Journal B unterstützen!</p>

<a href="http://www.journal-b.ch/de/static/mitglied" class="btn" style="margin-right:10px">Jetzt Mitglied werden!</a>
    </div>
	</div>

	<div class="footer-box section-blogs">
		<div class="caption"><a href="/de/blogs">Blogs</a></div>
		<ul>
			{{$array = []}}
			{{$count = 0}}
		{{ list_articles length="50" order="byPublishDate desc" constraints="issue is 5 onFrontPage is on" ignore_section="true" ignore_issue="true" }}

		{{ if !in_array($gimme->article->section->number, $array) && ($count < 5) }}

			<li class="noOverflow"><a href="{{ uri options="section" }}" title="{{ $gimme->article->section->name|strip_tags }}" class="tooltip">{{ $gimme->article->section->name|truncate:21:"...":false  }}</a></li>

			{{$array[]=$gimme->article->section->number}}
			{{$count=$count+1}}

		{{/if}}

		{{ /list_articles }}
		<li><a id="various1" href="#inline1">PopUP</a></li>
		</ul>



	</div>

	<div class="footer-box section-dossiers">
		{{ set_issue number="4" }}
		<div class="caption"><a href="{{ url options="issue" }}">Dossiers</a></div>
		<ul>
		{{ list_articles length="5" order="byLastUpdate desc" ignore_section="true" }}

			<li class="noOverflow noWrap"><a href="{{ uri options="article" }}" title="{{$gimme->article->name|strip_tags}}" class="tooltip">{{$gimme->article->name|truncate:21:"...":false }}</a></li>
		{{ /list_articles }}

		</ul>

	</div>

	<div class="footer-box section-front">
		{{ set_issue number="1" }}
		{{ set_section number="1" }}
		<div class="caption">Journal B</div>
		<ul><li>
		{{ list_articles length="10" order="byPublishDate desc" }}
			<a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a>
			{{ if not $gimme->current_list->at_end }}|{{ /if }}
		{{ /list_articles }}
		</li></ul>

		<div class="caption">Services</div>
		<ul><li>
		<a href="/favorites">Favoriten</a> |
		<a href="javascript:$('.header .icon-search').click()">Suche</a> |
		<a href="http://journalb.disqus.com/community.html?lang=de_formal" class="community-popup" onclick="if (checkDisqusApi()) {DISQUS.dtpl.actions.fire('community.show'); return false;}">Community</a> |
		<span class="community-rss">
			<a href="http://{{ $gimme->publication->site }}/de/static/rss/">RSS</a> |
		</span>
		<a href="http://eepurl.com/pgobL">Newsletter</a> |
		<a href="http://www.facebook.com/journalb.bern">Facebook</a> |
		<a href="http://twitter.com/journalb">Twitter</a>
		</li></ul>
	</div>

	<div style="clear: both"></div>

</div>

<div class="partners">
	<span class="caption">PARTNER</span>
	<a href="http://www.appswithlove.com">Apps with love</a> |
	<a href="http://www.sourcefabric.org">Sourcefabric</a> |
	<a href="http://www.radio-gelb-schwarz.ch">Radio Gelb-Schwarz</a>
</div>


<!-- UI asset caching -->
<div class="preload hidden">
	<img src="{{ url static_file='_img/favorite-black.png' }}" height="44" width="44">
	<img src="{{ url static_file='_img/control-favorite-black.png' }}" height="39" width="43">
	<img src="{{ url static_file='_img/control-fontize-black.png' }}" height="39" width="43">
	<img src="{{ url static_file='_img/control-share-black.png' }}" height="39" width="43">
</div>