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
	$('#utdanning_tabs').find('.active').removeClass('active');
	$('#utdanning_tabs .nav-pills :first-child').addClass('active');
	$('#utdanning_tabs .tab-content :first-child').addClass('active');
});

$('[data-toggle="pill"]').on('click', function(event) {
    // Avoid following the href location when clicking
   	event.preventDefault() 
    // Avoid having the menu to close when clicking
    event.stopPropagation()
	
	var $menu = $(event.target).closest('.dropdown-menu')
	var $tabContent = $($menu).find('.tab-content')
	var $activeTab = $($tabContent).find('div.tab-pane.active')
	var $newTab = $($tabContent).find(event.target.hash)
	
	if (($activeTab.length == 1) && ($activeTab[0].id != $newTab[0].id)) {
		$($activeTab).removeClass('active')
		$($newTab).addClass('active')
		$('#utdanning_tabs').find('li.active').removeClass('active')
		$(event.target.parentElement).addClass('active');
	}
   	
	var height = $menu.outerHeight()
	$('main').css('margin-top', height)
	$menu.slideDown('fast', 'linear')
	
});

// Prevent clicks on menu background from closing menu
$('.dropdown-menu').on('click', function(event) {
	var target = $( event.target );
	if (target.is( "ul" ) || target.is( "li" ) || target.is( "div" )) {
		// Avoid having the menu to close when clicking
		event.stopPropagation()
	}
});