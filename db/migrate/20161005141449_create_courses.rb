class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string      :name,      null: false
      t.references  :teacher,   null: false, foreign_key: true

      t.timestamps
    end

    add_index :courses, [:name, :teacher_id], unique: true
    add_index :courses, :name, unique: true
  end
end
