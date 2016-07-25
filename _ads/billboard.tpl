
{{* if $isMobDevice == '0' *}}

<div class="openx-ads"> 
<ins data-revive-zoneid="404" data-revive-target="_blank" data-revive-id="c6f1d037b910aeaf56bfeaf92b8cd2ed"></ins>
<script async src="//openx.sourcefabric.net/delivery/asyncjs.php"></script>
</div>

{{ elseif $isMobDevice == '1' }}

<div class="openx-ads">

<script type='text/javascript'><!--//<![CDATA[
   var m3_u = (location.protocol=='https:'?'https://openx.sourcefabric.net/delivery/ajs.php':'http://openx.sourcefabric.net/delivery/ajs.php');
   var m3_r = Math.floor(Math.random()*99999999999);
   if (!document.MAX_used) document.MAX_used = ',';
   document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
   document.write ("?zoneid=410");
   document.write ('&amp;cb=' + m3_r);
   if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
   document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
   document.write ("&amp;loc=" + escape(window.location));
   if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
   if (document.context) document.write ("&context=" + escape(document.context));
   if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
   document.write ("'><\/scr"+"ipt>");
//]]>--></script><noscript><a href='http://openx.sourcefabric.net/delivery/ck.php?n=a6aa647a&amp;cb=6' target='_blank'><img src='http://openx.sourcefabric.net/delivery/avw.php?zoneid=410&amp;cb=6&amp;n=a6aa647a' border='0' alt='' /></a></noscript>
</div>

{{* /if *}}