$('#mainDropdown').on('show.bs.dropdown', function (e) {
//	var height = $('.dropdown-menu').outerHeight()
	if (!$('#navbar-collapse-grid').hasClass('in')) {
		var height = $(e.target).find('.dropdown-menu').outerHeight()
		$('main').css('margin-top', height)
		$(e.target).find('.dropdown-menu').slideDown('fast', 'linear')
	}
});

$('#mainDropdown').on('hide.bs.dropdown', function (e) {
	if (!$('#navbar-collapse-grid').hasClass('in')) {	
		$(e.target).find('.dropdown-menu').slideUp('fast', 'linear')
		$('main').css('margin-top', 0)
	}
});

$('#mainDropdown').on('hidden.bs.dropdown', function (e) {
	//RESET menu
	$('ul.tabsubmenu').find('.active').removeClass('active');
	$('#bachelor').parent('li').addClass('active');
	$('#submenu-bachelor').addClass('active');
});
