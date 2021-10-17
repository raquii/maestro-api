class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  set_type :user

  attributes :first_name, :last_name, :phone, :address, :role, :email

  attribute :teacher, if: Proc.new{|record| record.family } do |object|
    UserSerializer.new(object.teacher)
  end

  attribute :family, if: Proc.new{|record| record.family } do |object|
    FamilySerializer.new(object.family)
  end

end
