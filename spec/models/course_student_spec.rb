require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  subject!{ Fabricate(:course_student) }

  it "creates one" do
    expect(subject).to be_persisted
  end

  context "with empty attributes" do
    let(:teacher) { Fabricate :teacher, name: 'Miguel' }
    let(:course) { Fabricate :course, name: 'Matemática', teacher_id: teacher.id  }
    let(:student) { Fabricate :student, name: 'Luis' }

    it "raises_error" do
      expect{Fabricate(:course_student, course_id: nil, student_id: student.id)}.to raise_error "Validation failed: Course must exist"
      expect{Fabricate(:course_student, course_id: course.id, student_id: nil)}.to raise_error "Validation failed: Student must exist"
    end
  end
end
