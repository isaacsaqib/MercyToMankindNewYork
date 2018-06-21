class ListingsController < ApplicationController
		skip_before_filter  :verify_authenticity_token

		def under_construction
		end
		

	def index
		

		if params[:remove]
			Listing.delete(params[:remove])
		end
		@listings = Listing.all.order(price: :desc)

		@listings_new = Listing.where(:section => "New").order(id: :desc)
		@listings_hoodies= Listing.where(:section => "Hoodies").order(id: :desc)
		@listings_long_sleeves= Listing.where(:section => "Long Sleeves").order(id: :desc)
		@listings_short_sleeves= Listing.where(:section => "Short Sleeves").order(id: :desc)
		@listings_tees= Listing.where(:section => "Tees").order(id: :desc)
		@listings_tanks= Listing.where(:section => "Tanks").order(id: :desc)
		@listings_jackets = Listing.where(:section => "Jackets").order(id: :desc)
		@listings_bottoms = Listing.where(:section => "Bottoms").order(id: :desc)
		@listings_denim = Listing.where(:section => "Denim").order(id: :desc)
		@listings_trousers = Listing.where(:section => "Trousers").order(id: :desc)
		@listings_shorts = Listing.where(:section => "Shorts").order(id: :desc)
		@listings_head = Listing.where(:section => "Head").order(id: :desc)
		@listings_wristwear = Listing.where(:section => "Wristwear").order(id: :desc)
		@listings_accessories = Listing.where(:section => "Accessories").order(id: :desc)
		
		@listings_press = Listing.where(:section => "Press")
		@listings_collection = Listing.where(:section => "Collection").order(:fabric)



		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end

	end


	def new
		@listing = Listing.new
	 	render :layout => false 

	end



	def create
		@listing = Listing.new(listing_params)

		respond_to do |format|
			if @listing.save
				if params[:images]
					params[:images].each {|image|
						@listing.pictures.create(image: image)
					}

				end

		format.html { redirect_to @listing, notice: 'listing was successfully created.' }
      format.json { render json: @listing, status: :created, location: @listing }
    else
      format.html { render action: "new" }
      format.json { render json: @listing.errors, status: :unprocessable_entity }
    end
  end
end

	

	def show
		if params[:id]
			session[:cart] ||= {}
		@listing = Listing.find(params[:id])
		@count_cart = session[:cart].count + 2
		end	


	  # Amount in cents
	  	
	  	@amount = @listing.price
	  	@listings = Listing.all

	  	@listing  = Listing.find(params[:id])
    	@pictures = @listing.pictures.order(:description)



    # LISTING UPDATE
    
	end

	def edit 
		@listing = Listing.find(params[:id])
	end


	
	 def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(listing_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @listing.pictures.create(image: image)
          }
        end
        format.html { redirect_to @listing, notice: 'listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  	end


	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
			if @listing.destroy
				redirect_to "/listings"
			end

	end

	def add_to_cart
		session[:cart] ||= {} # Creating an empty hash
		key = [params[:id], params[:size]].join('-') # creating a key = to the listing, size joined with a "-"
		session[:cart][key] = (session[:cart][key] || 0) + 1 #setting the key inside of the session hash to the listing object or 0, every time a key is set, it increments by 1
		redirect_to :cart 
	end

	def remove_from_cart
		session[:cart].delete(params[:id])
		redirect_to :cart
	end

	def tops
		@listings_hoodies= Listing.where(:section => "Hoodies").order(id: :desc)
		@listings_long_sleeves= Listing.where(:section => "Long Sleeves").order(id: :desc)
		@listings_short_sleeves= Listing.where(:section => "Short Sleeves").order(id: :desc)
		@listings_tanks= Listing.where(:section => "Tanks").order(id: :desc)
		@listings_tees= Listing.where(:section => "Tees").order(id: :desc)

	end	

	def tees
		@listings_tees= Listing.where(:section => "Tees").order(id: :desc)

	end


	def jackets
		@listings_jackets = Listing.where(:section => "Jackets").order(id: :desc)
	end

	def hoodies
		@listings_hoodies= Listing.where(:section => "Hoodies").order(id: :desc)
	end

	def bottoms
		@listings_denim = Listing.where(:section => "Denim").order(id: :desc)
		@listings_trousers = Listing.where(:section => "Trousers").order(id: :desc)
		@listings_shorts = Listing.where(:section => "Shorts").order(id: :desc)
		
	end

	def denim
		@listings_denim = Listing.where(:section => "Denim").order(id: :desc)
	end	

	def trousers
		@listings_trousers = Listing.where(:section => "Trousers").order(id: :desc)
	end

	def shorts
		@listings_shorts = Listing.where(:section => "Shorts").order(id: :desc)
	end



	def long_sleeves
		@listings_long_sleeves = Listing.where(:section => "Long Sleeves").order(id: :desc)
	end	

	def short_sleeves
		@listings_short_sleeves = Listing.where(:section => "Short Sleeves").order(id: :desc)
		@listings_tees= Listing.where(:section => "Tees").order(id: :desc)

	end


	def accessories
		@listings_accessories = Listing.where(:section => "Accessories").order(id: :desc)		
	end

	def head
		@listings_head = Listing.where(:section => "Head").order(id: :desc)	
	end

	def sale
		@listings_sale = Listing.where(:on_sale => "true").order(id: :desc)	
	end

	def hidden
		@listings_hidden = Listing.where(:is_hidden => "true")

	end


	def fall_winter_2016
		@listings_fall_winter_2016 = Listing.where(:collection => "FALL/WINTER2016").order(id: :desc)	
	end	

	def pre_spring_2017
		@listings_pre_spring_2017 = Listing.where(:collection => "PRE-SPRING 17").order(id: :desc)	
	end	

	def spring_summer_2016
		@listings_spring_summer_2016 = Listing.where(:collection => "SPRING/SUMMER2016").order(id: :desc)	
	end	

	def fall_winter_2015
		@listings_fall_winter_2015 = Listing.where(:collection => "FALL/WINTER2015").order(id: :desc)	
	end

	def judgement_day_capsule
		@listings_judgement_day_capsule = Listing.where(:collection => "JUDGEMENTDAYCAPSULE").order(id: :desc)	
	end








	private

	def listing_params
		params.require(:listing).permit(:name, :price, :original_price, :images, :size, :pictures, :description, :section, :collection, :fabric, :fit, :care, :position, :on_sale, :is_new, :is_hidden, :size_guide)

	end
	


end
