class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :account_id, :active
end
