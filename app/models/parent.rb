class Parent < ApplicationRecord
    has_one :user, as: :role, dependent: :destroy
    belongs_to :family
end
