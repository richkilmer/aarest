class UserSerializer < ActiveModel::Serializer
  attributes :id, :account_id, :active, :email, :password_digest, :first_name, :last_name
end
