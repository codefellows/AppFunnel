class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :essay
      t.integer :education
      t.integer :online
      t.integer :fuzzy
      t.references :apn

      t.timestamps
    end
    add_index :reviews, :apn_id
  end
end
