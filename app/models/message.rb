class Message < ActiveRecord::Base
  validates :text, presence: true
  belongs_to :channel
end
