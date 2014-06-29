class MessageSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :body

end
