class User < ApplicationRecord

  devise :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  belongs_to :family, optional: true
  has_one :studio, foreign_key: :teacher_id, dependent: :destroy
  has_many :students, through: :family
  has_many :students, through: :studio

  enum role: [:teacher, :student, :guardian, :admin]
end
