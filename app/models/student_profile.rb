class StudentProfile < ApplicationRecord
    belongs_to :user

    has_many :events_as_student, class_name: :Event, foreign_key: :student_id, dependent: :nullify
end
