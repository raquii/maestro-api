class EventSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :teacher_id, :student, :all_day, :start, :end, :start_time, :end_time, :start_recur, :end_recur, :title, :allow_registration, :event_type, :attendance, :visible, :location, :price, :make_up_credit_required, :default_lesson

  attribute :days_of_week, if: Proc.new { |record|
    record.days_of_week?
  } do |object|
    object.days_of_week.digits()
  end

  # attribute :student do |object|
  #   "#{object.student.first_name} #{object.student.last_name}"
  # end
end
