class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :password, presence: true
  validates :password, confirmation: true
end
