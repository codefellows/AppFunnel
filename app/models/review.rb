class Review < ActiveRecord::Base
  attr_accessible :apn_id, :contribution, :education, :exceptional, :fit, :note, :resume, :user_id, :work_experience
end
