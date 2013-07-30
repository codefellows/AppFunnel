class Course < ActiveRecord::Base
  attr_accessible :cost, :course_type, :desc_url, :description, :end_date, :name, :start_date
end
