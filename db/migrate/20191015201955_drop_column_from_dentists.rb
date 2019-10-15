class DropColumnFromDentists < ActiveRecord::Migration
  def change
    remove_column :dentists, :password
  end
end
