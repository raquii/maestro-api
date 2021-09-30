class StudentProfileAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        can :read, StudentProfile, user: user

        return unless user.guardian?
        can :read, StudentProfile, user: {family: user.family}

        return unless user.teacher?
        can :manage, StudentProfile, user:{family:{teacher: user}}

        return unless user.admin?
        can :manage, StudentProfile
    end
end