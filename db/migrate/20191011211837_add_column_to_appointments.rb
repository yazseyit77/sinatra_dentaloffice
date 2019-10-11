class AddColumnToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appoinment_date, :string
  end
end
