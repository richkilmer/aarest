class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :host, :active, :key
end
