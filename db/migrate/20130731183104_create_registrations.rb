class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :decision
      t.text :note
      t.references :apn
      t.references :course
      t.timestamps
    end
  end
end
