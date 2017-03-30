class UserSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :apellido, :usuario, :twitter
end
