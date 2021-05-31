require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
 def setup
  @channel = Channel.create(name: "Test Channel")
 end

 test "should be valid when name is present" do
   assert @channel.valid?
 end

 test "should be invalid when a name is not present" do
   @channel.name = ""
   assert_not @channel.valid?
 end
end
