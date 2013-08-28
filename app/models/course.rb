class Course < ActiveRecord::Base
  #attr_accessible :cost, :course_type, :desc_url, :description, :end_date, :name, :start_date
  has_many :registrations
  has_many :applications, through: :registrations
  validates :name, :description, :course_type, presence: true

  scope :future, lambda { where('"start_date" > ?', Time.zone.today).order("start_date") }

  def applicants
    #all registrations for course instance
    @registrations = Registration.where( "course_id = ?", id)
    #all applicants
  end

  def applicants_count
   Registration.where( "course_id = ?", id).count
  end

  def accepted_applicants_count
    Registration.where( course_id: id, decision: "accepted").count
  end
end
