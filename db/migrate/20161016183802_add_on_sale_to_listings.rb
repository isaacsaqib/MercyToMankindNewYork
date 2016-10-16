class AddOnSaleToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :on_sale, :string
  end
end
