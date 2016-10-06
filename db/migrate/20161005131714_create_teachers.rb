class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :surname, null: false

      t.timestamps
    end

    add_index :teachers, [:name, :surname], unique: true
  end
end
