class Student < ApplicationRecord
    has_one :user, as: :role, dependent: :destroy
    belongs_to :family
    has_many :events, dependent: :nullify
end
