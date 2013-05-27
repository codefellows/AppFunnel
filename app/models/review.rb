class Review < ActiveRecord::Base
  has_one :apn
  attr_accessible :education, :essay, :fuzzy, :online
end
