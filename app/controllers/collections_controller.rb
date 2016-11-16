class CollectionsController < ApplicationController 
	def index
		@listings_collection = Listing.where(:section => "Collection").order(price: :desc)
	end

	def show
		
	  	@listing  = Listing.find(params[:id])
    	@pictures = @listing.pictures
	end

	def destroy
	@listing = Listing.find(params[:id])
	@listing.destroy
	
	end


end
