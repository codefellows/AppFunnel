class Profile < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone_number,
    :city, :state, presence: true
end
