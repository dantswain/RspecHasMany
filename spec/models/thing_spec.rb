require 'spec_helper'

describe Thing do

  before(:each) do
    @user = User.create!(:name => "Fred")
    @thing = Thing.create!(:name => "Foo")

    @user.things << @thing

    # it doesn't matter if we do this or not
    # @thing.save
    # @user.save
  end

  it "should have created a relationship" do
    UserFollowingThingRelationship.first.user.should == @user
    UserFollowingThingRelationship.first.thing.should == @thing
  end

  it "should have followers" do
    @thing.followers.should == [@user]
  end
  
end
