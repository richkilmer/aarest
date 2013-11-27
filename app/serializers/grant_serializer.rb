class GrantSerializer < ActiveModel::Serializer
  attributes :id, :group_id, :service_id, :right, :resource_class, :resource_identifier, :expires_at
end
