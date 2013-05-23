class AddIdsToApnsAndProfiles < ActiveRecord::Migration
  def up
    add_column :apns, :profile_id, :integer, unique: :true
    add_column :profiles, :apn_id, :integer, unique: :true
  end
  def up
    remove_column :apns, :profile_id
    remove_column :profiles, :apn_id
  end
end
