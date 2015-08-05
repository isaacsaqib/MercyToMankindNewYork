class ListingsController < ApplicationController
	
	def index
		if params[:id]
			session[:cart] ||= {}
		@listing = Listing.find(params[:id])
		@count_cart = session[:cart].count + 2
			session[:cart][@count_cart] = [@listing.name,@listing.price,params[:id],params[:size],@count_cart]
		end	

		if params[:remove]
			Listing.delete(params[:remove])
		end
		@listings = Listing.all
	end


	def new
		@listing = Listing.new
	end



	def create
		@listing = Listing.create(listing_params)
		if @listing.save
			redirect_to "/listings"
		else
			render :new
		end

	end

	def show


		if params[:id]
			session[:cart] ||= {}
		@listing = Listing.find(params[:id])
			session[:cart][params[:id]] = [@listing.name,@listing.price,params[:id]]
		end	
	  # Amount in cents
	  	
	  	@amount = @listing.price
	end

	def edit 
		@listing = Listing.find(params[:id])
	end


	def update
		@listing = Listing.find(params[:id])

			if @listing.update(listing_params)
				redirect_to "/"
			else
				render 'edit'
			end
	end


	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
	end



	private

	def listing_params
		params.require(:listing).permit(:name, :price, :image_url, :avatar,:size)

	end
	


end
