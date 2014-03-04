echo Compiling scripts - run from _js folder - requires Java JRE and Google Closure
echo please make sure GOOGLE_CLOSURE is set in your environment to the location of compiler.jar
echo download it here: http://closure-compiler.googlecode.com/files/compiler-latest.zip

SRCLIST="magnific.popup.js library.js community.js faves.js general.js swipe.js slider.js tabs.js"

java -jar $GOOGLE_CLOSURE/compiler.jar --js $SRCLIST --js_output_file all.min.js

# java -jar $GOOGLE_CLOSURE/compiler.jar --compilation_level WHITESPACE_ONLY --formatting PRETTY_PRINT --js $SRCLIST --js_output_file all_dev.js
