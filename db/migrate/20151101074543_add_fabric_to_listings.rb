class AddFabricToListings < ActiveRecord::Migration
  def change
  	  		add_column :listings, :fabric, :string

  end
end
