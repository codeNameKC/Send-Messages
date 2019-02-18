require 'test_helper'

class SendMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_message = send_messages(:one)
  end

  test "should get new" do
    get new_send_message_url
    assert_response :success
  end

  test "should create send_message" do
    assert_difference('SendMessage.count') do
      post send_messages_url, params: { send_message: { Message: @send_message.Message, PhoneNumber: @send_message.PhoneNumber } }
    end

    assert_redirected_to send_message_url(SendMessage.last)
  end

    assert_redirected_to send_messages_url
  end
end
