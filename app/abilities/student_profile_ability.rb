class StudentProfileAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        can :read, StudentProfile, student: user
        can :read, StudentProfile, student: {family_id: user.family_id}

        return unless user.teacher?
        can :manage, StudentProfile, student:{studio:{teacher_id: user.id}}

        return unless user.admin?
        can :manage, StudentProfile
    end
end