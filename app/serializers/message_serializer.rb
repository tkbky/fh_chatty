class MessageSerializer < ActiveModel::Serializer
  attributes :text

  has_one :channel
end
