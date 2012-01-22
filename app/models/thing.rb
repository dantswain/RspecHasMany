class Thing < ActiveRecord::Base
  after_save :do_stuff
  
  has_many :user_following_thing_relationships

  # this doesn't work in rspec
  has_many :followers, :through => :user_following_thing_relationships, :source => :user

  # the magic turns out to be in followers.reload, I've also added an
  # update_attributes on the follower here just so that I can check that
  # the callback is being fired
  def do_stuff
    followers.reload.each { |f| f.update_attributes( :name => "FOLLOWER") }
  end
  
end
