class Family < ApplicationRecord
    belongs_to :studio
    has_many :children, -> { where(role: 1) }, class_name: :User
    has_many :parents, -> { where(role: 2) }, class_name: :User
    has_one :teacher, through: :studio, class_name: :User
    
    has_many :events_as_student, through: :children

    def get_members
        @members = []
        self.children.each{|c| @members << {id: c.id, role: c.role, name: "#{c.first_name} #{c.last_name}"}}
        self.parents.each{|p| @members << {id: p.id, role: p.role, name: "#{p.first_name} #{p.last_name}"}}
        @members
    end

    def get_names
        @names = ""
        self.children.each{|c| @names.concat("#{c.first_name} #{c.last_name}; ")}
        self.parents.each{|p| @names.concat("#{p.first_name} #{p.last_name}; ")}
        @names.strip!
    end
end
