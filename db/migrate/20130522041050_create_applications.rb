class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :employment
      t.string :skype
      t.string :gplus
      t.string :linkedin
      t.text :why
      t.text :diligence
      t.text :bestthing
      t.text :cssfloat
      t.text :findout

      t.timestamps
    end
  end
end
