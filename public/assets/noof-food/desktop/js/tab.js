// for tab content js start //
function openCity(evt, cityName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
	tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
	tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}
	
// Get the element with id="defaultOpen" and click on it
var __default_open = document.getElementById("defaultOpen");
if(__default_open){
	__default_open.click();
}
// for tabcontent js start //

function tabs() {
	$('.ps-tab-list  li > a ').on('click', function(e) {
		e.preventDefault();
		var target = $(this).attr('href');
		$(this).closest('li').siblings('li').removeClass('active');
		$(this).closest('li').addClass('active');
		$(target).addClass('active');
		$(target).siblings('.ps-tab').removeClass('active');
	});
	$('.ps-tab-list.owl-slider .owl-item a').on('click', function(e) {
		e.preventDefault();
		var target = $(this).attr('href');
		$(this).closest('.owl-item').siblings('.owl-item').removeClass('active');
		$(this).closest('.owl-item').addClass('active');
		$(target).addClass('active');
		$(target).siblings('.ps-tab').removeClass('active');
	});
}

tabs();
