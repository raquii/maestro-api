class EventAbility
    include CanCan::Ability
    def initialize(user)
        
        return unless user.present?
        if user.student? || user.guardian?
            can :read, Event, visible: true, teacher: user.family.teacher
            can :update, Event, allow_registration: true, teacher: user.family.teacher, :student
            can :update, Event, student: user, :student
        elsif user.guardian?
            can :update, Event, student: {family: user.family}, :student
        end

        return unless user.teacher?
        can :manage, Event, teacher: user

        return unless user.admin?
        can :manage, Event
    end
end