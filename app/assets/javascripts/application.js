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
	$("#new").hide();
	 // $("#tops").hide();
	$("#bottoms").hide();
	$("#headwear").hide();
	$("#wristwear").hide();
	$("#added").hide();
	$("#contact-hide").hide();
	$("#hidden-nav").hide();

	$("#nav-image").on("click", function(){
		event.preventDefault();
		$("#hidden-nav").slideDown();
		$(this).attr("id", "nav-image-opened")
		$("#nav-image-opened").on("click", function(){
		event.preventDefault();
		$("#hidden-nav").slideUp();
	})

	})

	




 if 
	 	( $("img[alt*='M2mk']") )
	 {

	 	$( "img[alt*='M2mk']").css("width", "80%");

	 };

 if 
	 	( $("img[alt='M2mk final 16 copy']") )
	 {

	 	$( "img[alt='M2mk final 16 copy']").css("width", "100%");

	 };

if 
	 	( $("img[alt='M2mk final 29 copy']") )
	 {

	 	$( "img[alt='M2mk final 29 copy']").css("width", "100%");

	 };

if 
	 	( $("img[alt='M2mk final 23 copy']") )
	 {

	 	$( "img[alt='M2mk final 23 copy']").css("width", "100%");

	 };
	




	$("#add-to-cart-btn").on("click", function(){
		alert("Added to cart");

	})


	$("#nav li:nth-child(3)").on("click", function(){ /* contact button */
		event.preventDefault();
		$("#contact-hide").slideDown();


	})


	// $("#listings-index-nav li:nth-child(1)").on("click", function(){  /* New */
	// 	$(".products").hide();
	// 	$("#new").show();

	// })



	$("#listings-index-nav li:nth-child(1)").on("click", function(){  /* Tops */
		$(".products").hide();
		$("#tops").fadeIn();

	})


	$("#listings-index-nav li:nth-child(2)").on("click", function(){ /* Bottoms */
		$(".products").hide();
		$("#bottoms").fadeIn();

	})



	$("#listings-index-nav li:nth-child(3)").on("click", function(){ /* Headwear */
		$(".products").hide();
		$("#headwear").fadeIn();

	})



	$("#listings-index-nav li:nth-child(4)").on("click", function(){ /* Wristwear */
		$(".products").hide();
		$("#wristwear").fadeIn();

	})



	

})
