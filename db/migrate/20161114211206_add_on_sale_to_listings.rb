class AddOnSaleToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :on_sale, :boolean, :null => false, :default => false
  end
end
