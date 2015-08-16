class ShippingController < ApplicationController
	
	def index
if params[:firstname]
	session[:firstname] = params[:firstname]
 	session[:lastname] = params[:lastname]
 	session[:email] = params[:email]
 	session[:address] = params[:address]
 	#session[:state] = params[:city]
 	session[:state] = params[:state]
 	session[:zip] = params[:zip]
 	session[:country] = params[:country]
 	session[:shipping] = params[:shipping]

 	if params[:state]=='NY' && params[:select_state]!='Select state'
 		session[:state] = params[:select_state]
 		session[:tax] = 0.0875
 	end
 	if params[:state]!='' && params[:select_state]=='Select state'
 		session[:state] = params[:state]
 		session[:tax] = 'null'
 	end
 	
 	redirect_to "/checkout"
 end
	end

 def create
 	


  end

end
