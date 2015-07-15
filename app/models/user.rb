class User < ActiveRecord::Base
  has_many :tracks
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 4}
end

