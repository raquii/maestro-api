class FamilySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attribute :members do |object|
    object.get_members
  end
end
