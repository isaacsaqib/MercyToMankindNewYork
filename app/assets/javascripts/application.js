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
//= require swiper.jquery.min.js
//= require application.js
//= require swiper.js
//= require swiper.min.js
//= require turbolinks
//= require_tree .



$(document).ready(function(){





	$("#mobile-store-div").hide();
	$("#mobile-store-list").hide();
	$("#collection-div").hide();
	$("#collection-list").hide();
	$("#lookbooks-div").hide();
	$("#lookbooks-list").hide();
	$("#shop-div").hide();
	$("#shop-list").hide();
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

	$("#store-nav > li:nth-child(2)").on("mouseover", function(){
		$(".store-nav-hidden-div").hide();
		$(".store-nav-hidden-list").hide();	
		$("#collection-div").toggle();
		$("#collection-list").toggle();

	})

	$("#store-nav > li:nth-child(4)").on("mouseover", function(){
		$(".store-nav-hidden-div").hide();
		$(".store-nav-hidden-list").hide();
		$("#shop-div").toggle();
		$("#shop-list").toggle();

	})

	$("#store-nav > li:nth-child(6)").on("mouseover", function(){
		$(".store-nav-hidden-div").hide();
		$(".store-nav-hidden-list").hide();
		$("#lookbooks-div").toggle();
		$("#lookbooks-list").toggle();

	})

	

	$("#hidden-nav > li:nth-child(2) > a").on("click", function(){
		event.preventDefault();
		// $("#mobile-store-div").slideToggle();
		$("#mobile-store-list").slideToggle();
		

	})

	

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

		//... CUSTOM CSS DROPDOWN


	$(function() {

		var dd = new DropDown( $('#dd') );

		$(document).click(function() {
			// all dropdowns
			$('.wrapper-dropdown-4').removeClass('active');
		});

	});

	function DropDown(el) {
    this.dd = el;
    this.opts = this.dd.find('ul.dropdown > li');
    this.val = [];
    this.index = [];
    this.initEvents();
}
DropDown.prototype = {
    initEvents : function() {
        var obj = this;

        obj.dd.on('click', function(event){
            $(this).toggleClass('active');
            event.stopPropagation();
        });

        obj.opts.children('label').on('click',function(event){
            var opt = $(this).parent(),
                chbox = opt.children('input'),
                val = chbox.val(),
                idx = opt.index();

            ($.inArray(val, obj.val) !== -1) ? obj.val.splice( $.inArray(val, obj.val), 1 ) : obj.val.push( val );
            ($.inArray(idx, obj.index) !== -1) ? obj.index.splice( $.inArray(idx, obj.index), 1 ) : obj.index.push( idx );
        });
    },
    getValue : function() {
        return this.val;
    },
    getIndex : function() {
        return this.index;
    }
}

	// END CUSTOM CSS DROPDOWN 




	 // var picid = $('#listings-show-pictures > li > a > img').attr("id")
	 // // var picidtext = $("#" + picid)
	 // var picid_text = ("#" + picid);
	 // console.log(picid_text)
	 // $("picid_text").elevateZoom()

	 // $("a.zoom").zoom({
	 // 	magnify: .8
	 // });







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


  //initialize swiper when document ready  
    var mySwiper = new Swiper ('.swiper-container', {
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






	

})
