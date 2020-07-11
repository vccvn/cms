(function($) {
	
	"use strict";
	
	// Cache Selectors
	var services		=$("#owl-services"),
		menu			=$(".owl-menu"),
		testimonial		=$("#owl-testimonial"),
		bestSeller		=$("#owl-best-sellers"),
		ourSpecials		=$("#owl-our-specials");
	
	
	// Owl Services
	services.owlCarousel({
		items : 3,
		itemsCustom : false,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [991,3],
		itemsTablet: [768,3],
		itemsTabletSmall: [600,2],
		itemsMobile : [479,2],
		singleItem : false,
		itemsScaleUp : false,
	 
		//Autoplay
		autoPlay : true,
		stopOnHover : true,
	 
		// Navigation
		navigation : false,
		navigationText : false,
		rewindNav : false,
		scrollPerPage : false,
	 
		//Pagination
		pagination : false,
		paginationNumbers: false,
	 
		// Responsive 
		responsive: true,
		responsiveRefreshRate : 200,
		responsiveBaseWidth: window,    
	});
	
	
	// Owl Menu
	menu.owlCarousel({
		items : 2,
		itemsCustom : false,
		itemsDesktop : [1199,2],
		itemsDesktopSmall : [991,2],
		itemsTablet: [768,2],
		itemsTabletSmall: [600,2],
		itemsMobile : [479,2],
		singleItem : false,
		itemsScaleUp : false,
	 
		//Autoplay
		autoPlay : true,
		stopOnHover : true,
	 
		// Navigation
		navigation : true,
		navigationText : ['<i class="fa fa-chevron-left" aria-hidden="true"></i>','<i class="fa fa-chevron-right" aria-hidden="true"></i>'],
		rewindNav : true,
		scrollPerPage : false,
	 
		//Pagination
		pagination : false,
		paginationNumbers: false,
	 
		// Responsive 
		responsive: true,
		responsiveRefreshRate : 200,
		responsiveBaseWidth: window,    
	});
	
	
	// Owl Testimonial
	testimonial.owlCarousel({
		items : 3,
		itemsCustom : false,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [991,2],
		itemsTablet: [768,2],
		itemsTabletSmall: [600,1],
		itemsMobile : [479,1],
		singleItem : false,
		itemsScaleUp : false,
	 
		//Autoplay
		autoPlay : true,
		stopOnHover : true,
	 
		// Navigation
		navigation : false,
		navigationText : false,
		rewindNav : false,
		scrollPerPage : false,
	 
		//Pagination
		pagination : true,
		paginationNumbers: false,
	 
		// Responsive 
		responsive: true,
		responsiveRefreshRate : 200,
		responsiveBaseWidth: window,    
	});
	
	
	// Owl Best Sellers
	bestSeller.owlCarousel({
		items : 2,
		itemsCustom : false,
		itemsDesktop : [1199,2],
		itemsDesktopSmall : [991,2],
		itemsTablet: [768,2],
		itemsTabletSmall: [600,2],
		itemsMobile : [479,2],
		singleItem : false,
		itemsScaleUp : false,
	 
		//Autoplay
		autoPlay : true,
		stopOnHover : true,
	 
		// Navigation
		navigation : false,
		navigationText : false,
		rewindNav : false,
		scrollPerPage : false,
	 
		//Pagination
		pagination : true,
		paginationNumbers: false,
	 
		// Responsive 
		responsive: true,
		responsiveRefreshRate : 200,
		responsiveBaseWidth: window,    
	});
	
	
	// Owl Specials
	ourSpecials.owlCarousel({
		items : 2,
		itemsCustom : false,
		itemsDesktop : [1199,2],
		itemsDesktopSmall : [991,2],
		itemsTablet: [768,2],
		itemsTabletSmall: [600,2],
		itemsMobile : [479,2],
		singleItem : false,
		itemsScaleUp : false,
	 
		//Autoplay
		autoPlay : true,
		stopOnHover : true,
	 
		// Navigation
		navigation : true,
		navigationText : ['<i class="fa fa-chevron-left" aria-hidden="true"></i>','<i class="fa fa-chevron-right" aria-hidden="true"></i>'],
		rewindNav : true,
		scrollPerPage : false,
	 
		//Pagination
		pagination : false,
		paginationNumbers: false,
	 
		// Responsive 
		responsive: true,
		responsiveRefreshRate : 200,
		responsiveBaseWidth: window,    
	});

})(jQuery);
