{{ if !$gimme->search_articles_action->defined }} 
    <div class="search" style="max-width: 100% !important; overflow: hidden;">
    	{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"hidden\"" }}
			<h6 class="search-keywords">
				{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suche...\"" }}
			</h6>
	    	<div class="searchsubmit"><input type="image" class="icon icon-search" title="Suchen" value="suchen" name="f_search_articles" src="{{ url static_file='_img/search.png' }}" /></div>
	    {{ /search_form }}
    </div>	
{{ /if }}