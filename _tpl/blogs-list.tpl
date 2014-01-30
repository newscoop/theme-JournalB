{{ assign var="blogs_on_page" value="10" }}

<div class="newsrows dynrows temprows">
	{{ list_sections order="byNumber desc" length="`$blogs_on_page`" }}
		
		<div class="newsbox content-single section-blogs layoutsimple" style="cursor: auto !important;">

			<div class="newsboxcontent">
				<h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
				<description>
					{{ $publish_date = false }}
					{{ list_articles length="3" }}
						<div class="dsect">
						<a href="{{ url options="article" }}">
							<div class="description">
								<span class="capitalize">{{ $gimme->article->author->name }}</span>
								<span class="subtitle">{{ $gimme->article->name }}</span>
							</div>
							<div class="info">
								<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
								<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
							</div>
						</a>
						</div>
					{{ /list_articles }}
				</description>
			</div>
			
		</div>
				
	{{ /list_sections }}
</div>