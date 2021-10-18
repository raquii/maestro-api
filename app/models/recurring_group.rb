class RecurringGroup < ApplicationRecord
    has_many :events, inverse_of: :recurring_group, dependent: :destroy
end
