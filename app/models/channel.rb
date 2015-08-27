class Channel < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :messages
end
