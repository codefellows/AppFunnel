class AddRegistrationsToReviews < ActiveRecord::Migration
  def change
    add_column :registrations, :review_id, :integer
  end
end
