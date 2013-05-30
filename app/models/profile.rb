class Profile < ActiveRecord::Base
  has_one :apn, :dependent => :delete
  accepts_nested_attributes_for :apn

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone_number,
    :city, :state, presence: true
  belongs_to :user
  
end
