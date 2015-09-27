class CollectionsController < ApplicationController 
	def index
		@listings_collection = Listing.where(:section => "Collection")
	end

	def show
		
	  	 @listing  = Listing.find(params[:id])
    	@pictures = @listing.pictures
	end


end
