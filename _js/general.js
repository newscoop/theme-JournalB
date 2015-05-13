/* -- DEBUG -- */
if (!NATIVE_APP && typeof DEBUG_MODE != 'undefined' && DEBUG_MODE) {
	localStorage.clear();
	var p = "/themes/publication_";
	destroyLessCache(p + "1/theme_1/_css/");
	destroyLessCache(p + "2/theme_1/_css/");
	destroyLessCache(p + "3/theme_4/_css/");
}
/* --- */

$(window).resize(function() { updateScreenMode(); });

$(document).bind("changeScreenMode",function(){
	if (beforeScreenMode<=2 && screenMode>2)
	{
		$(".article-community.mobile").html($(".article-community.stable").html());
		$(".article-community.stable").html("");
		collapsableElements();
	}
	else if (beforeScreenMode>2 && screenMode<=2)
	{
		$(".article-community.stable").html($(".article-community.mobile").html());
		$(".article-community.mobile").html("");
		collapsableElements();
	}
});

// Reverse plugin
jQuery.fn.reverse = [].reverse;

var document_loaded = false;

function isDocumentLoaded()
{
	return document_loaded;
}

// When the DOM is loaded
$(document).ready(function() {


	  $('.photoViewer').magnificPopup({type:'image'});




	//calculateNewsboxOverflow(); // library.js

	adjustNewsrows();				// library.js

	//articleImageAlts();		// library.js

	setupFavorites();				// faves.js

	setupSliderBox();				// library.js

	controlIconsHover();		// library.js

	initShareButton();			// community.js

	fixAdsAnimated();				// community.js

	aareTemperaturen();			// library.js

	loadFontSize();					// library.js

	updateScreenMode();			// library.js

	//collapsableElements();// library.js

	scrollToArticleTop();		// library.js

	if (NATIVE_APP && $("body").hasClass("article-page"))
		pinchArticle();				// library.js

	document_loaded = true;

	loadCommunity();				// community.js
});
