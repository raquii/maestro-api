class Event < ApplicationRecord
    belongs_to :teacher_profile, inverse_of: :event
    belongs_to :student_profile, inverse_of: :event, optional: :true

    enum event_type: [:lesson, :group_lesson, :make_up_lesson, :recital, :vacation, :birthday]
    enum attendance: [:present, :absent_notice, :absent_no_notice, :late, :teacher_absent]

    before_create :create_title

    def create_title
        if self.title == ""
            if self.student_id.nil?
                self.title = "#{self.event_type}"
            else
                self.title = "#{self.student.first_name} #{self.student.last_name} - #{self.event_type.titleize}"
            end
        end
    end
end
