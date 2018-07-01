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
//= require swiper.jquery.js
//= require application.js
//= require swiper.js
//= require jquery.selectric.js
//= require elevatezoomplus.js
//= require turbolinks
//= require_tree .



$(document).ready(function(){

	$("#shop-div").hide();
	$("#free-shipping-div").slideDown();	

	// $("#hoodies").hide();
	// $("#long_sleeves").hide();
	// $("#short_sleeves").hide();
	// $("#tanks").hide();
	// $("#bottoms").hide();
	// $("#head").hide();
	// $("#ss16capsule").hide();
	$(".headers-hide").hide();
	$("#added").hide();
	$("#contact-hide").hide();
	$("#hidden-nav").hide();
	$("#listings-outerwear-nav-hidden").hide();
	$("#listings-apparel-nav-hidden").hide();
	$("#listings-accessories-nav-hidden").hide();



// SIZE GUIDE POP UP 
$(".open").on("click", function(){
	event.preventDefault();
	$(".popup, .popup-content").addClass("active");
	$(".popup-overlay").show();
});

$(".close, .popup").on("click", function(){
		event.preventDefault();

	$(".popup, .popup-content").removeClass("active");
});

// END




	$("#contact-us").on("click", function(){
		$(this).hide();
		$("#contact-email").fadeIn(2000);

	})

  	
	$("#free-shipping-x").on("click", function(){
		$("#free-shipping-div").slideUp();
	});



	
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

	$("#store-nav > li:nth-child(1)").on("mouseover", function(){
		$(".store-nav-hidden-div").hide();
		$(".store-nav-hidden-list").hide();
		$("#shop-div").fadeIn();
		$("#shop-list").fadeIn();

	})

	$("#shop-div").on("mouseleave", function(){ 		
		$("#shop-div").fadeOut();
		$("#shop-list").fadeOut();	
	})

	// $("#store-nav > li:nth-child(6)").on("mouseover", function(){
	// 	$(".store-nav-hidden-div").hide();
	// 	$(".store-nav-hidden-list").hide();
	// 	$("#lookbooks-div").fadeIn();
	// 	$("#lookbooks-list").fadeIn();

	// })

	$("#store-nav > li:nth-child(6)").on("mouseleave", function(){ 
		$("#lookbooks-div").fadeOut();
		$("#lookbooks-list").fadeOut();
	})

	

	$("#hidden-nav > li:nth-child(2) > a").on("click", function(){
		event.preventDefault();
		// $("#mobile-store-div").slideToggle();
		$("#mobile-store-list").slideToggle();
		

	})

	
	$('.edit-form').on('ajax:success', function() {
  		$(this).append("<p>Thank you</p>")

	});

	$('.delete-form').on('ajax:success', function() {
  		$(this).closest("li").fadeOut();

	});


  //initialize swiper when document ready  
    var mySwiper1 = new Swiper ('.swiper-container1', {
      // Optional parameters
	  	direction: 'horizontal',
		loop: true,
      	effect: "fade",
      	fade: {
      		crossFade: true
      	},
       	pagination: '.swiper-pagination',
       	paginationClickable: true,
       	nextButton: ".swiper-button-next",
       	prevButton: ".swiper-button-prev"

    });      


    var mySwiper2 = new Swiper ('.swiper-container2', {
      // Optional parameters
	  	direction: 'horizontal',
		loop: true,
      	effect: "fade",
      	fade: {
      		crossFade: true
      	},
       	pagination: '.swiper-pagination',
       	paginationClickable: true

    });   

    var mySwiper3 = new Swiper ('.swiper-container3', {
      // Optional parameters
      	navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
		loop: true,
      	effect: "fade",
      	fade: {
      		crossFade: true
      	}

    });    

    $("#listings-show-pictures > li > a > img")

    // INITIALIZE SELECTRIC
		$('#size').selectric({
	 	disableOnMobile: false,	
  		nativeOnMobile: false
		});	



		$('.zoom1').ezPlus({
		});

});

