require 'rails_helper'

RSpec.describe Exam, type: :model do
  subject!{ Fabricate :exam }

  it "creates" do
    expect(subject).to be_persisted
  end

  context "with empty attributes" do
    it "raises an error" do
      expect{ Fabricate(:exam, name: nil)}.to raise_error "Validation failed: Name can't be blank"
    end
  end

  context "two exams with the same name" do
    it "raise an error" do
      expect{ Fabricate :exam }.to raise_error "Validation failed: Name has already been taken"
    end
  end
end
