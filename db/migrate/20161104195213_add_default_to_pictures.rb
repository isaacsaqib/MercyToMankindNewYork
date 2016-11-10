class AddDefaultToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :default, :boolean, :null => false, :default => false
  end
end
