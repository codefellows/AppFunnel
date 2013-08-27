# == Schema Information
#
# Table name: apns
#
#  id             :integer          not null, primary key
#  applicant_id   :integer
#  employment     :string(255)
#  skype          :string(255)
#  gplus          :string(255)
#  why            :text
#  diligent       :text
#  best           :text
#  cssfloat       :text
#  findout        :text
#  profile_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reviewed       :boolean          default(FALSE)
#  experience     :text
#  recommendation :string(255)
#  submitted      :boolean
#

class Apn < ActiveRecord::Base
  belongs_to :profile
  has_one :review
  accepts_nested_attributes_for :review
  has_many :registrations
  has_many :courses, through: :registrations


  validates :why, :diligent, :experience, :cssfloat, :findout, presence: true, :if => :button_submit?

  scope :submitted, -> { where(submitted: true) }
  scope :not_reviewed, -> { where(reviewed: false) }

  def button_submit?
    :submit
  end

end
