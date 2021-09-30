class EventAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        can :read, Event, visible: true, teacher: user.family.teacher
        can :update, Event, allow_registration: true, teacher: user.family.teacher, :student
        can :update, Event, student: user, :student
        
        return unless user.guardian?
        can :update, Event, student: {family: user.family}, :student

        return unless user.teacher?
        can :manage, Event, teacher: user

        return unless user.admin?
        can :manage, Event
    end
end