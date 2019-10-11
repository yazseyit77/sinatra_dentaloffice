class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :purpose
      t.integer  :dentist_id
      t.integer  :patient_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps null: false
    end
  end
end
