{{ if preg_match("/iPhone; Journal/", $smarty.server.HTTP_USER_AGENT) }}
	{{ include file="_tpl/search-controlbar.tpl" }}
{{ else }}
	<div class="aare">
		Aare<br><span class="wert"></span>&deg;
	</div>
	
	<h1 class="logo" onclick="document.location.href='/'">
		<a href="/">Journal B</a>
	</h1>
	
	{{ if !$gimme->search_articles_action->defined }} 
	<div class="search">
		{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"hidden\"" }}
			<div class="searchsubmit"><input type="image" class="icon icon-search" title="Suchen" value="suchen" name="f_search_articles" src="{{ url static_file='_img/search.png' }}" /></div>
		{{ /search_form }}
	</div>
	{{ /if }}
{{ /if }}