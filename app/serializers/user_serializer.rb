class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone, :alt_phone, :address
end
