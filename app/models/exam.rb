class Exam < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
