class User < ActiveRecord::Base

  has_many :user_following_thing_relationships
  has_many :things, :through => :user_following_thing_relationships
  
end
