<div class="row header">

    <div class="row nav">
        <ul>
			{{ if $gimme->section->url_name == 'alltag' || $gimme->section->url_name == 'politik' || $gimme->section->url_name == 'kultur' }} 
				{{ $tpl_subsections = true }} 
			{{ else }} 
				{{ $tpl_subsections = false }} 
			{{ /if }}
			<li class="nav-front"><a href="/">Front</a></li>
			<li class="nav-alltag {{ if $tpl_subsections and $gimme->section->url_name != 'alltag' }}unactive{{ /if }}"><a href="/mobile/alltag">alltag</a></li>
			<li class="nav-politik {{ if $tpl_subsections and $gimme->section->url_name != 'politik' }}unactive{{ /if }}"><a href="/mobile/politik">politik</a></li>
			<li class="nav-kultur {{ if $tpl_subsections and $gimme->section->url_name != 'kultur' }}unactive{{ /if }}"><a href="/mobile/kultur">kultur</a></li>
			<li class="nav-fav"><a href="javascript: goToFavorites();" style="background-size:0">Favoriten</a></li>
			<div class="clear"></div>
        </ul>
    </div>

    <div class="aare">
        Aare<br><a class="wert" title="Bundesamt für Umwelt" href="http://www.hydrodaten.admin.ch/de/2135.html" target="_blank"></a>&deg;
    </div>
    <time>{{$smarty.now|camp_date_format:"%d.%m.%Y"}} </time>

    <h1 class="logo" onclick="document.location.href='/'">
        <a href="/">Journal B</a>
    </h1>
    
    {{ if !$gimme->search_articles_action->defined }} 
    <div class="search">
    	{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"hidden\"" }}
	    	<input type="image" class="icon icon-search" title="Suchen" value="suchen" name="f_search_articles" src="{{ url static_file='_img/search.png' }}" style="display:block" />
	    {{ /search_form }}
    </div>
    {{ /if }}

    <div class="subtitle">Sagt, was Bern bewegt</div>

</div>