class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.timestamps null: false
    end
  end
end
