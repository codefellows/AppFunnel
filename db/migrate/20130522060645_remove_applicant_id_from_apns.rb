class RemoveApplicantIdFromApns < ActiveRecord::Migration
  def up
    remove_column :apns, :applicant_id
  end

  def down
    add_column :apns, :applicant_id, :integer
  end
end
