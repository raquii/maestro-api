class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  set_type :user

  attributes :first_name, :last_name, :phone, :address, :role, :email

  attribute :studio, if: Proc.new { |record|
    record.teacher?
  } do |object|
    StudioSerializer.new(object.studio_as_teacher)
  end

  attribute :preferences, if: Proc.new { |record|
    record.teacher?
  } do |object|
    PreferenceSerializer.new(object.preference)
  end

  attribute :teacher, if: Proc.new{|record| record.family } do |object|
    TeacherSerializer.new(object.teacher)
  end

  attribute :students, if: Proc.new { |record|
    record.teacher?
  } do |object|
    StudentSerializer.new(object.students)
  end

  attribute :events, if: Proc.new { |record|
    record.teacher?
  } do |object|
    EventSerializer.new(object.events)
  end

end
