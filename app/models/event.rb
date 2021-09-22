class Event < ApplicationRecord
    belongs_to :teacher, dependent: :destroy
    belongs_to :student, optional: true

    enum type: [:lesson, :make_up, :recital, :vacation, :other]
    enum attendance: [:present, :absent_notice, :absent_no_notice, :late, :teacher_absent]

end
