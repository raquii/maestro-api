class StudioSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :name
end
