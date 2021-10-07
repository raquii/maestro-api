class Family < ApplicationRecord
    belongs_to :studio
    has_many :children, -> { where(role: 1) }, class_name: :User
    has_many :guardians, -> { where(role: 2) }, class_name: :User
    has_one :teacher, through: :studio, class_name: :User
    
    has_many :events_as_student, through: :children
end
