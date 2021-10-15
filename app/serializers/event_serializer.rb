class EventSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :teacher_id, :student_id, :all_day, :start, :end, :start_time, :end_time, :start_recur, :end_recur, :title, :allow_registration, :event_type, :attendance, :visible, :location, :price, :make_up_credit_required, :default_lesson

  attribute :days_of_week do |object|
    object.days_of_week.digits()
  end
end
