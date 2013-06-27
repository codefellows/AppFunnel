# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  apn_id          :integer
#  education       :integer
#  contribution    :integer
#  resume          :integer
#  fit             :integer
#  work_experience :integer
#  note            :text
#  exceptional     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  total           :integer
#  decision        :string(255)
#

class Review < ActiveRecord::Base
  belongs_to :apn

  validates :education, :contribution, :resume, :fit, :work_experience,
    presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5 }

  before_save :calculate_total

  def calculate_total
    self.total = (education * 3) + (contribution * 5) +
      (resume * 2) + (fit * 2) + (work_experience * 2)
  end

end
