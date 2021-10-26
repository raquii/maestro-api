class TeacherProfile < ApplicationRecord
  belongs_to :user
  has_one :studio, inverse_of: :teacher_profile, dependent: :destroy
  has_one :preference, inverse_of: :teacher_profile, dependent: :destroy
  has_many :students, through: :studio, class_name: 'StudentProfile'
  has_many :guardians, through: :studio, class_name: 'GuardianProfile'
  has_many :families, through: :studio, inverse_of: :teacher
  has_many :events, inverse_of: :teacher_profile, dependent: :destroy
  
  accepts_nested_attributes_for :studio
  after_create :create_studio_and_preferences

  def create_studio_and_preferences
    if self.studio.nil?
      self.create_studio!(name:"#{self.first_name} #{self.last_name}'s Studio")
    end
    if self.preference.nil?
      self.create_preference!()
    end
  end

  def find_next_lesson
    self.events.where('start >= ?', DateTime.now).order(:start).limit(1)[0]
  end

end
