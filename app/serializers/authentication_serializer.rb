class AuthenticationSerializer < ActiveModel::Serializer
  attributes :id, :user, :token, :active
end
