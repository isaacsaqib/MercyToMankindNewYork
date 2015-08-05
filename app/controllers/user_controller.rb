class UserController < ApplicationController
	
	def index
if session[:firstname]
 	@user_c = User.create(:firstname=>session[:firstname],:lastname=>session[:lastname],:email=>session[:email],:address=>session[:address],:city=>session[:city],:state=>session[:state],:zip=>session[:zip],:country=>session[:country],:shipping=>session[:shipping])
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
 end
		@users = User.all
	end


	def new
		@users = User.new
	end



	def create
	

	end

	def show



	end

	def edit 
		@users = User.find(params[:id])
	end


	def update
		@users = User.find(params[:id])

			if @users.update(listing_params)
				redirect_to "/"
			else
				render 'edit'
			end
	end


	def destroy
		@users = User.find(params[:id])
		@users.destroy
	end



	private

	def listing_params
		params.require(:listing).permit(:name, :price, :image_url, :avatar,:size)

	end
	


end
