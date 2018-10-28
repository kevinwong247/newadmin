class Cohort < ApplicationRecord
    has_many :students_cohorts, dependent: :destroy
    has_many :students, through: :students_cohorts
    has_one :instructor, dependent: :destroy
    belongs_to :course
end
