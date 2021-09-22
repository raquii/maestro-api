class User < ApplicationRecord

  devise :database_authenticatable, 
  :registerable,
  :recoverable, 
  :rememberable, 
  :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  belongs_to :role, polymorphic: true

  scope :teachers, -> {where(role_type: "Teacher")}
  scope :students, -> {where(role_type: "Student")}
  scope :parents, -> {where(role_type: "Parent")}
end
