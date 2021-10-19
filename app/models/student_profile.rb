class StudentProfile < ApplicationRecord
    belongs_to :user, inverse_of: :student_profile, optional: :true
    belongs_to :family, inverse_of: :students
    belongs_to :studio, inverse_of: :students, optional: true
    has_one :teacher, through: :studio, source: :teacher_profile
    has_many :guardians, through: :family, source: :guardians
    has_many :events, inverse_of: :student_profile

    enum status: [:active, :lead, :waiting, :trial, :inactive]

end
