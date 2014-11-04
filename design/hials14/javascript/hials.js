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

$('[data-toggle="pill"]').on('click', function(event) {
    // Avoid following the href location when clicking
    event.preventDefault() 
    // Avoid having the menu to close when clicking
    event.stopPropagation()
	
//	var $tabsubMenu = $(event.target).closest('ul.tab-pane')
//	var $activeTab = $($tabsubMenu).find('div.tabsubmenu-pane.active')
//	var $newTab = $(event.target.parentElement).find('div.tabsubmenu-pane')
	
//	if (($activeTab.length == 1) && ($activeTab[0].id != $newTab[0].id)) {
//		$($activeTab).toggleClass('active')
//	} else {
//		$($activeTab).removeClass('active')
//		$($newTab).addClass('active')
//		$($tabsubMenu).find('li.active').removeClass('active')
//		$(event.target.parentElement).addClass('active');
	}
});