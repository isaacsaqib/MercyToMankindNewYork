class AddCareToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :care, :string
  end
end
