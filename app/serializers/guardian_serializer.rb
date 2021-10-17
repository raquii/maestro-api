class GuardianSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    set_type :user
  
    attributes :first_name, :last_name, :phone, :address, :role, :email
    
    attribute :user_id do |object|
        object.id
    end
end
  