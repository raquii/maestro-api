### TO DO ###
# make birthday creation a recurring job
#


class StudentProfile < ApplicationRecord
    belongs_to :user, inverse_of: :student_profile, optional: :true
    belongs_to :family, inverse_of: :students
    belongs_to :studio, inverse_of: :students, optional: true
    has_one :teacher, through: :studio, source: :teacher_profile
    has_many :guardians, through: :family, source: :guardians
    has_many :events, inverse_of: :student_profile

    enum status: [:active, :lead, :waiting, :trial, :inactive]

    after_create :add_birthday_to_calendar

    def add_birthday_to_calendar
        if self.birthday.present?
            birthday = self.birthday
            year = Date.current.year
            group = RecurringGroup.create()
            Event.create(
                title: "#{self.first_name} #{self.last_name}'s Birthday!", 
                event_type: 5, 
                start: birthday.change(year:year), 
                all_day:true, 
                teacher_profile:self.teacher, 
                student_profile:self,
                visible: true,
                allow_registration: false,
                recurring_group: group
            )
        end
    end
end
