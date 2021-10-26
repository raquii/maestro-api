class TeacherProfileSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attributes :first_name, :last_name, :phone, :address, :email

  attribute :studio_id do |object|
    object.studio.id
  end

  attribute :studio_name do |object|
    object.studio.name
  end

  attribute :preferences do |object|
    PreferenceSerializer.new(object.preference)
  end

  attribute :students do |object|
    StudentProfileSerializer.new(object.students)
  end

  attribute :events do |object|
    EventSerializer.new(object.events.where('start >= ?', (DateTime.now - 1.month)).order(:start).limit(100))
  end

  attribute :next_lesson do |object|
    object.find_next_lesson
  end

  attribute :families do |object|
    FamilySerializer.new(object.families)
  end

  attribute :role do |object|
    object.user.role
  end
end
