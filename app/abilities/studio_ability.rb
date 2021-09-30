class StudioAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        if user.student? || user.guardian?
            can :read, Studio, teacher_id: user.family.teacher.id
        end

        return unless user.teacher?
        can :manage, Studio, teacher_id: user.id

        return unless user.admin?
        can :manage, Studio
    end
end