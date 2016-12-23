class OrdersController < ApplicationController
	
	def index
		if session[:firstname]
		 	@user_c = Orders.create(:firstname=>session[:firstname],:lastname=>session[:lastname],:email=>session[:email],:address=>session[:address],:city=>session[:city],:state=>session[:state],:zip=>session[:zip],:country=>session[:country],:shipping=>session[:shipping],:products=>session[:product_names],:amount=>session[:total])
				@user_c.save
				session.delete(:firstname)
				session.delete(:lastname)
				session.delete(:email)
				session.delete(:address)
				session.delete(:city)
				session.delete(:state)
				session.delete(:zip)
				session.delete(:country)
				session.delete(:shipping)
				session.delete(:product_names)
				session.delete(:total)
				session.delete(:cart)
		 end
 		
		@users = Orders.all
	end


	def new
		@users = Orders.new
	end



	def create
	

	end

	def show



	end

	def edit 
		@users = Orders.find(params[:id])
	end


	def update
		@users = Orders.find(params[:id])

			if @users.update(listing_params)
				redirect_to "/"
			else
				render 'edit'
			end
	end


	def destroy
		@users = Orders.find(params[:id])
		@users.destroy
	end

	def complete
		
	
	end







	private

	def listing_params
		params.require(:listing).permit(:name, :price, :image_url, :avatar,:size)

	end
	


end
