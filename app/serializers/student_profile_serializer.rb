class StudentProfileSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower

  attributes :first_name, :last_name, :phone, :email, :address, :grade, :make_up_credits, :status, :adult, :default_lesson_duration, :default_lesson_price, :birthday, :gender, :school, :notes, :lesson_reminder_emails, :lesson_reminder_sms

  attribute :guardians, if: Proc.new{|record| record.guardians.present? } do |object|
    GuardianProfileSerializer.new(object.guardians)
  end

end
