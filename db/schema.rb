# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161006012301) do

  create_table "course_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_id",  null: false
    t.integer  "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "student_id"], name: "index_course_students_on_course_id_and_student_id", unique: true, using: :btree
    t.index ["course_id"], name: "index_course_students_on_course_id", using: :btree
    t.index ["student_id"], name: "index_course_students_on_student_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "teacher_id"], name: "index_courses_on_name_and_teacher_id", unique: true, using: :btree
    t.index ["name"], name: "index_courses_on_name", unique: true, using: :btree
    t.index ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id", using: :btree
    t.index ["name", "course_id"], name: "index_exams_on_name_and_course_id", unique: true, using: :btree
    t.index ["name"], name: "index_exams_on_name", using: :btree
  end

  create_table "result_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_student_id",           null: false
    t.integer  "exam_id",                     null: false
    t.integer  "mark",              limit: 1, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["course_student_id", "exam_id"], name: "index_result_exams_on_course_student_id_and_exam_id", unique: true, using: :btree
    t.index ["course_student_id"], name: "index_result_exams_on_course_student_id", using: :btree
    t.index ["exam_id"], name: "index_result_exams_on_exam_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                               null: false
    t.string   "surname",                            null: false
    t.date     "birthday",                           null: false
    t.decimal  "height",     precision: 3, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["name", "surname"], name: "index_students_on_name_and_surname", unique: true, using: :btree
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "surname",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "surname"], name: "index_teachers_on_name_and_surname", unique: true, using: :btree
  end

  add_foreign_key "course_students", "courses"
  add_foreign_key "course_students", "students"
  add_foreign_key "courses", "teachers"
  add_foreign_key "exams", "courses"
  add_foreign_key "result_exams", "course_students"
  add_foreign_key "result_exams", "exams"
end
