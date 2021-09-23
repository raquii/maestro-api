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
  has_many :events_as_student, through: :student_profile

  enum role: [:teacher, :student, :guardian, :admin]
end
