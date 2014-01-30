<div class="content-single newsbox section-blogs layoutlist front-blogs">
	<div class="newsboxcontent noOverflow">
		<h2><a href="/de/blogs">Neuste Blogs</a></h2>
		<description>
			{{ list_articles length="3" order="byPublishDate desc" constraints="issue is 5 onFrontPage is on" ignore_section="true" ignore_issue="true" }}
				<div class="dsect">
					{{$len =  $gimme->article->section->name + $gimme->article->name|strlen }}
					{{$trunc = false }}
					{{$truncLen = 80}}

					{{if $len > 80 }}
						{{$trunc = true }}
						{{$truncLen = 80 - $gimme->article->section->name|strlen}}

					{{/if}}


				<a href="{{ url options="section" }}"  >
					<div class="description {{if $trunc }} tooltip{{/if}}" title="{{$gimme->article->name|strip_tags}}"  >
						<span class="capitalize">{{ $gimme->article->section->name }}</span>

						<span class="subtitle" >{{ $gimme->article->name|truncate:$truncLen:"...":false }}</span>
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

<div class="content-single newsbox section-dossiers layoutlist front-dossiers">
	<div class="newsboxcontent noOverflow">
		<h2><a href="/de/dossiers">Aktuelle Dossiers</a></h2>
		<description>
			{{ list_articles length="3" order="byLastUpdate desc" constraints="issue is 4" ignore_section="true" ignore_issue="true" }}
				<div class="dsect">
					<a href="{{ url options="article" }}"  >
						{{$aname= $gimme->article->name}}
						{{$alength = $gimme->article->name|strlen}}

						{{list_related_articles length="1"}}

						{{$len =  $alength + $gimme->article->name|strlen }}
						{{$trunc = false }}
						{{$truncLen = 80}}

						{{if $len > 80 }}
							{{$trunc = true }}
							{{$truncLen = 80 - $alength}}

						{{/if}}

						<div class="description {{if $trunc }} tooltip {{/if}}" title="{{$gimme->article->name|strip_tags}}" >
							<span class="capitalize">{{ $aname }}</span>
							<span class="subtitle">{{$gimme->article->name|truncate:$truncLen:"...":false}}</span>
						</div>
						<div class="info">
							<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> |
							<time>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</time>
						</div>
						{{/list_related_articles}}
					</a>
				</div>
			{{ /list_articles }}
		</description>
	</div>
</div>