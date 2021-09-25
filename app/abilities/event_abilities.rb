class EventAbility
    include CanCan::UserAbility
    def initialize(user)
        
        return unless user.present?
        can :read, Event, visible: true, teacher: user.family.studio.teacher
        can :update, Event, allow_registration: true, teacher: user.family.studio.teacher, :student
        can :update, Event, student: {student_profile: {user: user} }, :student
        return unless user.guardian?
        can :update, Event, student: {student_profile: {user: {family: user.family}} }, :student

        return unless user.teacher?
        can :manage, Event, teacher: user

        return unless user.admin?
        can :manage, Event
    end
end