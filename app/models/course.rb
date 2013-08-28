class Course < ActiveRecord::Base
  #attr_accessible :cost, :course_type, :desc_url, :description, :end_date, :name, :start_date
  has_many :registrations
  has_many :applications, through: :registrations
  validates :name, :description, :course_type, presence: true

  # number of applicants: number of registrations where course_id = course.id
  # number accepted: number of registrations for course_id where decision is accepted

  def applicants
   Registration.where( "course_id = ?", id).count
  end

  def accepted_applicants
    Registration.where( course_id: id, decision: "accepted").count
  end
end
