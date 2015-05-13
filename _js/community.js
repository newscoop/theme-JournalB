function initShareButton()
{
	// ** Share
	$('.share').click(function() {
		if (NATIVE_APP) {
			window.location = "shr://share_article";
		} else {
			var sharebox = $('.main .sharebox');
			if (sharebox.hasClass('initial')) {
				sharebox
					.addClass('hidden').removeClass('initial')
					.css({ position:'', visibility:'' }) // fix visibility for Facebook
					.find('.shareicon.hidden').removeClass('hidden'); // unhide G+
			}
			if (sharebox.hasClass('hidden')) {
				sharebox.slideDown("fast").removeClass('hidden');
				$(this).addClass('checked');
			} else {
				sharebox.slideUp("fast").addClass('hidden');
				$(this).removeClass('checked');
			}
		}
	});
	// - Share
}

function scaleCommunity()
{
	// Scale community (requires reverse), allow max. 3 comments on top
	var max_height = $('.main').height() - 100,
		sidebar = $('.sidebar');
	if (!sidebar.hasClass('preview')) {

        $('.commentbox', sidebar).reverse().each(function() {
		    if ($(sidebar).height() > max_height) $(this).hide();
		});

		//$('.supportbox', sidebar).after($('.commentbox:gt(2)', sidebar));
		// Enable external community links
		$('.description:contains("http://")', sidebar).each(function() {
			if ($('a', this).length > 0) return;
			$(this).html(urlify($(this).text(), true));
		});
	}
	// Ensure no double bars
	$('.socialbox').each(function() {
		if (!$(this).prev().hasClass('layoutsimple')) {
			$(this).css('border-top', 'none').css('padding-top', '0');
		}
	});
}

// Draw random ads on every page, and cycle them
function drawAds()
{
	var community_count = $(".sidebar .content .community-item").length;
	var pos1 = Math.floor(Math.random()*community_count);
	var ads_count = $(".community-ads .adbox").length;
	var current_ad_shift = getCookie("adShift");
	if (!current_ad_shift) current_ad_shift = 0; else current_ad_shift = parseInt(current_ad_shift);
	var ad1 = current_ad_shift + 1;
	if (ad1>ads_count) {
		ad1 = 1;
		current_ad_shift = 0;
	}
	current_ad_shift = ad1;
	setCookie("adShift",current_ad_shift,7);
	if (ad1) $(".community-ads .adbox:nth-child("+ad1+")").insertAfter($(".sidebar .content .community-item")[pos1]);
}

// Enable GIF animations in ads
function fixAdsAnimated()
{
	// Select all images in 'ad' articles
	$("article.ad img.image-link.responsive").each(function() {
		// Obtain current url(..) path to the image
		u = this.src;
		// Apply additional criteria to ensure target crop format
		if (u.indexOf('/cache/')<0 || u.indexOf('.gif')<0) return;
		// Use a regular expression to trim the crop path out
		re = /cache\/[0-9]+x[0-9]+\/(crop[_0-9]*|fit)\/+images%7C/
		v = u.replace(re, '');
		// For debugging, output the result
		//console.log(v);
		// Set the new path to the original image
		this.src = v;
	});
}

// Load sidebar using Ajax
function loadCommunity()
{
	$.get('/mobile/community', function(data) {
		$('#community').html(data);

		scaleCommunity();

		drawAds();
	});
	if (NATIVE_APP) {
    	// Move comment counts into info - necessary because Newscoop chokes on A inside of A
		$(".newsrows .commentcount").each(function(){
			$(this).prev().find(".info,.info_block").first().prepend(this);
		}).removeClass('hidden');
	} else {
		$(".newsrows .commentcount").attr('href','');
	}
}
