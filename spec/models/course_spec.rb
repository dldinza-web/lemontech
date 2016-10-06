require 'rails_helper'

describe Course do
  subject!{ Fabricate(:course) }
  let(:teacher2) { Fabricate :teacher, name: 'Raúl' }

  it "creates one" do
    expect(subject).to be_persisted
    expect(subject.teacher).to be_persisted
  end

  it "has multiple exams" do
    Fabricate(:exam, name: "Solemne 1", course_id: subject.id)
    Fabricate(:exam, name: "Solemne 2", course_id: subject.id)

    expect(subject.exams.count).to eq 2
  end

  context "with multiple students" do
    let!(:students) {[
      Fabricate(:student),
      Fabricate(:student, name: "Marcus"),
    ]}

    it "has students" do
      subject.students = students
      expect(subject.course_students.count).to eq 2
      expect(subject.students.count).to eq 2
    end

    describe "insertion of the same student twice" do
      it "raises an error" do
        subject.students.push(students[0])
        expect{ subject.students.push(students[0]) }.to raise_error "Validation failed: Course has one student once"
      end
    end
  end

  context "with empty fields" do
    it "raise error" do
      expect{ Fabricate(:course, name: nil, teacher_id: teacher2.id) }.to raise_error "Validation failed: Name can't be blank"
      expect{ Fabricate(:course, name: "Literatura Universal", teacher_id: nil) }.to raise_error "Validation failed: Teacher must exist"
    end
  end

  context "with another course has the same name" do
    it "raises an error" do
      expect{ Fabricate(:course, teacher_id: teacher2.id) }.to raise_error "Validation failed: Name has already been taken"
    end
  end

  context "with courses with different names" do
    it "creates the another course" do
      expect(Fabricate(:course, name: "Fisica", teacher_id: teacher2.id)).to be_persisted
    end
  end

  context "with two courses with the same name and teacher" do
    let!(:course_fisica) { Fabricate(:course, name: "Fisica", teacher_id: teacher2.id) }

    it "raises an error" do
      expect{ Fabricate(:course, name: "Fisica", teacher_id: teacher2.id) }.to raise_error "Validation failed: Name of course has one teacher, Name has already been taken"
    end
  end
end
