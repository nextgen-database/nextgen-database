/*!
 * Main Application JS File
 *
 * Author: Neil Mispelaar
 *
 */

// Function runs before page load
$(document).on("turbolinks:before-cache", function() {

	if ($('.select2-input').first().data('select2') != undefined) $('.select2-input').select2('destroy');

	if ($('.js-example-basic-multiple-sectors').first().data('select2') != undefined) $('.js-example-basic-multiple-sectors').select2('destroy');

	$('.js-example-basic-multiple-demographics').select2('destroy');

	$('.js-example-basic-multiple-development-actors').select2('destroy');

	$('.js-example-basic-multiple-countries').select2('destroy');

	$('.js-example-basic-multiple-regions').select2('destroy');

	$('.js-example-basic-multiple-subregions').select2('destroy');

	$('.js-example-basic-multiple-research-methods').select2('destroy');

	$('.js-example-basic-multiple-organisations').select2('destroy');

	$('.js-example-basic-multiple-organisation-types').select2('destroy');

	$('.js-example-basic-multiple-provinces').select2('destroy');

	$('.js-example-basic-search-profile').select2('destroy');

	// Deactivate the mobile menu
	mobileMenu.destroy();


	// Deactivate the tables
	$('#admin-dashboard-search-terms').DataTable().destroy();

	$('#admin-dashboard-profile-management').DataTable().destroy();

	$('#admin-dashboard-user-management').DataTable().destroy();

	$('#admin-dashboard-vocab-sector-management').DataTable().destroy();

	$('#admin-dashboard-vocab-demographic-management').DataTable().destroy();

	$('#admin-dashboard-vocab-development-actor-management').DataTable().destroy();

	$('#admin-dashboard-vocab-research-method-management').DataTable().destroy();

	$('#admin-dashboard-vocab-organisation-management').DataTable().destroy();

	$('#admin-dashboard-vocab-position-titles-management').DataTable().destroy();




});

// Normally run this when JQuery is ready, however to make
// it work with tubolinks we have to not run on jquery ready
// but rather run when turbolinks page load event fires
document.addEventListener("turbolinks:load", function() {

	// Activate the mobile menu
	mobileMenu.init({
		menuContainerClassName: "ng-navbar-links-container"
	});


	$('.js-example-basic-multiple-sectors').select2({
		placeholder: 'Select a sector option',
		width: '100%',
		allowClear: true
	});


	$('.js-example-basic-multiple-demographics').select2({
		placeholder: 'Select a demographic option',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-development-actors').select2({
		placeholder: 'Select a development actor option',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-countries').select2({
		placeholder: 'Select a country option',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-regions').select2({
		placeholder: 'Select a region option',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-subregions').select2({
		placeholder: 'Select a subregion option',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-research-methods').select2({
		placeholder: 'Select a research method option',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-organisations').select2({
		placeholder: 'Select an organisation',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-organisation-types').select2({
		placeholder: 'Select an organisation type',
		width: '100%',
		allowClear: true
	});

	$('.js-example-basic-multiple-provinces').select2({
		placeholder: 'Select a province',
		width: '100%',
		allowClear: true
	});


	$('.js-example-basic-search-profile').select2({
		placeholder: 'Search for your profile',
		width: '100%',
		allowClear: true
	});


	// Setup the datatable
	$('#admin-dashboard-search-terms').DataTable();

	$('#admin-dashboard-profile-management').DataTable();

	$('#admin-dashboard-user-management').DataTable();

	$('#admin-dashboard-vocab-sector-management').DataTable();

	$('#admin-dashboard-vocab-demographic-management').DataTable();

	$('#admin-dashboard-vocab-development-actor-management').DataTable();

	$('#admin-dashboard-vocab-research-method-management').DataTable();

	$('#admin-dashboard-vocab-organisation-management').DataTable();

	$('#admin-dashboard-vocab-position-titles-management').DataTable();


});
