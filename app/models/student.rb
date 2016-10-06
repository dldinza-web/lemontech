class Student < ApplicationRecord
  validates :name, :surname, :birthday, presence: true
  validates :name, uniqueness: { scope: :surname, message: "and Surname identify one person" }

  has_many    :course_students
  has_many    :courses, through: :course_students

  def full_name
    "#{name} #{surname}"
  end

  def exams(course_name)
    cs = CourseStudent.includes(:student, :course)
      .where(students: { id: id })
      .where(courses: { name: course_name })
      .first

    cs.blank? ? [] : cs.result_exams
  end

  def avg_marks(course_name)
    marks = exams(course_name).map(&:mark)
    sum = 0

    if marks.present?
      marks.each { |num| sum += num }
      sum / marks.size
    else
      sum
    end
  end
end
