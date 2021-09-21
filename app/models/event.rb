class Event < ApplicationRecord
    belongs_to :teacher, dependent: :destroy
    belongs_to :student, :optional
end
