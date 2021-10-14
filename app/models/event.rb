class Event < ApplicationRecord
    belongs_to :teacher, class_name: :User, dependent: :destroy
    belongs_to :student, class_name: :User, optional: true

    enum type: [:lesson, :group_lesson, :make_up_lesson, :recital, :vacation, :birthday]
    enum attendance: [:present, :absent_notice, :absent_no_notice, :late, :teacher_absent]

end
