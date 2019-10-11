class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :adress
      t.string :email
      t.integer :phone
      t.text :description
      t.timestamps null: false
    end
  end
end
