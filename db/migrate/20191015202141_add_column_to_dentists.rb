class AddColumnToDentists < ActiveRecord::Migration
  def change
    add_column :dentists, :password_digest, :string
  end
end
