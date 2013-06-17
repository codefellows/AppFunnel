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
#

class Review < ActiveRecord::Base
  belongs_to :apn
end
