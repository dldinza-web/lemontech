require 'rails_helper'

RSpec.describe Exam, type: :model do
  let(:course2) { Fabricate(:course, name: 'Algoritmos') }
  subject!{ Fabricate :exam, course_id: course2.id }

  it "creates" do
    expect(subject).to be_persisted
    expect(subject.course).to be_persisted
  end

  context "with empty attributes" do
    it "raises an error" do
      expect{ Fabricate(:exam, name: nil, course_id: course2.id)}.to raise_error "Validation failed: Name can't be blank"
      expect{ Fabricate(:exam, name: "IA", course_id: nil)}.to raise_error "Validation failed: Course must exist"
    end
  end

  context "two exams with the same name and course" do
    it "raise an error" do
      expect{ Fabricate :exam, course_id: course2.id }.to raise_error "Validation failed: Course mustn't have an exam repeated"
    end
  end
end
