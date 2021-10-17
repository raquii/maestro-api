class User < ApplicationRecord

  devise :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  enum role: [:teacher, :student, :guardian, :admin]

#student/guardian relationships
  belongs_to :family, optional: true
  belongs_to :studio, optional: true
  has_one :student_profile, foreign_key: :student_id, dependent: :destroy
  has_one :teacher, through: :studio, class_name: :User
  has_many :parents, through: :family, class_name: :User
  has_many :events_as_student, foreign_key: :student_id, class_name: :Event, dependent: :destroy

#guardian relationship
  has_many :children, through: :family, class_name: :User

#teacher relationships
  has_one :studio_as_teacher, class_name: :Studio, foreign_key: :teacher_id, inverse_of: :teacher, dependent: :destroy
  has_one :preference
  has_many :students, through: :studio_as_teacher, class_name: :User
  has_many :guardians, through: :studio_as_teacher, class_name: :User
  has_many :families, through: :studio_as_teacher
  has_many :events, foreign_key: :teacher_id, dependent: :destroy
  
  validates_format_of :first_name, with: /\A([A-ZÀ-ÿa-z][-,À-ÿa-z. ']+[ ]*)+\z/i, message: "can only include letter characters"
  validates_format_of :last_name, with: /\A([A-ZÀ-ÿa-z][-,À-ÿa-z. ']+[ ]*)+\z/i, message: "can only include letter characters"

  after_create :create_studio_and_preferences, if: Proc.new { |user| user.teacher? }

  def get_family_events
    events=self.children.map do |c|
      c.events_as_student
    end
    events.flatten
  end

  def create_studio_and_preferences
    if self.studio_as_teacher.nil?
      self.studio_as_teacher = Studio.create(name:"#{self.first_name} #{self.last_name}'s Studio", teacher_id: self.id)
    end
    if self.preference.nil?
      self.create_preference!()
    end
  end
  
  
end
