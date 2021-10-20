class EventSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  
  attributes :teacher_profile_id, :student_profile_id, :all_day, :start, :end, :title, :allow_registration, :event_type, :attendance, :visible, :location, :price, :recurring_group_id, :make_up_credit_required, :default_lesson

  attribute :recurring do |object|
    object.recurring_group.present?
  end

  attribute :end_date, if: Proc.new{ |record| record.recurring_group.present? } do |object|
    object.recurring_group.end_date
  end
end
