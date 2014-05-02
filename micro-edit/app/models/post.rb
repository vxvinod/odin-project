class Post < ActiveRecord::Base
  attr_accessible :description, :title ,:user_id
  validates :title , uniqueness: true , presence: true , length: {minimum: 5}
  validates :description , presence:true
  belongs_to :user
  has_many :comments
end
