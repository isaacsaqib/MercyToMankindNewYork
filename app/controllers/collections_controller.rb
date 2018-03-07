class CollectionsController < ApplicationController 
	def index
		@listings_collection = Listing.where(:section => "Collection").order(:fabric)
	end

	def show
		
	  	@listing  = Listing.find(params[:id])
    	@pictures = @listing.pictures.shuffle
		render :layout => "show_layout"
	end

	def destroy
	@listing = Listing.find(params[:id])
	@listing.destroy
	
	end


end
