class EventSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :all_day, :start, :end, :start_time, :end_time, :start_recur, :end_recur, :title, :allow_registration, :type, :attendance, :visible, :location, :price
  belongs_to :teacher, record_type: :user
  belongs_to :student, record_type: :user
end
