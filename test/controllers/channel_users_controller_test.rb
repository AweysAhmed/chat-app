require 'test_helper'

class ChannelUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:aweys)
    @channel_one = channels(:channel_one)
    @channel_two = channels(:channel_two)
  end

  test "should redirect create when not logged in" do
    sign_out :user
    assert_no_difference 'ChannelUser.count' do
      post channel_channel_user_url(@channel_two)
    end
    assert_redirected_to new_user_session_url
  end

  test "should join channel" do
    assert_difference('ChannelUser.count') do
      post channel_channel_user_url(@channel_two)
    end
  end

  test "should leave channel" do
    assert_difference('ChannelUser.count', -1) do
      delete channel_channel_user_url(@channel_one)
    end
  end
end