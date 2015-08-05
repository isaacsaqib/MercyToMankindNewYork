class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.integer :price 
    	t.string :image_url
    	t.string :size
    end
  end
end
