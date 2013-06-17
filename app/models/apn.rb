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
#

class Apn < ActiveRecord::Base
  belongs_to :profile
  has_many :reviews

  validates :why, :diligent, :experience, :cssfloat, :findout, presence: true
end
