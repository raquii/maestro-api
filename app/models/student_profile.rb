class StudentProfile < ApplicationRecord
    belongs_to :student, class_name: :User

    has_many :events, dependent: :nullify
end
