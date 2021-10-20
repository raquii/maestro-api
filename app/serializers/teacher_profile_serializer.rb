class TeacherProfileSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attributes :first_name, :last_name, :phone, :address, :email

  attribute :studio do |object|
    StudioSerializer.new(object.studio)
  end

  attribute :preferences do |object|
    PreferenceSerializer.new(object.preference)
  end

  attribute :students do |object|
    StudentProfileSerializer.new(object.students)
  end

  attribute :events do |object|
    EventSerializer.new(object.events.limit(100))
  end

  attribute :families do |object|
    FamilySerializer.new(object.families)
  end

  attribute :role do |object|
    object.user.role
  end
end
