class AddIsNewToListings < ActiveRecord::Migration
  def change
  	  	add_column :listings, :is_new, :boolean, :null => false, :default => false

  end
end
