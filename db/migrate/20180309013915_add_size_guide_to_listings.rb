class AddSizeGuideToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :size_guide, :string
  end
end
