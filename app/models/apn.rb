class Apn < ActiveRecord::Base
  belongs_to :profile
  has_many :reviews

  accepts_nested_attributes_for :profile
end
