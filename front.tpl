{{ include file="_ads/_ismobdevice.tpl" }}
{{ include file="_tpl/_html-head.tpl" }} 
<!-- front.tpl -->
<body id="body" class="front-page">

<div class="container">

  {{ include file="_ads/billboard.tpl" }}

  <div class="main">

    {{ include file="_tpl/header.tpl" }}

    <div class="row content">

      {{ include file="_tpl/mobile-controlbar-front.tpl" }}

      {{* php }} $template->assign('start',$_GET['ls-art0']); {{ /php }}
      {{ php }} $template->assign('start2',$_GET['ls-art1']); {{ /php }}
      {{ $param = $start|cat:$start2 }}
      {{ render file="_tpl/newsrows.tpl" params="{{ $param }}" *}}
      
			{{ dynamic }}
			{{ $params = implode(',', array($gimme->url->get_parameter("ls-art0"), $gimme->url->get_parameter("ls-art1"))) }}
			{{ render file="_tpl/newsrows.tpl" params=$params cache=3600 }}
			{{ /dynamic }}      

    </div><!-- /content -->

  </div><!-- /main -->

  <div class="sidebar">

    {{ include file="_tpl/community-header.tpl" }}

    <div class="row content">
      <div class="row googlead ">
            {{ include file="_ads/adsense.tpl" }}
         </div>
      <!-- Custom Add/Partners/Recommendations -->
      {{ include file="_tpl/mobile-ad.tpl" }}
      
      {{ include file="_tpl/community-front.tpl" }}
      <!-- Community -->
      {{ render file="_tpl/community.tpl" section=2 article=0 }}

      {{ include file="_ads/skyscraper.tpl" }}



    </div>

  </div>
  
  {{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
