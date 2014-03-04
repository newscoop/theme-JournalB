<div class="newsrows dynrows temprows">
<!-- /start articlerows/ -->

{{ set_current_issue }}
{{ set_default_section }}

{{ if $gimme->section->number }}
  {{ $condition = "OnSection" }}
  {{ $show_blogs = false }}
{{ else }}
  {{ $condition = "OnFrontPage" }}
  {{ $show_blogs = true }}
{{ /if }}

{{ $articles_on_page = 30 }}
{{ $blogs_pos = 8 }}
{{ $feeds_pos = 6 }}

{{ $ads_first_position = 5 }}
{{ $ads_interval = 10 }}

{{ $ads = array() }}
{{ $ads_num = 0 }}
{{ $ads_rendered = 0 }}
{{ $ads_shift = $smarty.cookies.ads_shift }}
{{ if !$ads_shift }} {{ $ads_shift = 0 }} {{ /if }}

{{ $start = $gimme->url->get_parameter("ls-art0") }}
{{ $start2 = $gimme->url->get_parameter("ls-art1") }}

{{ if !$start and !$start2 }}
	{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue is 2 type is ad onFrontPage is on" }}
		{{ $ads[$ads_num] = {{ include file="_tpl/newsbox.tpl" }} }}
		{{ $ads_num = $ads_num + 1 }}
	{{ /list_articles }}
{{ /if }}

{{ $articles_num_1 = 0 }}
{{ $articles_num_2 = 0 }}
{{ $articles_num_total_1 = 0 }}
{{ $articles_num_total_2 = 0 }}

{{$articles_num_doubles = 0 }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 3 `$condition` is on" length="{{ $articles_on_page }}" }}
  {{ if ($start + $articles_num_1 - $ads_rendered - $articles_num_doubles)==$blogs_pos and $show_blogs }} {{ include file="_tpl/front-blogsdossiers.tpl" }} {{ /if }}

  {{ if ($start + $articles_num_1 - $ads_rendered - $articles_num_doubles)==$feeds_pos and $show_blogs }} {{ include file="_tpl/front-rssfeeds.tpl" }} {{ /if }}



  {{* If not all ads are rendered yet, it's first ad position and interval is matching, render an ad *}}
  {{ if ($ads_rendered < $ads_num) and ($articles_num_1 >= $ads_first_position) and (($articles_num_1 - $ads_first_position) % $ads_interval == 0) }}
    {{ $ads[($ads_shift + $ads_rendered) % $ads_num] }}
    {{ $ads_rendered = $ads_rendered + 1 }}

  {{ /if }}

  {{ include file="_tpl/newsbox.tpl" }}

{{* counting doubleview articles to position rssfeeds *}}
  {{ if $gimme->article->frontpage_doubleview }}
    {{ $articles_num_doubles = $articles_num_doubles + 1 }}
  {{/if}}


  {{ $articles_num_1 = $articles_num_1 + 1 }}
  {{ $articles_num_total_1 = $gimme->current_list->count }}
{{ /list_articles }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 6 `$condition` is off" length="{{ $articles_on_page - $articles_num_1 }}" }}
  {{ if ($articles_on_page - $articles_num_1)>0 }}
	{{ if ($ads_rendered < $ads_num) and (($articles_num_1 + $articles_num_2 - $ads_first_position) % $ads_interval == 0) }}
		{{ $ads[($ads_shift + $ads_rendered) % $ads_num] }}
		{{ $ads_rendered = $ads_rendered + 1 }}
	{{ /if }}

    {{ include file="_tpl/newsbox.tpl" }}

    {{ $articles_num_2 = $articles_num_2 + 1 }}
  {{ /if }}
  {{ $articles_num_total_2 = $gimme->current_list->count }}
{{ /list_articles }}

{{ if !$start and !$start2 }}
	{{ php }} setcookie('ads_shift', {{ ($ads_shift + $ads_rendered) % $ads_num }} ); {{ /php }}
{{ /if }}

{{ if ($start + $articles_num_1) < $articles_num_total_1 or ($start2 + $articles_num_2) < $articles_num_total_2 }}
  <div class="weitere" style="clear:both">
    <div class="wline"></div>
    <a href="{{ url options="section" }}?ls-art0={{ $start + $articles_num_1 }}&ls-art1={{ $start2 + $articles_num_2 }}" onclick="return loadWeitereArtikel(this);">weitere Artikel</a>
  </div>
{{ /if }}

<!-- /end articlerows/ -->
</div>

<!-- Hidden Disqus on Frontpage -->
<div class="hidden">
  <div id="disqus_thread"></div>
</div>
