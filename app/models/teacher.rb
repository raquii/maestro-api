class Teacher < ApplicationRecord
    has_one :user, as: :role, dependent: :destroy
    
    has_one :studio, dependent: :destroy
    has_many :events, dependent: :destroy

    has_many :families, through: :studio
    has_many :students, through: :studio
    has_many :parents, through: :studio
    
end
