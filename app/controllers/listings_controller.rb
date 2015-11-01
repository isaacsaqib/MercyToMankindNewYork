class ListingsController < ApplicationController
		skip_before_filter  :verify_authenticity_token

	def index
		

		if params[:remove]
			Listing.delete(params[:remove])
		end
		@listings = Listing.all

		@listings_new = Listing.where(:section => "New")
		@listings_tops = Listing.where(:section => "Tops")
		@listings_bottoms = Listing.where(:section => "Bottoms")
		@listings_headwear = Listing.where(:section => "Headwear")
		@listings_wristwear = Listing.where(:section => "Wristwear")
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
			session[:cart][@count_cart] = [@listing.name,@listing.price,params[:product_id],params[:size],@count_cart]
		
		end	

		if params[:remove]
			Listing.delete(params[:remove])
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



	private

	def listing_params
		params.require(:listing).permit(:name, :price, :images, :size, :pictures, :description, :section, :fabric, :fit, :care)

	end
	


end
