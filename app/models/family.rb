class Family < ApplicationRecord
    belongs_to :studio
    has_many :students, -> { where(role: 1) }, class_name: :User
    has_many :children, -> { where(role: 1) }, class_name: :User
    has_many :parents, -> { where(role: 2) }, class_name: :User
    
    has_many :events_as_student, through: :students
end
