class StudentProfileSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attributes :grade, :make_up_credits, :status, :adult, :user_id, :default_lesson_duration, :default_lesson_price
end
