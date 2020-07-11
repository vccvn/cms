(function($) {
	
	"use strict";
	
	// Cache Selectors
	var mainWindow			=$(window),
		mainDocument		=$(document),
		myLoader			=$(".loader"),
		pageBody			=$('.canvas'),
		fullScrNav			=$("#fullscr-nav"),
		fullSrcClose		=$("#fullscr-close"),
		fullSrcOpen			=$("#fullscr-open"),
		fullSrcOpen1		=$(".fullscr-open"),
		sideBarNav			=$(".sidenav"),
		sideBarClose		=$("#sidenav-close"),
		sideBarOpen			=$("#sidenav-open"),
		sideBarOpen1		=$(".sidenav-open"),
		sideBarNav2			=$(".sidenav-2"),
		sideBar2Close		=$("#sidenav-2-close"),
		sideBar2Open		=$("#sidenav-2-open"),
		scSideBar			=$("#shopping-cart-sidebar"),
		scOpen				=$("#shc-side-open"),
		usrSideBar			=$("#user-profile-sidebar"),
		usrSideOpen			=$("#usr-side-open"),
		over				=$(".overlay-black");

	
	// Loader
	mainWindow.on('load', function () {
		myLoader.fadeOut("slow");
	});
	
	
	//Full Screen Navigation		
	fullSrcOpen.on('click', function(e) {
		e.stopPropagation();
		fullScrNav.toggleClass('to-top-toggle')
	});
	
	fullSrcOpen1.on('click', function(e) {
		e.stopPropagation();
		fullScrNav.toggleClass('to-top-toggle')
	});
	
	fullSrcClose.on('click', function(e) {
		e.stopPropagation();
		fullScrNav.toggleClass('to-top-toggle')
	});
	
	
	//Sidebar Navigation	
	sideBarOpen.on('click', function(e) {
		e.stopPropagation();
		sideBarNav.toggleClass('to-left-toggle')
		over.css('visibility', 'visible')
	});
	
	sideBarOpen1.on('click', function(e) {
		e.stopPropagation();
		sideBarNav.toggleClass('to-left-toggle')
		sideBarNav2.removeClass('to-left-toggle')
		over.css('visibility', 'visible')
	});
	
	sideBarClose.on('click', function(e) {
		e.stopPropagation();
		sideBarNav.toggleClass('to-left-toggle')
		over.css('visibility', 'hidden')
	});
	
	
	//Sidebar Navigation 2	
	sideBar2Open.on('click', function(e) {
		e.stopPropagation();
		sideBarNav2.toggleClass('to-left-toggle')
		sideBarNav.removeClass('to-left-toggle')
		over.css('visibility', 'visible')
	});
	
	sideBar2Close.on('click', function(e) {
		e.stopPropagation();
		sideBarNav2.toggleClass('to-left-toggle')
		over.css('visibility', 'hidden')
	});
	
	
	//Shopping Cart Sidebar	
	scOpen.on('click', function(e) {
		e.stopPropagation();
		scSideBar.toggleClass('to-right-toggle')
		over.css('visibility', 'visible')
	});
	
	
	//User Sidebar
	usrSideOpen.on('click', function(e) {
		e.stopPropagation();
		usrSideBar.toggleClass('to-right-toggle')
		over.css('visibility', 'visible')
	});
	
	
	pageBody.on('click', function(e) {
		
	  if (sideBarNav.hasClass('to-left-toggle')) {
		sideBarNav.toggleClass('to-left-toggle')
		over.css('visibility', 'hidden')
	  }
	  
	  if (sideBarNav2.hasClass('to-left-toggle')) {
		sideBarNav2.toggleClass('to-left-toggle')
		over.css('visibility', 'hidden')
	  }
	  
	  else if (scSideBar.hasClass('to-right-toggle')) {
		scSideBar.toggleClass('to-right-toggle')
		over.css('visibility', 'hidden')
	  }
	  
	  else if (usrSideBar.hasClass('to-right-toggle')) {
		usrSideBar.toggleClass('to-right-toggle')
		over.css('visibility', 'hidden')
	  }
	})

})(jQuery);