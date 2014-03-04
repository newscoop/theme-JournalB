<!-- {{ url options="article" }} -->
{{ if $gimme->issue->number == 4 }}
	{{ include file="_tpl/article-mini-dossier.tpl" }}
{{ else }}
	{{ include file="_tpl/article-mini-simple.tpl" }}
{{ /if }}