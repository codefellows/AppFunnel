class CreateApns < ActiveRecord::Migration
  def change
    create_table :apns do |t|
      t.integer :applicant_id
      t.string :employment
      t.string :skype
      t.string :gplus
      t.text :why
      t.text :diligent
      t.text :best
      t.text :cssfloat
      t.text :findout

      t.references :profile
      t.timestamps
    end
    # add_index :apns, :profile_id
  end
end
