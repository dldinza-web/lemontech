class ResultExam < ApplicationRecord
  validates :mark, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 7 }
  validates :exam_id, uniqueness: { scope: :course_student_id, message: "belongs to one student of one course" }

  belongs_to :exam
  belongs_to :course_student
end
