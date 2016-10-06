class CreateCourseStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :course_students do |t|
      t.references :course,   null: false, foreign_key: true
      t.references :student,  null: false, foreign_key: true

      t.timestamps
    end

    add_index :course_students, [:course_id, :student_id], unique: true
  end
end
