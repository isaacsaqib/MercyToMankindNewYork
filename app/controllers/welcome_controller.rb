class WelcomeController < ApplicationController
	
  def index
  	session[:cart] ||= {}
	session[:cart][params[:id]] = [params[:id], params[:name], params[:desc],params[:price]]
			@listings_slideshow = Listing.where(:section => "Slideshow")
      @listings_head = Listing.where(:section => "Head")

      @pictures = @listings_slideshow[0].pictures.order(description: :asc) 
      @listing = @listings_slideshow[0]

  end

  def media
  end

  def springsummersixteen
  end

  def complete
  end
  
  def brand
  end
  
  
  

end
