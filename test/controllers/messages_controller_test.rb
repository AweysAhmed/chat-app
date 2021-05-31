require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:aweys)
    @channel = channels(:channel_one)
  end

  test "should redirect create when not logged in" do
    sign_out :user
    assert_no_difference 'Message.count' do
      post channel_messages_url(@channel), params: { message: { body: "Lorem ispum" } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should create message" do
    assert_difference('Message.count') do
      post channel_messages_url(@channel), params: { message: { body: "Wu-Tang" } }
    end
  end
end