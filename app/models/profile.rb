# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  city         :string(255)
#  state        :string(255)
#  gender       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  twitter      :string(255)
#  linkedin     :string(255)
#  github       :string(255)
#

class Profile < ActiveRecord::Base
  has_one :apn, :dependent => :delete
  accepts_nested_attributes_for :apn
  belongs_to :user

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone_number,
    :city, :state, presence: true
end
