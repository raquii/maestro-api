class TeacherSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  set_type :user

  attributes :first_name, :last_name, :phone, :address, :email, :role

  attribute :studio do |object|
    StudioSerializer.new(object.studio_as_teacher)
  end

  attribute :preferences do |object|
    PreferenceSerializer.new(object.preference)
  end

  attribute :students do |object|
    StudentSerializer.new(object.students)
  end

  attribute :events do |object|
    EventSerializer.new(object.events)
  end

  attribute :families do |object|
    FamilySerializer.new(object.families)
  end
end
