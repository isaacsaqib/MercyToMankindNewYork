class CartController < ApplicationController
	
	def index
    if params[:remove]
    	@validate_cart = session[:cart].count
    session[:cart].delete(params[:remove])
    if @validate_cart==1
    	session.delete(:cart)
    end
    end

	end


end
