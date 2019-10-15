class Dentist < ActiveRecord::Base
    has_many :patients
    has_many :appointments, through: :patients

    has_secure_password
    validates_uniqueness_of :username
    validates_presence_of :name, :username, :email, :password
end
