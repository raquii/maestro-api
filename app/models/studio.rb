class Studio < ApplicationRecord
    belongs_to :teacher_profile, inverse_of: :studio
    has_many :families, inverse_of: :studio, dependent: :destroy
    has_many :students, class_name: "StudentProfile", inverse_of: :studio, dependent: :destroy
    has_many :guardians, class_name: "GuardianProfile", inverse_of: :studio,  dependent: :destroy

end
