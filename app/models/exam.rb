class Exam < ApplicationRecord
  validates :name, presence: true
  validates :course_id, uniqueness: { scope: :name, message: "mustn't have an exam repeated" }

  belongs_to  :course
end
