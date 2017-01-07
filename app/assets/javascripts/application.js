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
//= require unslider-min.js
//= require_tree .



$(document).ready(function(){



	$("#shop-sub-nav").hide();
	$("#free-shipping-div").slideDown();
	$("#jackets").hide();
	$("#jackets").fadeIn(1500);	

	$("#hoodies").hide();
	$("#hoodies").fadeIn(1500);	

	$("#long_sleeves").hide();
	$("#long_sleeves").fadeIn(1500);

	$("#short_sleeves").hide();
	$("#short_sleeves").fadeIn(1500);

	$("#tanks").hide();
	$("#tanks").fadeIn(1500);	

	$("#bottoms").hide();
	$("#bottoms").fadeIn(1500);	

	$("#head").hide();
	$("#head").fadeIn(1500);
	
	$("#accessories").hide();
	$("#accessories").fadeIn(1500);

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



	$("#contact-us").on("click", function(){
		$(this).hide();
		$("#contact-email").fadeIn(2000);

	})

  	
	$("#free-shipping-x").on("click", function(){
		$("#free-shipping-div").slideUp();
	});

	$("#nav-image").on("click", function(){
		$("#hidden-nav").slideToggle("slow");

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


	// $("#listings-index-nav li:nth-child(1)").on("click", function(){  /* New */
	// 	$(".products").hide();
	// 	$("#new").show();

	// })

	// $("#listings-outerwear-nav-hidden > li").on("click", function(){  /* JACKETS */
	// 	$(".products").hide();
	// 	$(".headers-hide").hide();


	// });


	// $("#listings-apparel-nav-hidden > li:nth-child(1)").on("click", function(){  /* APPAREL */
	// 	$(".products").hide();
	// 	$("#intro-listings-picture").fadeOut();
	// 	$("#hoodies").fadeIn();
	// 	$("#long_sleeves").fadeIn();
	// 	$("#short_sleeves").fadeIn();
	// 	$("#tanks").fadeIn();
	// 	$(".headers-hide").hide();
	// });

	// $("#listings-apparel-nav-hidden > li:nth-child(2)").on("click", function(){ /* BOTTOMS */
	// 	$(".products").hide();
	// 	$("#bottoms").fadeIn();
	// 	$(".headers-hide").hide();
	// });

	// $("#listings-index-nav > li:nth-child(5)").on("click", function(){ /* HEADWEAR */
	// 	$(".products").hide();
	// 	$("#head").fadeIn();
	// 	$(".headers-hide").hide();
	// });

	// $("#listings-index-nav > li:nth-child(6)").on("click", function(){ /* ACCESSORIES */
	// 	$(".products").hide();
	// 	$("#accessories").fadeIn();
	// 	$(".headers-hide").hide();
	// });

	$('.edit-form').on('ajax:success', function() {
  		$(this).append("<p>Thank you</p>")

	});

	$('.delete-form').on('ajax:success', function() {
  		$(this).closest("li").fadeOut();

	});

	// $("#picture-delete").on("click", function(event){ 
	// 	var pictures_href = $("#listings-show-pictures > li > a").attr("href");
	// 	var picture_id = pictures_href.substring(10, pictures_href.lenght);
	//     $.ajax({
	//         url: "/pictures/" + picture_id,
	//         type: "POST",
	//         dataType: "json",
	//         data: {"_method":"delete"}
	//     });

	// 		$(this).closest("li").fadeOut();
	//     	event.preventDefault();

	// });


	// START LISTINGS NAVIGATION TOGGLE FUNCTIONS

	function HiddenListingNavSlideDown(li_id, hidden_list) { 
		$("#listings-index-nav > li:nth-child(" + li_id + ")").on("click", function(){
			$("#listings-" + hidden_list + "-nav-hidden").slideToggle("slow");
			$("#intro-listings-picture").hide();

		});
	};

	HiddenListingNavSlideDown(2, "outerwear");
	HiddenListingNavSlideDown(4, "apparel");
	HiddenListingNavSlideDown(6, "accessories");


	$('.my-slider').unslider({
		autoplay: true,
	   speed: 1000,    //  The speed to animate each slide (in milliseconds)  [default: 750]
		delay: 6000,
		arrows: false,
		swipe: true, 
		swipeThreshold: 0.2			


	})

	$('.my-slider').unslider('initSwipe');
self.initSwipe = function() {
			var width = self.$slides.width();

			//  We don't want to have a tactile swipe in the slider
			//  in the fade animation, as it can cause some problems
			//  with layout, so we'll just disable it.
			if(self.options.animation !== 'fade') {

				self.$container.on({

					movestart: function(e) {
						//  If the movestart heads off in a upwards or downwards
						//  direction, prevent it so that the browser scrolls normally.
						if((e.distX > e.distY && e.distX < -e.distY) || (e.distX < e.distY && e.distX > -e.distY)) {
							return !!e.preventDefault();
						}

						self.$container.css('position', 'relative');
					},

					move: function(e) {
						self.$container.css('left', -(100 * self.current) + (100 * e.distX / width) + '%');
					},

					moveend: function(e) {
						// Check if swiped distance is greater than threshold.
						// If yes slide to next/prev slide. If not animate to
						// starting point.

						if((Math.abs(e.distX) / width) > self.options.swipeThreshold) {

							self[e.distX < 0 ? 'next' : 'prev']();
						}
						else {

							self.$container.animate({left: -(100 * self.current) + '%' }, self.options.speed / 2 );
						}
					}
				});
			}
		};
	/* Wristwear */

      // $(".elevatezoom").elevateZoom();

	

})
