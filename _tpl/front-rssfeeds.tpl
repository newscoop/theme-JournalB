
<div class="content-single newsbox section-rss layoutlist">
	<div class="newsboxcontent">
		<h2><a target="_blank" href="http://infosperber.ch/">Infosperber</a></h2>
		<description id="rss-infosperber">
			Lade RSS Feeds...
		</description>
	</div>
</div>

<div class="content-single newsbox section-rss layoutlist">
	<div class="newsboxcontent">
		<h2><a target="_blank" href="http://www.woz.ch/">WOZ</a></h2>
		<description id="rss-woz">
			Lade RSS Feeds...
		</description>
	</div>
</div>

{{*
<div class="content-single newsbox section-rss layoutlist">
	<div class="newsboxcontent">
		<h2><a target="_blank" href="http://www.kulturagenda.be/">Kulturagenda</a></h2>
		<description id="rss-kulturagenda">
			Lade RSS Feeds...
		</description>
	</div>
</div>
*}}

{{* No fucking idea how compiling in this project works because it's not documented. So here a taste of inline code. *}}
<script>
(function($){
	$.extend({
		rss : function(url, fnk, num, element, key){
		  // Make sure url to get is defined
		  if(url == null) return false;
		  // Build Google Feed API URL
		  var gurl = "https://intern.journal-b.ch/feedreader/feedreader.php?v=1.0&callback=?&q="+url;
		  if(num != null) gurl += "&num="+num;
		  if(key != null) gurl += "&key="+key;

		  console.log("Feed URL: " + url);

		  element = null || element;
		  // AJAX request the API
		  $.getJSON(gurl, function(data){
		  	console.log("Result: ");
		  	console.log(data);
		  	if(data.responseStatus == 200){
		        if(typeof fnk == 'function')
		                  fnk.call(this, data.responseData.feed, element);
		                else
		                  return false;
		    } else {
		    	fnk.call(this, null, element);
		    }
		  });
		}
	});

	// RSS Feeds to get with HTML element id to fill
	var rssFeeds = [
		{id: "#rss-infosperber", url: "http://infosperber.ch/inc/rss.cfm"},
		{id: "#rss-woz", url: "http://www.woz.ch/t/startseite/feed"}
		//{id: "#rss-kulturagenda", url: "http://www.kulturagenda.be/website/export/rss/"}
	];

	// Go through feeds and get latest 3 elements and render them in the HTML element
	for (var x=0;x<rssFeeds.length;x++)
	{

		$.rss(rssFeeds[x].url,
		function(feeds, element){
			var placeholder = $(element).clone().empty();
			if(!feeds){
			  // there was an error
			  placeholder.append("Feed momentan nicht erreichbar");
			}
			else {
				// Show content. Clone to prevent DOM reflow
				var placeholder = $(element).clone().empty();
				for(var i=0; i<feeds.entries.length; i++){
				  var entry = feeds.entries[i];
				  console.log(entry);
				  // Entry title
				  var htmlOutput = renderTemplate(entry.link, entry.title, entry.publishedDate);
				  placeholder.append(htmlOutput);
				}
			}

			$(element).replaceWith(placeholder);
		}, 3, $(rssFeeds)[x].id);
	}
})(jQuery);

// Render RSS Entries for HTML infobox and return HTML
function renderTemplate(url, title, date) {
	var publishDate = new Date(date);
	var day = publishDate.getDate() < 10 ? "0" + publishDate.getDate() : publishDate.getDate();
	var month = (publishDate.getMonth() + 1) < 10 ? "0" + (publishDate.getMonth() + 1) : (publishDate.getMonth() + 1);
	var year = publishDate.getFullYear();
	var entryDate = day + "." + month + "." + year;
	var template = '<div class="dsect">' +
						'<a target="_blank" href="' + url + '">' +
							'<div class="description">' +
								'<span class="subtitle">' + title + '</span>' +
							'</div>' +
							'<div class="info">' +
								'<date>' + entryDate + '</date>' +
							'</div>' +
						'</a>' +
					'</div>';
	return template;
}
</script>
