class UserAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        can [:read,:update], User, id: user.id

        return unless user.guardian?
        can [:read,:update], User, family_id: user.family_id

        return unless user.teacher?
        can :manage, User, family: {studio: user.studio}

        return unless user.admin?
        can :manage, User
    end
end