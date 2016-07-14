{{dynamic}}
{{ assign var="isMobDevice" value=0 scope="global" }}
 
{{ if isset($smarty.request.mobile) || isset($smarty.request.tablet) || isset($smarty.request.phone) || $gimme->browser->browser_working == "webkit" && $gimme->browser->ua_type == 'mobile' }}
    {{ assign var="isMobDevice" value=1 scope="global" }}
 
{{ /if }}
{{/dynamic}}