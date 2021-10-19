# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
      can :manage, User, user: user
    if user.student?
      can :read, StudentProfile, :first_name, :last_name, :phone, :email, :user_id, :studio_id, :family_id, :grade, :make_up_credits, :school, :gender, :birthday, user: user
      can :update, StudentProfile, :phone, :email, :address, :gender, user: user
      can :read, GuardianProfile, family: user.student_profile.family
      can :read, Family, family: user.student_profile.family
      can :read, Event, student_profile: user.student_profile
      can :read, Event, visible: true, teacher_profile: user.student_profile.teacher
      can :read, Studio, studio: user.student_profile.studio
      can :read, TeacherProfile, studio: user.student_profile.studio
    elsif user.guardian?
      can :read, StudentProfile, :first_name, :last_name, :phone, :email, :user_id, :studio_id, :family_id, :grade, :make_up_credits, :school, :gender, :birthday, family: user.guardian_profile.family
      can :update, StudentProfile, :phone, :email, :address,  family: user.guardian_profile.family
      can :read, GuardianProfile, user: user
      can :read, Family, family: user.guardian_profile.family
      can :read, Event, visible: true, teacher_profile: user.guardian_profile.teacher
      can :read, Event, student_profile: {family: user.guardian_profile.family}
      can :read, Studio, studio: user.guardian_profile.studio
      can :read, TeacherProfile, studio: user.guardian_profile.studio
    end
    return unless user.teacher?
      can :manage, TeacherProfile, user: user
      can :manage, StudentProfile, studio: user.studio
      can :manage, GuardianProfile, studio: user.studio
      can :manage, Event, teacher_profile: user.teacher_profile
      can :manage, Family, studio: user.studio
      can :manage, Preference, teacher_profile: user.teacher_profile
      can :manage, Studio, teacher_profile: user.teacher_profile
  end
end
