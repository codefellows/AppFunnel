class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :desc_url
      t.date :start_date
      t.date :end_date
      t.integer :cost
      t.string :course_type

      t.timestamps
    end
  end
end
