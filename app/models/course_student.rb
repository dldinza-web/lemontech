class CourseStudent < ApplicationRecord
  validates :course_id, uniqueness: { scope: :student_id, message: "has one student once" }

  belongs_to  :course
  belongs_to  :student
  has_many    :result_exams
end
