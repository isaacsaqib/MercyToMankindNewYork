// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require application.js
//= require_tree .



$(document).ready(function(){
	$("#shop-sub-nav").hide();
	$("#jackets").hide();
	// $("#hoodies").hide();
	// $("#long_sleeves").hide();
	// $("#short_sleeves").hide();
	// $("#tanks").hide();
	$("#bottoms").hide();
	$("#head").hide();
	$("#ss16capsule").hide();
	$(".headers-hide").hide();
	$("#added").hide();
	$("#contact-hide").hide();
	$("#hidden-nav").hide();
	$("#listings-outerwear-nav-hidden").hide();
	$("#listings-apparel-nav-hidden").hide();
	$("#listings-accessories-nav-hidden").hide();




	$("#nav-image").on("click", function(){
		event.preventDefault();
		$("#hidden-nav").slideDown();
		$(this).attr("id", "nav-image-opened")
			$("#nav-image-opened").on("click", function(){
			event.preventDefault();
			$("#hidden-nav").slideUp();
		});

	});


	if (screen.width < 960) {
   		$('img').removeClass("elevatezoom");
	};
	


	$("#add-to-cart-btn").on("click", function(){
		swal({
			title: "Added to cart", 
			type: "success",
			timer: 6000



		});

	});


	$("#nav li:nth-child(3)").on("click", function(){ /* contact button */
		event.preventDefault();
		$("#contact-hide").slideDown();


	});


	// $("#listings-index-nav li:nth-child(1)").on("click", function(){  /* New */
	// 	$(".products").hide();
	// 	$("#new").show();

	// })

	$("#listings-outerwear-nav-hidden > li").on("click", function(){  /* JACKETS */
		$(".products").hide();
		$("#jackets").fadeIn();
		$(".headers-hide").hide();


	});


	$("#listings-apparel-nav-hidden > li:nth-child(1)").on("click", function(){  /* APPAREL */
		$(".products").hide();
		$("#intro-listings-picture").fadeOut();
		$("#hoodies").fadeIn();
		$("#long_sleeves").fadeIn();
		$("#short_sleeves").fadeIn();
		$("#tanks").fadeIn();
		$(".headers-hide").hide();
	});

	$("#listings-apparel-nav-hidden > li:nth-child(3)").on("click", function(){ /* SS 16 CAPSULE */
		$(".products").hide();
		$("#ss16capsule").fadeIn();
		$(".headers-hide").fadeIn();
	});


	$("#listings-apparel-nav-hidden > li:nth-child(2)").on("click", function(){ /* BOTTOMS */
		$(".products").hide();
		$("#bottoms").fadeIn();
		$(".headers-hide").hide();
	});

	$("#listings-accessories-nav-hidden > li:nth-child(1)").on("click", function(){ /* HEADWEAR */
		$(".products").hide();
		$("#head").fadeIn();
		$(".headers-hide").hide();
	});

	$("#listings-accessories-nav-hidden > li:nth-child(2)").on("click", function(){ /* ACCESSORIES */
		$(".products").hide();
		$("#Wristwear").fadeIn();
		$(".headers-hide").hide();
	});


	// START LISTINGS NAVIGATION TOGGLE FUNCTIONS

	function HiddenListingNavSlideDown(li_id, hidden_list) { 
		$("#listings-index-nav > li:nth-child(" + li_id + ")").on("click", function(){
			$("#listings-" + hidden_list + "-nav-hidden").slideToggle("slow");
			$("#intro-listings-picture").hide();

		});
	};

	HiddenListingNavSlideDown(1, "outerwear");
	HiddenListingNavSlideDown(3, "apparel");
	HiddenListingNavSlideDown(5, "accessories");


	/* Wristwear */

      $(".elevatezoom").elevateZoom();

	

})
