class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :apn_id
      t.integer :education
      t.integer :contribution
      t.integer :resume
      t.integer :fit
      t.integer :work_experience
      t.text :note
      t.integer :exceptional

      t.timestamps
    end
  end
end
