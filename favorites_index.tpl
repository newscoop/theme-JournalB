{{ include file="_tpl/_html-head.tpl" }}
<!-- favorites_index.tpl -->
<body id="body" class="front-page">

<div class="prevent-horizontal-scroll">
<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">		

			{{ if $view->articles }}
				<div class="newsrows dynrows temprows">
					{{ foreach $view->articles as $article }}

						{{ $article_section = $article->section->url_name }}
						{{ if $article->issue->url_name == "blogs" }} {{ $article_section = "blogs" }} {{ /if }}
						{{ if $article->issue->url_name == "dossiers" }} {{ $article_section = "dossiers" }} {{ /if }}
						
						{{ $article_author = "" }}
						{{ if $article->authors|@count gt 0 }}
							{{ $article_author = "`$article->authors[0]->first_name` `$article->authors[0]->last_name`" }}
						{{ /if }}
						
						{{ if $article->frontpage_doubleview or $article->frontpage_image }}
							{{ include file="_tpl/newsbox-bgimage-favorites.tpl" }}
						{{ else }}
							{{ include file="_tpl/newsbox-simple-favorites.tpl" }}
						{{ /if }}
						
					{{ /foreach }}
				</div>

			{{ else }}
				<div class="mcontentbar">
				{{ if $view->nologin }}
				
					<h3>Bitte melden Sie sich in der Journal-B-Community an, um Artikel zu favorisieren und ein persönliches Archiv anzulegen.</h3>
				
				{{ else }}

					<h3>Sie haben noch keine Artikel favorisiert.</h3>
					
				{{ /if }}
				</div>
			{{ /if }}
			
		</div><!-- /content -->

	</div><!-- /main -->

	<div class="sidebar">

		{{ include file="_tpl/community-header.tpl" }}

		<div class="row content">
			
			<div id="community"></div>
			
			{{ include file="_tpl/community-front.tpl" }}

		</div>

	</div>
		
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
