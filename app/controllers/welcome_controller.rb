class WelcomeController < ApplicationController
	
  def index
  	session[:cart] ||= {}
	session[:cart][params[:id]] = [params[:id], params[:name], params[:desc],params[:price]]
			
      @listings_head = Listing.where(:section => "Head")

      @listings_slideshow = Listing.where(:section => "Slideshow")
      @listing = @listings_slideshow[2]
      @pictures = @listings_slideshow[2].pictures.order(description: :asc) 

      @listings = Listing.all.order(price: :desc)
      
      @limited = @listings.first(25).shuffle
      @limited_final = @limited.first(6)
      @limited_final_desktop = @limited.first(4)



    @listings_new = Listing.where(:section => "New")
    @listings_hoodies= Listing.where(:section => "Hoodies")
    @listings_long_sleeves= Listing.where(:section => "Long Sleeves")
    @listings_short_sleeves= Listing.where(:section => "Short Sleeves")
    @listings_tees= Listing.where(:section => "Tees")
    @listings_tanks= Listing.where(:section => "Tanks")
    @listings_jackets = Listing.where(:section => "Jackets")
    @listings_bottoms = Listing.where(:section => "Bottoms")
    @listings_denim = Listing.where(:section => "Denim")
    @listings_head = Listing.where(:section => "Head")
    @listings_wristwear = Listing.where(:section => "Wristwear")
    @listings_accessories = Listing.where(:section => "Accessories")


  end

  def media
  end

  def springsummersixteen
  end

  def complete
  end
  
  def brand
  end
    

  def press
    @listings_press = Listing.where(:section => "Press").order(description: :desc) 
  end
  
  
  

end
