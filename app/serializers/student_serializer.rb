class StudentSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower

    attributes :first_name

    attribute :student_profile, if: Proc.new { |record, params|
        record.student?
    } do |object|
        StudentProfileSerializer.new(object.student_profile)
    end
end