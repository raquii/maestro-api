class GuardianProfile < ApplicationRecord
    belongs_to :user, inverse_of: :guardian_profile, optional: :true
    belongs_to :family, inverse_of: :guardians
    belongs_to :studio, inverse_of: :guardians
    has_many :students, through: :family, source: :students
    has_one :teacher, through: :studio, source: :teacher_profile

end