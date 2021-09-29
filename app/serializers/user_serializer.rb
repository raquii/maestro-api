class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  set_type :user

  attributes :first_name, :last_name, :phone, :address, :role, :email

  attribute :studio, if: Proc.new { |record, params|
    record.teacher?
  } do |object|
    StudioSerializer.new(object.studio)
  end

  attribute :student_profile, if: Proc.new { |record, params|
    record.student?
  } do |object|
    StudentProfileSerializer.new(object.student_profile)
  end

  attribute :students, if: Proc.new { |record, params|
    record.teacher?
  } do |object|
    UserSerializer.new(object.students)
  end

  attribute :children, if: Proc.new { |record, params|
    record.guardian?
  } do |object|
    UserSerializer.new(object.children)
  end

  attribute :events do |object|
    if object.teacher?
      EventSerializer.new(object.students)
    elsif object.student?
      EventSerializer.new(object.events_as_student)
    else
      EventSerializer.new(object.get_family_events)
    end
  end




end
