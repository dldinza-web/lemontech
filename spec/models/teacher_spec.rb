require 'rails_helper'

describe Teacher do
  subject!{ Fabricate :teacher }

  it "one teacher" do
    expect(subject.name).to eq 'Jose'
  end

  context "with empty fields" do
    it "raise error" do
      expect{ Fabricate(:teacher, name: nil) }.to raise_error "Validation failed: Name can't be blank"
      expect{ Fabricate(:teacher, surname: nil) }.to raise_error "Validation failed: Surname can't be blank"
    end
  end

  it "returns full name" do
    expect(subject.full_name).to eq "Jose Rodriguez"
  end

  it "has multiple courses" do
    Fabricate(:course, teacher_id: subject.id)
    Fabricate(:course, name: "Estadísticas", teacher_id: subject.id)

    expect(subject.courses.count).to eq 2
  end

  context "with two teachers with the same name" do
    it "raises an error" do
      expect{ Fabricate :teacher }.to raise_error 'Validation failed: Name and Surname identify one person'
    end
  end
end
