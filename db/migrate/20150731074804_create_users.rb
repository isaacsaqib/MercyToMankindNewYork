class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :shipping
      t.string :amount
      t.timestamps
    end
  end
end
