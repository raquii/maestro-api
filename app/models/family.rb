class Family < ApplicationRecord
    belongs_to :studio, inverse_of: :families
    has_many :students, class_name: 'StudentProfile', inverse_of: :family, dependent: :destroy
    has_many :guardians, class_name: 'GuardianProfile', inverse_of: :family, dependent: :destroy
    has_one :teacher, through: :studio, source: :teacher_profile

    has_many :events, through: :students


    def get_members
        @members = []
        self.students.each{|s| @members << {id: s.id, role: "student", name: "#{s.first_name} #{s.last_name}"}}
        self.guardians.each{|g| @members << {id: g.id, role: "guardian", name: "#{g.first_name} #{g.last_name}"}}
        @members
    end

    def get_names
        @names = ""
        self.students.each{|s| @names.concat("#{s.first_name} #{s.last_name}; ")}
        self.guardians.each{|g| @names.concat("#{g.first_name} #{g.last_name}; ")}
        @names.strip!
    end
end
