class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|

      t.timestamps null: false
    end
  end
end
