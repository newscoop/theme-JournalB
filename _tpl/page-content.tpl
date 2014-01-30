<div class="addbar"></div>

<div class="contentbar section-page">

	{{ include file="_html/control-sharebox.html" }}
		
	<article class="page">
		{{ if $gimme->article->content_accessible }}    
		
			<a name="mobile_startpoint"></a>
		
			<header>
			
				<h1>{{ $gimme->article->name }}</h1>
						
				{{ include file="_tpl/article-gallery.tpl" }}
				
			</header>

			<div class="mcontentbar">
						
				<div class="font-sens">{{ $gimme->article->full_text }}</div>
								
				<div style="clear:both"></div>
			</div>
								
		{{ else }}        
			<p><em>403</em></p>
		{{ /if }}
	</article>
	
	<div class="article-community mobile"></div>
			
</div>
