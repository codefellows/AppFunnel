class AddReviewedBooleanToApns < ActiveRecord::Migration
  def change
    add_column :apns, :reviewed, :boolean, default: false
  end
end
