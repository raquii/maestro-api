class Family < ApplicationRecord
    belongs_to :studio
    has_many :students, dependent: :destroy
    has_many :parents, dependent: :destroy
    has_many :events, through: :students
end
