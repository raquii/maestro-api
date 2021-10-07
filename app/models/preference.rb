class Preference < ApplicationRecord
    belongs_to :user, dependent: :destroy

    enum initial_view: ["dayGridMonth", "timeGridWeek", "timeGridDay"]
end
