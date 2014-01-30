{{ include file="_tpl/_html-head.tpl" }}
<!-- static_section.tpl -->
<body id="body" class="static-page">

<div class="prevent-horizontal-scroll">
<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">

<div class="addbar"></div>
<div class="contentbar section-page">
	
	{{ include file="_html/control-sharebox.html" }}
	
	<article class="page">
			<a name="mobile_startpoint"></a>
			<header>
			
				<h1>{{ $gimme->section->name }}</h1>	
				
				<script type="text/javascript"> var is_gallery = false; </script>
			</header>
			<div class="mcontentbar"><div class="font-sens">
				
				{{ $gimme->section->description }}

				<div style="clear:both"></div>
			</div></div>				
			</article>
		    <div class="article-community mobile"></div>
		</div>
			
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
