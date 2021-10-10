class StudioAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        if user.student? || user.guardian?
            can :read, Studio, teacher: user.teacher
        end

        return unless user.teacher?
        can :manage, Studio, teacher: user

        return unless user.admin?
        can :manage, Studio
    end
end