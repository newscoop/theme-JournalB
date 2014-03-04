
{{ if not $gimme->section->description == "" }}
	<div class="row adbox authorbox">
		<div class="community-title grey">Zum Thema</div>
		<div class="description">
			{{ $gimme->section->description }}
		</div>
	</div>
{{ /if }}