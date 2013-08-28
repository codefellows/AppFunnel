class Course < ActiveRecord::Base
  #attr_accessible :cost, :course_type, :desc_url, :description, :end_date, :name, :start_date
  has_many :apns, through: :registrations
  validates :name, :description, :course_type, presence: true
end
