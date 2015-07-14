class CheckoutController < ApplicationController
	
	def index
    if params[:remove]
    session[:cart].delete(params[:remove])
    end
	end

end
