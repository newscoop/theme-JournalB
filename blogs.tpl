{{ include file="_tpl/_html-head.tpl" }}
<!-- blogs.tpl -->
<body id="body" class="section-page">

<div class="prevent-horizontal-scroll">
<div class="container">

    {{ include file="_ads/billboard.tpl" }}

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">

	        {{ include file="_tpl/blogs-list.tpl" }}

        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            {{ include file="_ads/adsense.tpl" }}
            <div id="community"></div>

            {{ include file="_ads/skyscraper.tpl" }}

        </div>

    </div>

	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
