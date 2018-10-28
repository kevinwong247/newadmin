class Course < ApplicationRecord
    has_many :cohorts, dependent: :destroy
    validates :hours, numericality: {greater_than: 0}
end
