require 'test_helper'

class SendEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_email = send_emails(:one)
  end

  test "should get new" do
    get new_send_email_url
    assert_response :success
  end

  test "should create send_email" do
    assert_difference('SendEmail.count') do
      post send_emails_url, params: { send_email: { Email: @send_email.Email, Message: @send_email.Message } }
    end

    assert_redirected_to send_email_url(SendEmail.last)
  end

    assert_redirected_to send_emails_url
  end
end
