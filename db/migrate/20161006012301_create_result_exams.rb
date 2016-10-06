class CreateResultExams < ActiveRecord::Migration[5.0]
  def change
    create_table :result_exams do |t|
      t.references  :course_student,    null: false, foreign_key: true
      t.references  :exam,              null: false, foreign_key: true
      t.integer     :mark,              null: false, limit: 1
      t.timestamps
    end

    add_index :result_exams, [:course_student_id, :exam_id], unique: true
  end
end
