{{ image rendition="topfront" }}<img src="{{ $image->src }}" style="display: none;" />{{ /image }}
<a class="content-single newsbox section-ad layoutbgimage" href="{{ $gimme->article->link }}" target="_blank"
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<div class="info_block">
	{{ if $gimme->article->who }}
		<div class="info_ad">Anzeige</div>
		<div class="info_who info_bg">
			<h1><span>{{ $gimme->article->who }}</span></h1>
		</div>
	{{ else }}
		<div class="info_ad info_bg">Anzeige</div>
	{{ /if }}
	</div>	
</a>
