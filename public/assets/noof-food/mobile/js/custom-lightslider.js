(function($) {
	
	"use strict";
	
	// Cache Selectors
	var mainDocument		=$(document),
		menuGallery			=$('#menu-gallery');
	menuGallery.length ?
	mainDocument.on('ready', function() {
					
		menuGallery.lightSlider({
			gallery:true,
			item:1,
			thumbItem:9,
			slideMargin: 0,
			speed:500,
			auto:false,
			loop:true,
			onSliderLoad: function() {
				menuGallery.removeClass('cS-hidden');
			}  
		});
	}) : {};

})(jQuery);