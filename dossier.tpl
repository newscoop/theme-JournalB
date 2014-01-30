{{ include file="_tpl/_html-head.tpl" }}
<!-- dossier.tpl -->
<body id="body" class="section-page">

<div class="prevent-horizontal-scroll">
<div class="container">

    <div class="main">

		{{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/dossier-article-content.tpl" }}

        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            {{ include file="_tpl/adsense.tpl" }}
            <div id="community"></div>

        </div>

    </div>

	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
