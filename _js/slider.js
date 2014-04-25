var slider;
var slider_box;
var current_slide;
var before_slide;
var slides_num;
var slider_easing = false;
var slider_status = false;
var full_images_loaded = 0;

function initSlider()
{
	slider = $("#slider");
	slider_box = $("#slider_box");

	current_slide = 1;
	slides_num = $(slider).children("ul").children("li").length;
	$(slider).children("ul").children("li:first").show();

	$(slider).append('<div class="gallery_info stable"><div class="gallery_status"><span class="gallery_current"></span>&nbsp;/&nbsp;<span class="gallery_all"></span></div><div class="gallery_control"></div><div class="gallery_description"></div></div>');
	$(".gallery_all").html(slides_num);
	$(".gallery_current").html(current_slide);
	$(".gallery_description").html($(slider).children("ul").children("li:first").children(":first").attr("alt"));

	if (slides_num==1)
	{
		$(slider_box).addClass("one_slide");
		if ($("#slider li").hasClass("sli_video"))
		{
			$(slider_box).addClass("video_only");
			$(slider_box).addClass("video_current");
			$(".gallery_control").append('<div class="videopict"></div>');
		}
	}
	else if ($(slider).children("ul").children("li:nth-child(1)").hasClass("sli_video"))
	{
		$(slider_box).addClass("video_current");
	}

	updateSliderSize();

	if (MOBILE_WEB)
	{
		if (slides_num>1) $(".gallery_control").append('<div class="gpict"></div>');

		$("#slider_box").touchwipe({
			wipeRight: "moveSlider(0);",
			wipeLeft: "moveSlider(1);",
			wipeNone: "changeSliderStatus();",
			min_move_x: 10,
			min_move_y: 10,
			preventDefaultEvents: false
		});

		$("#slider ul").bind('gestureend',function(e){
			if (!slider_status && e.originalEvent.scale > 1.0) {
				changeSliderStatus();
			}
		});

	}
	else
	{
		if (slides_num>1)
		{
			$(".gallery_control").append('<div class="arrow left"></div>');
			$(".gallery_control").append('<div class="arrow right"></div>');
			$(".gallery_control").append('<div style="clear:both"></div>');
			$(".gallery_control").children(".arrow.left").click(function(){ moveSlider(0); });
			$(".gallery_control").children(".arrow.right").click(function(){ moveSlider(1); });
		}

		$("#slider ul").click(function(){
			changeSliderStatus();
		});
	}

	updateSliderSize();

	$(document).bind("changeScreenMode",function(){
		updateSliderSize();
	});


	var photo = $('.article_info .author[type="Photographer"]').html();
	if (photo)
	{
		$("#slider img").each(function(){
			if ($(this).attr("alt")!="") $(this).attr("alt",$(this).attr("alt")+"<br><br>");
			$(this).attr("alt",$(this).attr("alt")+"Foto: "+photo+"");
		});
		$(".gallery_description").html($(slider).children("ul").children("li:nth-child("+current_slide+")").children(":first").attr("alt"));
	}


}

function moveSlider(direction)
{
	if (MOBILE_WEB && !slider_status) return;

	if (slider_easing) return;

	if (slides_num==1) return;

	slider_easing = true;

	before_slide = current_slide;

	if (direction == 1) current_slide++; else current_slide--;
	if (current_slide==0) current_slide = slides_num;
	if (current_slide==slides_num+1) current_slide = 1;

	$(".gallery_description").fadeOut();

	$(slider).children("ul").children("li:nth-child("+before_slide+")").animate({
			opacity: 0.3
		}, 500, function() {

			$(slider).children("ul").children("li:nth-child("+current_slide+")").css("opacity",0.3);
			$(slider).children("ul").children("li:nth-child("+current_slide+")").show();
			$(slider).children("ul").children("li:nth-child("+before_slide+")").hide();

			$(".gallery_description").html($(slider).children("ul").children("li:nth-child("+current_slide+")").children(":first").attr("alt"));
			$(".gallery_description").fadeIn();
			$(".gallery_current").html(current_slide);

			if ($(slider).children("ul").children("li:nth-child("+current_slide+")").hasClass("sli_video"))
			{
				$(slider_box).addClass("video_current");
			}
			else
			{
				$(slider_box).removeClass("video_current");
			}

			if ($(slider).children("ul").children("li:nth-child("+current_slide+")").children()[0].tagName=="OBJECT") $(slider).addClass("video"); else $(slider).removeClass("video");


			$(slider).children("ul").children("li:nth-child("+current_slide+")").animate({
					opacity: 1
				}, 500, function(){
					slider_easing = false;
				}
			);
		}
	);

}


function changeSliderStatus()
{
	if (slider_status)
	{
		hideActiveSlider();
	}
	else
	{
		showActiveSlider();
	}
}


function updateSliderSize()
{
	var window_height = window.innerHeight;
	var window_width = window.innerWidth;


	$(slider).height($(slider).width()*0.6702);

	if (slider_status)
	{
		if ($(slider).height() > window_height)
		{

			$(slider).height(window_height);

			$(slider).width($(slider).height()/0.6702);

		}

		$(slider).css("margin-top",(window_height-$(slider).height())/2+"px");
		$(slider).css("margin-left",(window_width-$(slider).width())/2+"px");
	}
	else
	{
		$(slider).css("margin-top","0px");
		$(slider).css("margin-left","0px");
	}

	$("#slider ul img").css("max-height",$(slider).height());
}

function hideActiveSlider()
{
	indicator_disable();

	$("html").removeClass("active_slider");
	$("body").attr("ontouchmove","");
	$(".gallery_info").addClass("stable");

	if (!MOBILE_WEB)
	{
		$("#slider .carrow").remove();
		$("#slider .close").remove();
		$("#slider ul").click(function(){
			changeSliderStatus();
		});
	}

	slider_status = false;
	$("#slider .carrow").remove();
	$("#slider .close").remove();

	updateSliderSize();

	if (NATIVE_APP) window.location = "fullscreen://disable";
}

function showActiveSlider()
{
	//Load high resolution image in online mode
	if (getCookie('PHPSESSID')) //Detect online mode
	{
		if (full_images_loaded != $("#slider img").length) indicator_enable();
		$("#slider img").each(function(){
			$(this).load(function(){
				full_images_loaded++;
				if (full_images_loaded == $("#slider img").length) indicator_disable();
			});
			console.log("robie panie");
			$(this).attr("src",$(this).attr("src").replace('470x315','1600x1072'));
			$(this).attr("src",$(this).attr("src").replace('470x785','1600x1072'));
		});
	}

	if (!MOBILE_WEB)
	{
		$(slider).append('<div class="carrow left" onclick="moveSlider(0);"></div>');
		$(slider).append('<div class="carrow right" onclick="moveSlider(1);"></div>');
		$("#slider ul").attr('onclick','');
	}

	if (MOBILE_WEB || NATIVE_APP)
		$(slider).append('<div class="close mobile_close" onclick="changeSliderStatus();"></div>');
	else
		$(slider).append('<div class="close" onclick="changeSliderStatus();"></div>');

	$("html").addClass("active_slider");
	$("body").attr("ontouchmove","noElasticScroll(event);");
	$(".gallery_info").removeClass("stable");

	slider_status = true;

	updateSliderSize();

	if (NATIVE_APP) window.location = "fullscreen://enable";
}

function indicator_enable()
{
	$("body").append("<div class='indicator'><div></div></div>");
}

function indicator_disable()
{
	$(".indicator").remove();
}