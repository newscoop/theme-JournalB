for f in *; do mv $f `echo $f | tr '[:upper:]' '[:lower:]'`; done
for i in *.eot; do mv -v $i `basename $i .eot`-web.eot; done
for i in *.svg; do mv -v $i `basename $i .svg`-web.svg; done
for i in *.woff; do mv -v $i `basename $i .woff`-web.woff; done

