class AddIsHiddenToListings < ActiveRecord::Migration[5.0]
  def change
  	  	  	add_column :listings, :is_hidden, :boolean, :null => false, :default => false

  end
end
