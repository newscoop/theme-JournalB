{{ set_default_article }}
{{ $is_gallery = false }}
{{ $has_image = false }}

<div id="slider_box" class="slider_box">

  <div id="slider" class="slider">
    <ul>

      {{ foreach $gimme->article->slideshows as $slideshow }}
      {{ foreach $slideshow->items as $item }}
      {{ if $item->is_image }}
      {{ if $item->image->width != 470 }} {{ continue }} {{ /if }}
      {{ $is_gallery = true }}
      <li class="sli_image">
        <span class="gallery_icon"></span>
        <img src="{{ $item->image->src }}" alt="{{ $item->caption }}" /></li>
      {{ /if }}

      {{ if $item->is_video }}
      {{ $is_gallery = true }}
      {{ $url = $item->video->url|replace:'youtu.be':'www.youtube.com/embed' }}
      {{ $url = $url|replace:'youtube.com/embed':'youtube.com/embed' }}
      {{ if preg_match("/youtube/", $url) }}
      <li class="sli_video"><iframe src="{{ $url }}?hl=de_DE" frameborder="0" alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>

      {{ elseif preg_match("/vimeo/", $url) }}
      {{ $url = $url|replace:'/vimeo.com/':'/player.vimeo.com/video/' }}
      <li class="sli_video"><iframe src="{{ $url }}?title=0&amp;byline=0&amp;portrait=0" frameborder="0" alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>

      {{ elseif preg_match("/ustream/", $url) }}
      {{ $url = $url|replace:'ustream.tv/recorded/':'ustream.tv/embed/recorded/' }}
      {{ $url = $url|replace:'ustream.tv/channel/':'ustream.tv/embed/' }}
      <li class="sli_video"><iframe src="{{ $url }}?v=3&amp;wmode=direct" scrolling="no" frameborder="0" alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>

      {{ else }}
      <li class="sli_video"><iframe src="{{ $url }}" frameborder="0" alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>

      {{ /if }}
      {{ /if }}
      {{ /foreach }}
      {{ break }}
      {{ /foreach }}



    </ul>
  </div>
</div>

{{ if not $is_gallery }}
{{ image rendition="articlebigautosize" }}
{{ $has_image = true }}
{{$file_name = $image->src|replace: '/images/cache/470x785/fit/images%7C':''}}
<div id="slider_box">
  <span class="gallery_icon"></span>
<div class="gallery_info stable"><div class="gallery_description">{{ $image->caption }}</div></div>

<img href="/images/{{$file_name}}" src="{{ $image->src }}" alt="{{ $image->caption }}" title="{{ $image->caption }}" class="image-link responsive" />
</div>
{{ /image }}
{{ /if }}

{{ if $is_gallery }}
<script type="text/javascript"> var is_gallery = true; </script>
{{ else }}
<script type="text/javascript"> var is_gallery = false;
$(document).ready(function() {
  $('.image-link').magnificPopup({type:'image'});
});

</script>
{{if !$has_image}}
<script type="text/javascript"> $('article .deck').css('padding-bottom','20px'); </script>
{{/if}}

{{ /if }}