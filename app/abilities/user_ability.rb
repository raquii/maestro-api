class UserAbility
    include CanCan::Ability
    def initialize(user)
        return unless user.present?
        can [:read, :update,], User, id: user.id
        can [:read], User, family_id: user.family_id
       
        return unless user.teacher?
        can :manage, User, studio: {teacher:user}

        return unless user.admin?
        can :manage, User
    end
end