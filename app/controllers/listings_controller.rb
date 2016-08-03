class ListingsController < ApplicationController
		skip_before_filter  :verify_authenticity_token

	def index
		

		if params[:remove]
			Listing.delete(params[:remove])
		end
		@listings = Listing.all

		@listings_new = Listing.where(:section => "New")
		@listings_tops= Listing.where(:section => "Tops").order(price: :desc)
		@listings_jackets = Listing.where(:section => "Jackets").order(price: :desc)
		@listings_bottoms = Listing.where(:section => "Bottoms").order(price: :desc)
		@listings_head = Listing.where(:section => "Head").order(price: :desc)
		@listings_wristwear = Listing.where(:section => "Wristwear").order(price: :desc)
		@listings_ss16capsule = Listing.where(:section => "SS16 Capsule").order(price: :desc)
		
		@listings_collection = Listing.where(:section => "Collection")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end

	end


	def new
		@listing = Listing.new

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

	  	@listing  = Listing.find(params[:id])
    	@pictures = @listing.pictures

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


	private

	def listing_params
		params.require(:listing).permit(:name, :price, :images, :size, :pictures, :description, :section, :fabric, :fit, :care, :position)

	end
	


end
