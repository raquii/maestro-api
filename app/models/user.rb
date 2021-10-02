class User < ApplicationRecord

  devise :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  belongs_to :family, optional: true
  has_one :studio, foreign_key: :teacher_id, dependent: :destroy
  has_one :student_profile, dependent: :destroy

  has_many :children, through: :family
  has_many :students, through: :studio

  has_many :events, foreign_key: :teacher_id, dependent: :destroy
  has_many :events_as_student, foreign_key: :student_id, class_name: :Event

  validates_format_of :first_name, with: /\A([A-ZÀ-ÿa-z][-,À-ÿa-z. ']+[ ]*)+\z/i, message: "can only include letter characters"
  validates_format_of :last_name, with: /\A([A-ZÀ-ÿa-z][-,À-ÿa-z. ']+[ ]*)+\z/i, message: "can only include letter characters"

  def get_family_events
    events=self.children.map do |c|
      c.events_as_student
    end
    events.flatten
  end

  enum role: [:teacher, :student, :guardian, :admin]
end
