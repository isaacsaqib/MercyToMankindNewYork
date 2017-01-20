class AddCollectionToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :collection, :string
  end
end
