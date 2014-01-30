/**
 * jQuery Plugin to obtain touch gestures from iPhone, iPod Touch and iPad, should also work with Android mobile phones (not tested yet!)
 * Common usage: wipe images (left and right to show the previous or next image)
 * 
 * @author Andreas Waltl, netCU Internetagentur (http://www.netcu.de)
 * @version 1.1.1 (9th December 2010) - fix bug (older IE's had problems)
 * @version 1.1 (1st September 2010) - support wipe up and wipe down
 * @version 1.0 (15th July 2010)
 */
(function($) { 
   $.fn.touchwipe = function(settings) {
     var config = {
    		min_move_x: 20,
    		min_move_y: 20,
 			wipeLeft: "",
 			wipeRight: "",
 			wipeUp: "",
 			wipeDown: "",
			wipeNone: "",
			preventDefaultEvents: true
	 };
     
     if (settings) $.extend(config, settings);
 

 
     this.each(function() {
    	 var startX;
    	 var startY;
		 var isMoving = false;
		 
    	 function cancelTouch() {
    		 this.removeEventListener('touchmove', onTouchMove);
             this.removeEventListener('touchend', onTouchEnd);
    		 startX = null;
    		 isMoving = false;
    	 }	

        function onTouchEnd(e) {
            cancelTouch();
            if (!tcm) eval (config.wipeNone);
    	 }

    	 function onTouchMove(e) {
			
            tcm = true;
    		 /*if(config.preventDefaultEvents) {
    			 e.preventDefault();
    		 }*/
    		 if(isMoving) {
	    		 var x = e.touches[0].pageX;
	    		 var y = e.touches[0].pageY;
	    		 var dx = startX - x;
	    		 var dy = startY - y;

			   
	    		 if(Math.abs(dx) >= config.min_move_x) {
	    			cancelTouch();
	    			if(dx > 0) {
	    				eval(config.wipeLeft);
	    			}
	    			else {
	    				eval(config.wipeRight);
	    			}
	    		 }
	    		 else if(Math.abs(dy) >= config.min_move_y) {
		    			cancelTouch();
		    			if(dy > 0) {
		    				eval(config.wipeDown);
		    			}
		    			else {
		    				eval(config.wipeUp);
		    			}
		    		 }  
                
    		 }
    	 }
    	 
    	 function onTouchStart(e)
    	 {
    		 if (e.touches.length == 1) {
    			 startX = e.touches[0].pageX;
    			 startY = e.touches[0].pageY;
    			 isMoving = true;
                tcm = false;
    			 this.addEventListener('touchmove', onTouchMove, false);
			this.addEventListener('touchend', onTouchEnd, false);    		 }
    	 }    	 
    	 if ('ontouchstart' in document.documentElement) {
    		 this.addEventListener('touchstart', onTouchStart, false);
    	 }
     });
 
     return this;
   };
 
 })(jQuery);
 

