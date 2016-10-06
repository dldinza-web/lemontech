class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string  :name,      null: false
      t.string  :surname,   null: false
      t.date    :birthday,  null: false
      t.decimal :height,    precision: 3, scale: 2

      t.timestamps
    end

    add_index :students, [:name, :surname], unique: true
  end
end
