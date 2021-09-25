class StudentProfileAbility
    include CanCan::UserAbility
    def initialize(user)
        
        return unless user.present?``
        can [:read,:update], StudentProfile, user: user

        return unless user.guardian?
        can [:read,:update], StudentProfile, user: {family: user.family}

        return unless user.teacher?
        can :manage, StudentProfile, user:{family:{studio: user.studio}}

        return unless user.admin?
        can :manage, StudentProfile
    end
end