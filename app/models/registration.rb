class Registration < ActiveRecord::Base
  belongs_to :apn
  belongs_to :course
end
