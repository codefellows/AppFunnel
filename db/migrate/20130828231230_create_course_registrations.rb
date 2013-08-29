class CreateCourseRegistrations < ActiveRecord::Migration
  def change
    create_table :course_registrations do |t|
      t.string :decision
      t.references :apn
      t.references :course
      t.timestamps
    end
  end
end
