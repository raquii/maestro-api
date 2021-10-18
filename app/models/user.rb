class User < ApplicationRecord

  devise :invitable, :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  enum role: [:teacher, :student, :guardian, :admin]

  has_one :teacher_profile, inverse_of: :user, dependent: :destroy
  has_one :guardian_profile, inverse_of: :user
  has_one :student_profile, inverse_of: :user

  has_one :studio, through: :teacher_profile
  has_one :preference, through: :teacher_profile
  has_many :students, through: :teacher_profile
  has_many :guardians, through: :teacher_profile
  has_many :families, through: :teacher_profile
  has_many :events, through: :teacher_profile

end
