class Course < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :teacher_id, message: "of course has one teacher" }
  validates :name, uniqueness: true

  belongs_to  :teacher
  has_many    :exams
  has_many    :course_students
  has_many    :students, through: :course_students
end
