class Thing < ActiveRecord::Base
  after_save :do_stuff
  
  has_many :user_following_thing_relationships
  has_many :followers, :through => :user_following_thing_relationships, :source => :user
   # def followers
   #   user_following_thing_relationships.all.map{ |r| r.user }
   # end

  def do_stuff
    puts "UserFollowingThingRelationship.all:  #{UserFollowingThingRelationship.all.inspect}"
    unless new_record?
      _followers = UserFollowingThingRelationship.where(:thing_id => id).map{ |r| r.user }
      puts "_followers: #{_followers.inspect}"
      _followers.each { |f| puts "followed by #{f.name}" }
    end
  end
  
end
