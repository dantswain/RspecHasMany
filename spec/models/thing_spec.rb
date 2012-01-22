require 'spec_helper'

describe Thing do

  before(:each) do
    @user = User.create!(:name => "Fred")
    @thing = Thing.create!(:name => "Foo")

    @user.things << @thing

    # this is necessary to trigger the callbacks for @thing
    #   I'm ok with this because what will happen in the wild is
    #    a) user will following thing, then at some point later
    #    b) thing is updated (which means a save), and user should
    #        be notified of save
    @thing.save
  end

  it "should have created a relationship" do
    UserFollowingThingRelationship.first.user.should == @user
    UserFollowingThingRelationship.first.thing.should == @thing
  end

  it "should have followers" do
    @thing.reload.followers.should == [@user]
  end

  # I added this just to make sure the callback is run
  it "should run the callback" do
    @user.reload.name.should match("FOLLOWER")
  end
  
end
