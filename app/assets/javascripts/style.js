

$(document).ready(function(){
	$("#shop-sub-nav").hide();
	// $("#new").hide();
	$("#tops").hide();
	$("#bottoms").hide();
	$("#headwear").hide();
	$("#wristwear").hide();
	$("#added").hide();
	$("#contact-hide").hide();


	// $("#add-to-cart-btn").on("click", function(){
	// 	alert("Added to cart");

	// })

	$("#nav li:nth-child(3)").on("click", function(){ /* shop button */
		event.preventDefault();
		$("#contact-hide").slideDown();


	})


	$("#listings-index-nav li:nth-child(1)").on("click", function(){  /* New */
		$(".products").hide();
		$("#new").show();

	})



	$("#listings-index-nav li:nth-child(2)").on("click", function(){  /* Tops */
		$(".products").hide();
		$("#tops").show();

	})


	$("#listings-index-nav li:nth-child(3)").on("click", function(){ /* Bottoms */
		$(".products").hide();
		$("#bottoms").show();

	})



	$("#listings-index-nav li:nth-child(4)").on("click", function(){ /* Headwear */
		$(".products").hide();
		$("#headwear").show();

	})



	$("#listings-index-nav li:nth-child(5)").on("click", function(){ /* Wristwear */
		$(".products").hide();
		$("#wristwear").show();

	})









})