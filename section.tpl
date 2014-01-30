{{ include file="_tpl/_html-head.tpl" }}
<!-- section.tpl -->
<body id="body" class="section-page">

<div class="prevent-horizontal-scroll">
<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">

			{{ include file="_tpl/mobile-controlbar-front.tpl" }}
			{{ dynamic }}
			{{ $params = implode(',', array($gimme->url->get_parameter("ls-art0"), $gimme->url->get_parameter("ls-art1"))) }}
			{{ render file="_tpl/newsrows.tpl" params=$params cache=3600 }}
			{{ /dynamic }}

		</div><!-- /content -->

	</div><!-- /main -->

	<div class="sidebar">

		{{ include file="_tpl/community-header.tpl" }}

		<div class="row content">
			
			<div id="community"></div>

		</div>

	</div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
