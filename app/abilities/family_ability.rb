class FamilyAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        if user.student? || user.guardian?
            can :read, Family, id: user.family_id
        end

        return unless user.teacher?
        can :manage, Family, studio: user.studio

        return unless user.admin?
        can :manage, Family
    end
end