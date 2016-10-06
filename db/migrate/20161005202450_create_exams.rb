class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string      :name,    null: false, index: true
      t.references  :course,  null: false, foreign_key: true

      t.timestamps
    end

    add_index :exams, [ :name, :course_id ], unique: true
  end
end
