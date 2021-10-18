class Preference < ApplicationRecord
    belongs_to :teacher_profile

    enum initial_view: ["dayGridMonth", "timeGridWeek", "timeGridDay"]
end
