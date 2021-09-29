class TeacherSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :id
end
