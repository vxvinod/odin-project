class User < ActiveRecord::Base
  attr_accessible :password, :username

  validates :username , length: {minimum: 5} ,uniqueness: true , presence: true
  has_many :posts
  has_many :comments
end
