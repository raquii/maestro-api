class StudentSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower

    attributes :first_name, :last_name, :phone, :email, :address
    attribute :student_profile do |object| 
        StudentProfileSerializer.new(object.student_profile)
    end

    attribute :guardians, if: Proc.new{|record| record.parents.present? } do |object|
        GuardianSerializer.new(object.parents)
    end

end