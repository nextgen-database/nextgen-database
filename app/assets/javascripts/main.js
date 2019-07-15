/*!
 * Main Application JS File
 *
 * Author: Neil Mispelaar
 *
 */

// Normally run this when JQuery is ready, however to make
// it work with tubolinks we have to not run on jquery ready
// but rather run when turbolinks page load event fires
document.addEventListener("turbolinks:load", function() {

	// Activate the mobile menu
	mobileMenu.init({
		menuContainerClassName: "ng-navbar-links-container"
	});


	$('.profile-new-country-select2').select2();

});
