class StudentProfile < ApplicationRecord
    belongs_to :student, class_name: :User

    enum status: [:active, :lead, :waiting, :trial, :inactive]
end
