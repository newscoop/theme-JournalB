{{ include file="_tpl/_html-head.tpl" }}
<!-- 404.tpl -->
<body id="body" class="article-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">
		
			{{ if !($gimme->url->is_valid) }}
			  <h1>Fehler 404, Entschuldigung.</h1>
			  <h2>Die angeforderte Seite wurde nicht gefunden.</h2>
			{{ /if }}
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
