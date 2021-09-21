class Studio < ApplicationRecord
    belongs_to :teacher
    has_many :families, dependent: :destroy
    has_many :students, through: :families
    has_many :parents, through: :families

end
