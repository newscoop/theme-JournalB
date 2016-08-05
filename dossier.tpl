{{ include file="_ads/_ismobdevice.tpl" }}
{{ include file="_tpl/_html-head.tpl" }}
<!-- dossier.tpl -->
<body id="body" class="section-page">

<div class="prevent-horizontal-scroll">
<div class="container">

{{ include file="_ads/billboard.tpl" }}

    <div class="main">

		{{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/dossier-article-content.tpl" }}

        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            <div class="row googlead ">
            {{ include file="_ads/adsense.tpl" }}
        </div>
            <div id="community"></div>

            {{ include file="_ads/skyscraper.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
