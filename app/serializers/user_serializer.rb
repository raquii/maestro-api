class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  set_type :user

  attributes :first_name, :last_name, :phone, :address, :role, :email

  attribute :studio, if: Proc.new { |record|
    record.teacher?
  } do |object|
    StudioSerializer.new(object.studio)
  end

  attribute :teacher, if: Proc.new{|record| record.family } do |object|
    TeacherSerializer.new(object.family.teacher)
  end
end
