class Registration < ActiveRecord::Base
  belongs_to :apn
  belongs_to :course
  belongs_to :review
end
