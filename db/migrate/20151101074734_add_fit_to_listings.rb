class AddFitToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :fit, :string
  end
end
