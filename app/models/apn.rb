class Apn < ActiveRecord::Base
  belongs_to :profile
  has_many :reviews
end
