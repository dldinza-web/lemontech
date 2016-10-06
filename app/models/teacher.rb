class Teacher < ApplicationRecord
  validates :name, :surname, presence: true
  validates :name, uniqueness: { scope: :surname, message: "and Surname identify one person" }

  has_many :courses

  def full_name
    "#{name} #{surname}"
  end
end
