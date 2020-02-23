class SessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :finish_at
end
