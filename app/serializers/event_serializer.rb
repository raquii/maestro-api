class EventSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :teacher_profile_id, :student_profile, :all_day, :start, :end, :title, :allow_registration, :event_type, :attendance, :visible, :location, :price, :recurring_group_id, :make_up_credit_required, :default_lesson

end
