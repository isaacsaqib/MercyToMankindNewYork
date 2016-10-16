class AddOriginalPriceToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :original_price, :string
  end
end
