{{ include file="_tpl/_html-head.tpl" }}
<!-- article.tpl -->
<body id="body" class="article-page">
{{ include file="_tpl/detect-fontsize.tpl" }}

<div class="prevent-horizontal-scroll">
<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">
		
	        {{ include file="_tpl/article-content.tpl" }}
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
			<div class="article-community stable">
				{{ include file="_tpl/article-community.tpl" }}
			</div>
			
            <div id="community"></div>

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->
</div>

{{ include file="_tpl/_html-foot.tpl" }}
