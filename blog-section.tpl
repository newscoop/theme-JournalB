{{ include file="_ads/_ismobdevice.tpl" }}
{{ include file="_tpl/_html-head.tpl" }}
<!-- blog-section.tpl -->
<body id="body" class="section-page">
{{ include file="_tpl/detect-fontsize.tpl" }}

<div class="prevent-horizontal-scroll">
<div class="container">

    {{ include file="_ads/billboard.tpl" }}

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/mobile-controlbar.tpl" }}

			<div class="addbar">
				{{ include file="_html/control-icons.html" }}
			</div>

			<div class="contentbar">
				{{ include file="_html/control-sharebox.html" }}
				{{ dynamic }}
				{{ $params = implode(',', array($gimme->url->get_parameter("ls-art0"), $gimme->url->get_parameter("ls-art1"))) }}
				{{ render file="_tpl/blogs-articles.tpl" params=$params cache=3600 }}
				{{ /dynamic }}
			</div>

        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            {{ include file="_ads/adsense.tpl" }}
			{{ include file="_tpl/community-sectionbox.tpl" }}

            <div id="community"></div>

            {{ include file="_ads/skyscraper.tpl" }}

        </div>

    </div>

	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
