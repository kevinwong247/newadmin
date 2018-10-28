class Instructor < ApplicationRecord
    belongs_to :cohort, {optional: true}
    validates :age, numericality: {less_than_or_equal_to: 150}
  validates :salary, numericality: {greater_than_or_equal_to: 0}
  validates :education, inclusion: {in: %w(HighSchool College Masters PHD),
                                    message: "%{value} is not a valid. Should be HS, college, masters, or PHD."}, allow_nil: false
end

