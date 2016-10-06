require 'rails_helper'

RSpec.describe ResultExam, type: :model do
  subject{ Fabricate(:result_exam) }

  it "creates one" do
    expect(subject).to be_persisted
  end

  context "with marks empty" do
    it "raises error" do
      expect{ Fabricate(:result_exam, mark: nil) }.to raise_error "Validation failed: Mark can't be blank, Mark is not a number"
    end
  end

  context "with marks as not numeric" do
    it "raises error" do
      expect{ Fabricate(:result_exam, mark: 'a') }.to raise_error "Validation failed: Mark is not a number"
    end
  end

  context "with mark less than 2" do
    it "raises error" do
      expect{ Fabricate(:result_exam, mark: 1) }.to raise_error "Validation failed: Mark must be greater than or equal to 2"
    end
  end

  context "with mark greater than 7" do
    it "raises error" do
      expect{ Fabricate(:result_exam, mark: 8) }.to raise_error "Validation failed: Mark must be less than or equal to 7"
    end
  end

end
