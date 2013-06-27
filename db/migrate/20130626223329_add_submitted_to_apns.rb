class AddSubmittedToApns < ActiveRecord::Migration
  def change
    add_column :apns, :submitted, :boolean
  end
end
