class Studio < ApplicationRecord
    belongs_to :teacher, class_name: :User
    has_many :families, dependent: :destroy
    has_many :students, -> { where(role: 1) }, class_name: :User, dependent: :destroy
    has_many :guardians, -> { where(role: 2) }, class_name: :User, dependent: :destroy

end
