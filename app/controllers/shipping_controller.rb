
class ShippingController < ApplicationController
	
	def index
if params[:firstname]
	session[:firstname] = params[:firstname]
 	session[:lastname] = params[:lastname]
 	session[:phone] = params[:phone]
 	session[:company] = params[:company]
 	session[:apt] = params[:apt]
 	session[:email] = params[:email]
 	session[:address] = params[:address]
 	session[:city] = params[:city]
 	session[:state] = params[:select_state]
 	session[:zip] = params[:zip]
 	session[:country] = params[:country]
 	session[:shipping] = params[:shipping]
 	session[:code] = params[:code]
 	session[:tax] = 'null'
 	if params[:select_state]=='NY'
 		session[:tax] = 0.0875
 	end

 
 
 	
 	redirect_to "/checkout"
 end
	end

 def create
 	


  end

end
