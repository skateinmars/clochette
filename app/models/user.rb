class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true

  validates_presence_of :password, on: :create
end
