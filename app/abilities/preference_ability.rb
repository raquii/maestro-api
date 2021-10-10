class PreferenceAbility
    include CanCan::Ability
    def initialize(user)

        return unless user.teacher?
        can :manage, Preference, user: user

        return unless user.admin?
        can :manage, Preference
    end
end