class Student < ApplicationRecord
    has_many :students_cohorts, dependent: :destroy
    has_many :cohorts, through: :students_cohorts
    validates :age, numericality: {less_than_or_equal_to: 150}
end
