class AddVideoToApns < ActiveRecord::Migration
  def change
    add_column :apns, :video, :string
    add_column :apns, :code_sample, :string
  end
end
