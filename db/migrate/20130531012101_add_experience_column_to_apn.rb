class AddExperienceColumnToApn < ActiveRecord::Migration
  def change
    add_column :apns, :experience, :text
  end
end
