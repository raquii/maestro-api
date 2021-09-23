class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone, :address, :role, :studio

  def studio
    if self.object.role == "teacher"
      self.object.studio
    else
      self.object.family.studio
    end
  end
end
