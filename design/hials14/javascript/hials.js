$('#mainDropdown').on('show.bs.dropdown', function (e) {
//	var height = $('.dropdown-menu').outerHeight()
	var height = $(e.target).find('.dropdown-menu').outerHeight()
	$('main').css('margin-top', height)
	$(e.target).find('.dropdown-menu').stop(true, true).slideDown(500, 'linear')
});

$('#mainDropdown').on('hide.bs.dropdown', function (e) {
	$(e.target).find('.dropdown-menu').stop(true, true).slideUp(500, 'linear')
    $('main').css('margin-top', 0)
});