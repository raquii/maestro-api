class FamilySerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attribute :members do |object|
    object.get_members
  end

  attribute :names do |object|
    object.get_names
  end
  
end
