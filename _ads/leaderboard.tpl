{{ dynamic }}

{{ assign var="isMobDevice" value=0 scope="global" }}

{{ if isset($smarty.request.mobile) || isset($smarty.request.tablet) || isset($smarty.request.phone) || $gimme->browser->browser_working == "webkit" && $gimme->browser->ua_type == 'mobile' }}
{{ assign var="isMobDevice" value=1 scope="global" }}

{{ /if }}

{{ if $isMobDevice == 0 }}

<div class="openx-ads"> 
<ins data-revive-zoneid="405" data-revive-target="_blank" data-revive-id="c6f1d037b910aeaf56bfeaf92b8cd2ed"></ins>
<script async src="//openx.sourcefabric.net/delivery/asyncjs.php"></script>
</div>

{{ elseif $isMobDevice == 1 }}

<div class="openx-ads mobile">
<ins data-revive-zoneid="411" data-revive-target="_top" data-revive-id="c6f1d037b910aeaf56bfeaf92b8cd2ed"></ins>
<script async src="//openx.sourcefabric.net/delivery/asyncjs.php"></script>
</div>

{{ /if }}

{{ /dynamic }}
