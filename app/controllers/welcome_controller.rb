class WelcomeController < ApplicationController
	
  def index
  	session[:cart] ||= {}
	session[:cart][params[:id]] = [params[:id], params[:name], params[:desc],params[:price]]
  end

  def home
  end
  

end
