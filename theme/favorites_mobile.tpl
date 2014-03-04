{{php}}
	header('Content-type: application/json');	
{{/php}}

{{ $sections = array() }}
{{ $articles = array() }}

{{ list_articles length="50" constraints="issue greater 2" }}

	{{ if $gimme->section->url_name == "alltag" or $gimme->section->url_name == "politik" or $gimme->section->url_name == "kultur" }}

		{{ if !$articles[$gimme->section->url_name] }} 
			{{ $articles[$gimme->section->url_name] = array() }} 
		{{ /if }}
		
		{{ $article = array() }}
		{{ $article["url"] = {{ uri options="article" }} }}
		{{ $article["time"] = $gimme->article->publish_date|strtotime }}
		{{ $articles[$gimme->section->url_name][] = $article }}
		
		{{ if !$sections[$gimme->section->url_name] }} 
			{{ $sections[$gimme->section->url_name] = array() }}
			{{ $sections[$gimme->section->url_name]["url"] = "/mobile/"|cat:$gimme->section->url_name }}
			{{ $sections[$gimme->section->url_name]["time"] = $gimme->article->publish_date|strtotime }}
		{{ else }}
			{{ if $article["time"] > $sections[$gimme->section->url_name]["time"] }} {{ $sections[$gimme->section->url_name]["time"] = $article["time"] }} {{ /if }}
		{{ /if }}
	{{ /if }}
	
{{ /list_articles }}

{{ $sections["favorites"] = array() }}
{{ $sections["favorites"]["url"] = "/favorites" }}
{{ $sections["favorites"]["time"] = $favorites_time }}

{{ $articles["favorites"] = array() }}
{{foreach from=$faves item=article}}
    {{ $articles["favorites"][] = $article }}
{{/foreach}}

{{ $sections["front"] = array() }}
{{ $sections["front"]["url"] = "/" }}
{{ $sections["front"]["time"] = 0 }}
{{foreach from=$sections item=section}}
    {{ if $section["time"] > $sections["front"]["time"] }} {{ $sections["front"]["time"] = $section["time"] }} {{ /if }}
{{/foreach}}

{{ $articles["sections"] = array() }}
{{foreach from=$sections item=section}}
    {{ $articles["sections"][] = $section }}
{{/foreach}}


{{ $view->json($articles) }}