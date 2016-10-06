require 'rails_helper'

describe Student do
  subject!{ Fabricate :student }

  it "returns full name" do
    expect(subject.full_name).to eq "Pedro Álvarez"
  end

  context "without height" do
    it "creates student" do
      expect(subject).to be_persisted
    end
  end

  context "with height" do
    it "creates student" do
      subject.update_attribute(:height, 1.43)

      expect(subject.errors).to be_empty
      expect(subject.height).to eq 1.43
    end
  end

  context "with multiple courses" do
    let(:teacher) { Fabricate(:teacher, name: 'Miguel') }
    let!(:courses) {[
      Fabricate(:course),
      Fabricate(:course, name: 'Algoritmos', teacher_id: teacher.id)
    ]}

    it "entered to some courses" do
      expect(Fabricate(:course_student, course_id: courses[0].id, student_id: subject.id)).to be_persisted
      expect(Fabricate(:course_student, course_id: courses[1].id, student_id: subject.id)).to be_persisted
      expect(subject.courses.count).to eq 2
    end

    context "with result of exams" do
      let!(:course_student) { Fabricate(:course_student, course_id: courses[0].id, student_id: subject.id) }

      let!(:exams) {[
        Fabricate(:exam, name: "Solemne 1", course_id: courses[0].id),
        Fabricate(:exam, name: "Solemne 2", course_id: courses[0].id),
        Fabricate(:exam, name: "Solemne 3", course_id: courses[0].id)
      ]}

      let!(:result_exams) {[
        Fabricate(:result_exam, course_student_id: course_student.id, exam_id: exams[0].id, mark: 3 ),
        Fabricate(:result_exam, course_student_id: course_student.id, exam_id: exams[1].id, mark: 6 ),
        Fabricate(:result_exam, course_student_id: course_student.id, exam_id: exams[2].id, mark: 7 )
      ]}

      it "has marks" do
        expect(subject.course_students[0].result_exams.count).to eq 3
        expect(subject.exams('Programming').count).to eq 3
      end

      it "show the average of marks for a course" do
        expect(subject.avg_marks('Programming')).to eq 5
      end

      context "with the same result twice" do
        it "raises error" do
          expect{ Fabricate(:result_exam, course_student_id: course_student.id, exam_id: exams[0].id, mark: 3) }.to raise_error "Validation failed: Exam belongs to one student of one course"
        end
      end
    end
  end

  context "with empty parameters" do
    it "raises errors" do
      expect{ Fabricate :student, name: nil }.to raise_error "Validation failed: Name can't be blank"
      expect{ Fabricate :student, surname: nil }.to raise_error "Validation failed: Surname can't be blank"
      expect{ Fabricate :student, birthday: nil, name: 'Juan', surname: 'Frankling' }.to raise_error "Validation failed: Birthday can't be blank"
    end
  end

  context "with two students with the same name" do
    it "raises an error" do
      expect{ Fabricate :student }.to raise_error 'Validation failed: Name and Surname identify one person'
    end
  end
end
