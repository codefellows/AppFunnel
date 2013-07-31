class Registrations < ActiveRecord::Base
  belongs_to :apn
  belongs_to :course
end
