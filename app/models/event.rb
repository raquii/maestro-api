class Event < ApplicationRecord
    belongs_to :teacher_profile, inverse_of: :events
    belongs_to :student_profile, inverse_of: :events, optional: :true
    belongs_to :recurring_group, inverse_of: :events, optional: :true

    enum event_type: [:lesson, :group_lesson, :make_up_lesson, :recital, :vacation, :birthday]
    enum attendance: [:present, :absent_notice, :absent_no_notice, :late, :teacher_absent]

    before_save :create_title
   

    def create_title
        if self.title == ""
            if self.student_profile_id.nil?
                self.title = "#{self.event_type.titleize}"
            else
                self.title = "#{self.student_profile.first_name} #{self.student_profile.last_name} - #{self.event_type.titleize}"
            end
        end
    end

    def generate_recurrent_events
       if self.recurring_group_id
            unless self.get_end_date.blank?
                end_date = Time.parse(self.get_end_date)
                byebug
                weeks = (self.start - end_date).seconds.in_weeks.to_i.abs > 52 ? 52 : (self.start - end_date).seconds.in_weeks.to_i.abs
                counter = 0
                while counter < weeks
                    byebug
                    newEvent = self.dup
                    newEvent.recurring_group_id = self.recurring_group_id
                    newEvent.start = self.start.weeks_since(counter+1)
                    newEvent.end = self.end.weeks_since(counter+1)
                    newEvent.save!
                    counter += 1
                end
            else
                counter = 0
                while counter < 52
                    newEvent = self.dup
                    newEvent.recurring_group_id = self.recurring_group_id
                    newEvent.start = self.start.weeks_since(counter+1)
                    newEvent.end = self.end.weeks_since(counter+1)
                    newEvent.save!
                    counter += 1
                end
            end
       end
    end

    def get_end_date
        self.recurring_group.end_date.to_s
    end
end
